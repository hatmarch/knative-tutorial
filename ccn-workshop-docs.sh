#!/bin/bash

set -euo pipefail

git clone -b gh-pages https://github.com/hatmarch/knative-tutorial.git publish
cd publish
rm -rf *
cp -a ../gh-pages/* .
git add --all .
git commit -m"Automated Publish"
git push origin
cd ..
rm -rf publish