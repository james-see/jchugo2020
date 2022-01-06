#!/bin/sh
set -ex
icons="twitter github rss"

dest=fontawesome
url=https://raw.githubusercontent.com/ionic-team/ionicons/master/src/svg/logo-

cd ../causes2020/
mkdir -p "${dest}"
for icon in $icons; do
  icon="${icon}.svg"
  wget -O "${dest}/${icon}" "${url}${icon}"
done
