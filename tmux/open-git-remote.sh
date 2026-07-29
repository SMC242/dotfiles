#!/usr/bin/env bash

cd "$1" || exit 1
url=$(git remote get-url origin | tr -d "\n")
echo -n "Original URL: $url"
if [[ "$url" =~ \.wiki(\.git)?$ ]]; then
  echo "Matched"
  url=$(echo -n "$url" | sed -r "s/\.wiki(\.git)?/\/wiki/")
else
  echo "Did not match"
fi


echo -n "$url"
xdg-open "$url" || open "$url"
