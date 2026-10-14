#!/bin/sh
printf '\033c\033]0;%s\a' first practice 3d game project
base_path="$(dirname "$(realpath "$0")")"
"$base_path/first practice 3d game project.x86_64" "$@"
