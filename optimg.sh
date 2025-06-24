#!/usr/bin/env bash

##
# Optimized un-committed PNG images (staged or not).
#
# This script depends on optipng, git and some standard Unix
# command line utilities.
#

optipng -o7 $(
  git status --short --porcelain \
    | grep '\.png$' \
    | tr -s ' ' \
    | cut -d ' ' -f 2 \
  )

##
# The git status command outputs different number of spaces between the
# output columns depending on whether the files have been already staged
# or not. By squeezing the spaces, we make sure the cut command works
# for staged and non-staged images on the output of git status.
##
