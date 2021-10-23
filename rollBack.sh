#!/usr/bin/env bash
echo -e "git pull --prune"
git pull --prune

tags=$(git tag)
echo -e "\nTags:\n$tags"

echo -e ""
read -r -p "Type a tag to Rollback:" tag

if [[ $tag =~ v0.0.[0-9]*-trunk\.0 ]]; then
    if [[ $tags =~ .*$tag* ]]; then
        echo -e "\nRealizando Rollback a $tag\n"
        git checkout -b $tag
        git diff trunk > diff.patch
        git checkout trunk
        cat diff.patch | git apply
        git commit -am "Rolled back to version $tag"
        git push origin trunk
        rm diff.patch
    else
        echo -e "\nError: El tag $tag no existe"
    fi
else
    echo -e "\nError: El tag $tag no tiene la estructura adecuada"
fi
