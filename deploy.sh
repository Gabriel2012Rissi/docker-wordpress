#!/bin/bash
DIRECTORY=${PWD}/docker

dockerArray=("secrets" "volumes" "volumes/wp-local" "volumes/db-local")

if [ -d "$DIRECTORY" ]; then
  echo "docker directory already exists..."
  exit 0
else
  for dockerPaths in "${dockerArray[@]}"
  do
    mkdir -p "$DIRECTORY/$dockerPaths"
  done
  if [ -d "$DIRECTORY/secrets" ]; then
    echo "wp-user" >> "$DIRECTORY/secrets/db_user.txt"
    gpg --gen-random --armor 1 14 >> "$DIRECTORY/secrets/root_password.txt"
    gpg --gen-random --armor 1 14 >> "$DIRECTORY/secrets/db_password.txt"
  fi
  echo "docker directory was created successfully... everything is ready!!"
  exit 0
fi
