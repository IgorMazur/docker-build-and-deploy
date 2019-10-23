proj_path_host=$(PWD)/site
image=site
tag := $(shell date +'%Y-%m-%d')
tag_stage := stage_$(tag)
temp_dir=./temp
tar_filename=./temp/nginx.stage.tar

nginx_build:
	docker rmi -f $(image):$(tag)
	docker build -t $(image):$(tag) -f Dockerfile.nginx $$GATSBY_ROOT/public

nginx_stage_build:
	docker rmi -f nginx:base || true
	docker build -t nginx:base -f Dockerfile.nginx.base.basic-auth .
	docker rmi -f $(image):$(tag_stage)
	docker build -t $(image):$(tag_stage) -f Dockerfile.nginx.stage `python -c 'import os.path; print(os.path.realpath("$(proj_path_host)/public"))'`

nginx_stage_run:
	docker run -d -p 80:80 -p 443:443 $(image):$(tag_stage)

nginx_stage_publish:
	mkdir -p $(temp_dir)
	docker save -o $(tar_filename) $(image):$(tag_stage)
	scp $(tar_filename) root@ecrops.stage:/root/images
	# rm $(tar_filename)

# .EXPORT_ALL_VARIABLES:
# TEST_ENV=SUPER_TEST

# test_env:
# 	echo $$TEST_ENV

include .makerc

test_makerc:
	echo $$TEST_ENV
