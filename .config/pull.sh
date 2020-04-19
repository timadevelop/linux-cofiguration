#!/bin/bash

FILEMAP_FILE="./filemap"

echo_err(){
  echo -e "\e[31mError: $* \e[0m" >>/dev/stderr
}

echo_warn(){
  echo -e "\e[33m$*\e[0m"
}
echo_success(){
  echo -e "\e[32m$*\e[0m"
}

create_dir() {
  printf "Creating a new folder $1... "
  mkdir -p $1
}

assure_destination() {
  [[ ! -d $1 ]] && create_dir $1
  if [[ -d $1 ]]; then
    return 0
  else
    printf "Could not create a folder $1\n"
    return 1
  fi
}

pull_node() {
  node=$(echo $1 | sed "s|~|$HOME|")
  destination=$2
  printf "\nTrying to copy $node to $destination....\n"

  [[ ! -e $node ]] && echo_err "Node $node does not exists. Skipping." && return 1

  assure_destination $destination
  if [[ ! -d $destination ]]; then
    echo_err "Destination folder $destination does not exists. Skipping."
    return 1
  fi

  rsync -rvi $node $destination
  echo_success "$node -> $destination"
  return 0
}

pull_configs() {
  while read -r line; do
      [[ -z $line || "$line" =~ ^#.*$ ]] && continue
      pull_node $line
  done < "$FILEMAP_FILE"
}

pull_configs

