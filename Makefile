include .makerc
include gatsby/Makefile
include nginx/Makefile

init: assert_not_inited_yet
	cp .makerc.bak .makerc
	@echo "Edit .makerc to provide proper environment variables for build scripts"

assert_not_inited_yet:
	@test ! -f ".makerc" || ( echo ".makerc already exists, you may want to edit it"; exit 1; )
