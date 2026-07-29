#!/usr/bin/env bash

cd "$1" || exit 1
url=$(git remote get-url origin | tr -d "\n")
if [[ "$url" =~ \.wiki(\.git)?$ ]]; then
  url=$(sed -r "s/\.wiki(\.git)?/\/wiki/" <<< "$url")
fi


xdg-open "$url" || open "$url"
