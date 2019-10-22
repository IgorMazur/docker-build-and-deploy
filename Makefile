proj_path_orig=../www/site
proj_path_host=$(PWD)/site
proj_path_cont=/site
image=site
docker_run=docker run -it --rm -v $(proj_path_host):$(proj_path_cont)
bind_gatsby_port=-p 8000:8000

init:
	ln -s $(proj_path_orig) $(proj_path_host)

assert_site_is_mounted:
	@[ -d "./site" ] || ( \
		echo "Directory './site' does not exist." \
		&& echo "Link your Gatsby project directory containing package.json to './site' directory, e.g.: " \
		&& echo "ln -s ../<your-project>/<gatsby-site> ./site" \
		&& exit 1 \
	)
	@[ -f "./site/package.json" ] || ( \
		echo "File './site/package.json' does not exist" \
		&& exit 1 \
	)

docker_build: assert_site_is_mounted
	docker build --rm -t site .

docker_run: assert_site_is_mounted
	$(docker_run) $(image) $(cmd)

docker_shell: assert_site_is_mounted
	$(docker_run) $(image) /bin/sh

gatsby_develop: assert_site_is_mounted
	$(docker_run) $(bind_gatsby_port) $(image) develop

gatsby_stage: assert_site_is_mounted
	$(docker_run) $(bind_gatsby_port) $(image) stage

gatsby_build: assert_site_is_mounted
	$(docker_run) $(image) build
