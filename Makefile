proj_path_orig=../www/site
proj_path_host=$(PWD)/site
proj_path_cont=/site
image=site
docker_run=docker run -it --rm -v $(proj_path_host):$(proj_path_cont) -p 8000:8000 $(image)

init:
	ln -s $(proj_path_orig) $(proj_path_host)

docker_build:
	docker build --rm -t site .

gatsby_develop: docker_build
	$(docker_run) develop

gatsby_stage: docker_build
	$(docker_run) stage

gatsby_build: docker_build
	$(docker_run) build

gatsby_run_cmd: docker_build
	$(docker_run) <YOUR-COMMAND-HERE>
