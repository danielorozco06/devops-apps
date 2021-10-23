#!/usr/bin/env bash
git pull --prune
tag=$(git tag | sed -n 2p)
git checkout -b $tag
git diff trunk > diff.patch
git checkout trunk
cat diff.patch | git apply
git commit -am "Rolled back to version $tag"
# git push origin trunk
