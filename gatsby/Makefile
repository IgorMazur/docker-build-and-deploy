container_root=/site

docker_image=site
docker_image_tag=dev
docker_run=docker run -it --rm -v `./helpers/realpath.py $$GATSBY_ROOT`:$(container_root)
docker_bind_ports=-p 8000:8000

assert_correct_gatsby_root:
	@[ -d "$$GATSBY_ROOT" ] || ( \
		echo "Directory GATSBY_ROOT=$$GATSBY_ROOT does not exist" \
		&& exit 1 \
	)
	@[ -f "$$GATSBY_ROOT/package.json" ] || ( \
		echo "File '$$GATSBY_ROOT/package.json' does not exist" \
		&& exit 1 \
	)

gatsby__docker_build: assert_correct_gatsby_root
	docker build --rm -t $(docker_image):$(docker_image_tag) -f $$GATSBY_DOCKERFILE .

gatsby__docker_run: assert_correct_gatsby_root
	$(docker_run) $(docker_image):$(docker_image_tag) $(cmd)

gatsby__docker_shell: assert_correct_gatsby_root
	$(docker_run) $(docker_image):$(docker_image_tag) /bin/sh

gatsby_develop: assert_correct_gatsby_root
	$(docker_run) $(docker_bind_ports) $(docker_image):$(docker_image_tag) develop

gatsby_stage: assert_correct_gatsby_root
	$(docker_run) $(docker_bind_ports) $(docker_image):$(docker_image_tag) stage

gatsby_build: assert_correct_gatsby_root
	$(docker_run) $(docker_image):$(docker_image_tag) build
