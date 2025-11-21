#!/bin/bash

run_ls() {
	local cmd="ls $*"
	echo "실행할 명령: $cmd"
	eval "$cmd"
}

run_ls "$@"
