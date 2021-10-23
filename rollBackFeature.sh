#!/usr/bin/env bash
echo -e "git pull --prune"
git pull --prune

tags=$(git tag)
echo -e "\nTags:\n$tags"

echo -e ""
read -r -p "Type a tag to Rollback:" tag

if [[ $tag =~ v0.0.[0-9]*-trunk\.0 ]]; then
    if [[ $tags =~ .*$tag* ]]; then
        echo -e "\ngit checkout $tag"
        git checkout $tag

        echo -e "\ngit diff trunk > diff.patch"
        git diff trunk > diff.patch

        echo -e "\ngit checkout trunk"
        git checkout trunk    

        echo -e "\ngit checkout -b feature/rollback"
        git checkout -b feature/rollback

        echo -e "\ncat diff.patch | git apply"
        cat diff.patch | git apply

        echo -e "\ngit commit -am Rolled back to version $tag"
        git commit -am "Rolled back to version $tag"

        echo -e "\ngit push origin feature/rollback"
        git push origin feature/rollback

        echo -e "\ngit checkout trunk"
        git checkout trunk      
        
        echo -e "\ngit branch -D feature/rollback"
        git branch -D feature/rollback

        echo -e "\nrm diff.patch"
        rm diff.patch
    else
        echo -e "\nError: El tag $tag no existe"
    fi
else
    echo -e "\nError: El tag $tag no tiene la estructura adecuada"
fi
