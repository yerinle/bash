#!/bin/bash

project_name="shopper"
projects_dir="/Users/yerinle/dev/projects"
foa_dir="${projects_dir}/${project_name}"

cd $foa_dir

#update project
result=$(git pull)

if [[ "$result" =~ "up-to-date." ]]; then
  echo "project is up to date"
  build_output=$(gradle test)
  if [[ "$build_output" =~ "BUILD SUCCESSFUL" ]]; then
  	echo "project built successfully"
  	gradle jettyRun &
  fi
fi