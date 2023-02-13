image_version = 20230213.0
utilname = test_util
build_container:
	docker build -t phiroict/generic-project-builder:$(image_version) -f infra/local/Dockerfile  .
run_container_test:
	docker run -ti --rm phiroict/generic-project-builder:$(image_version) sh
run_container:
	mkdir -p $(utilname)
	docker run -ti --rm --mount type=bind,source=$(shell pwd)/$(utilname),target=/src/src/$(utilname) phiroict/generic-project-builder:$(image_version)  bash ./generate-project.sh $(utilname) bash true
reset_container:
	- rm -rf "$(utilname)"
rerun_container: reset_container build_container run_container