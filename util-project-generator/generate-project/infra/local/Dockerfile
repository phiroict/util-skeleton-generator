FROM alpine:3.17.1
# Prerequesites
RUN apk add wget gzip tar bash tree
# Get adr tools
RUN wget https://github.com/npryce/adr-tools/archive/refs/tags/3.0.0.tar.gz -O adr.tar.gz
RUN ls -l
RUN tar zfvx adr.tar.gz
RUN cp /adr-tools-3.0.0/src/* /usr/local/bin/
RUN rm -rf /adr*
# Get the generate-project source
RUN mkdir -p /src
WORKDIR /src
COPY . .
RUN mkdir -p result
WORKDIR /src/src
CMD ["bash", "./generate-project.sh"]