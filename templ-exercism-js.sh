#!/usr/bin/env bash

#
# USAGE:
#
# ./templ-exercism-js.sh CHALLENGE-TITLE
#

cd ~/source/devnotes || exit 1

if [[ $# < 1 ]]
then
  printf 1>&2 'Provide the title parameter. Exiting.\n'
  exit 1
fi

title="$1"
target_dir=./content/Exercism/JavaScript
target_file="$title Exercism Solution in JavaScript.md"
target_path="$target_dir/$target_file"

##
# No need for cat. Redirection is enough to read the file.
#
# • https://porkmail.org/era/unix/award
#
0< ./content/_drafts/EXERCISM-TEMPL-JS.md \
1> "$target_path" \
sed "s/TITLE/$title/g"

printf 'Created file:\n\n%s\n' " $target_path "
