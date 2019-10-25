#!/bin/bash

docker_exec () {
  image_name=$1
  exec_command=$2
  tmp_container=`openssl rand -hex 12`
  echo "Temp docker container $tmp_container"
  docker create $image_name --name $tmp_container
  docker exec -ti $tmp_container sh -c "$exec_command"
  docker rm $tmp_container
}
