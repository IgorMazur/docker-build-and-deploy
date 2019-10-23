nginx_image=nginx
nginx_tag_base=base
nginx_tag_stage := stage_$(shell date +'%Y-%m-%d.%H_%M')
nginx_dockerfile_base=./nginx/Dockerfile.base
nginx_dockerfile_stage=./nginx/Dockerfile.stage

image_tag_stage=$(nginx_image):$(nginx_tag_stage)
image_tag_stage_file=.image_tag_stage

nginx_base_build:
	docker rmi -f $(nginx_image):$(nginx_tag_base) || true
	docker build -t $(nginx_image):$(nginx_tag_base) -f $(nginx_dockerfile_base) $$GATSBY_ROOT

nginx_stage_build: nginx_base_build
	docker rmi -f $(image_tag_stage)
	docker build -t $(image_tag_stage) -f $(nginx_dockerfile_stage) ./nginx
	echo $(image_tag_stage) > $(image_tag_stage_file)

nginx_stage_run:
	docker run -d -p 80:80 -p 443:443 `cat $(image_tag_stage_file)`
