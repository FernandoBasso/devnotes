#!/usr/bin/env bash

##
# This script formats the date to add st, nd, rd or th to the
# day, and commits the staged files with a message like:
#
#   ”Save notes on Fri, Jun the 21th, 2025 at 14:49“
##

day_with_suffix () {
  day=$(date +%e)

  case $day in
    1|21|31) printf "${day}st";;
    2|22) printf "${day}nd";;
    3|23) printf "${day}rd";;
    *) printf "${day}th";;
  esac
}

function datefmt () {
  date +"%a, %b the $(day_with_suffix), %Y at %H:%M"
}

git commit -m "Save notes on $(datefmt)"
