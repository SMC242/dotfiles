#!/usr/bin/env bash

cd "$1" || exit 1
url=$(git remote get-url origin)

xdg-open "$url"
