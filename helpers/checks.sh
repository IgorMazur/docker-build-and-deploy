#!/bin/bash

dir_exists () {
  if [ -d "$1" ]; then
    return 0
  fi
  return 1
}

dir_has_content () {
  if dir_exists $1; then
    if find "$1" -mindepth 1 -print -quit 2>/dev/null | grep -q .; then
      return 0
    fi
  fi
  return 1
}
