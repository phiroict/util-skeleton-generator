import json
import os
import time
from os.path import exists

import requests
import urllib3
from urllib3.exceptions import InsecureRequestWarning


class CVECollector:
    def __init__(self, regenerate=False):
        self.api_url = "https://access.redhat.com/hydra/rest/securitydata/cve.json?after={}per_page={}&page={}&product={}&package=openshift4"
        self.page = 1
        self.per_page = 1000
        self.cvs = []
        self.usable_cvs = []
        self.cut_off_date = "2020-01-01"
        self.regenerate = regenerate
        urllib3.disable_warnings(InsecureRequestWarning)

    def collect(self):
        output_file = os.path.abspath(os.path.dirname(__file__)) + "/" + "current_CVEs.json"
        if not exists(output_file) or self.regenerate:
            
            page = 1
            per_page = 1000
            cvs = []

            while True:
                call_url = self.api_url.format(self.cut_off_date, per_page, page, "openshift")
                print("url to call: {}".format(call_url))
                r = requests.get(call_url, verify=False)
                collection_responses = r.json()
                print("Processing page:{}, found {} entries".format(page, len(collection_responses)))
                if len(collection_responses) == 0 or page > 200:
                    break
                else:
                    cvs = cvs + collection_responses
                    page += 1

            print("Number of CVEs in total: {}".format(len(cvs)))

            with open(output_file, "w") as json_writer:
                json.dump(cvs, json_writer, indent=2)
            return cvs
        else:
            print("Using the existing downloaded file from {}".format(
                time.strftime("%Y-%m-%d %H:%M:%S", time.localtime(os.stat(output_file).st_mtime))))


if __name__ == "__main__":
    collector = CVECollector(True)
    CVEs_collected = collector.collect()
