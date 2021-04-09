#!/bin/bash

mkdir temp-help

cd temp-help

# idk why this automatically uses https
git clone https://github.com/acmutd/help-guide.wiki.git

# and this one uses ssh, maybe wikis don't support ssh or cli
git clone git@github.com:acmutd/help-guide.git

cd help-guide

ls | xargs -I % rm -rf %

cd ../help-guide.wiki

ls | sed 's/"/\\"/g' | xargs -I % cp % ../help-guide

cd ../help-guide

find . -maxdepth 1 -type f -name "*.md" ! '(' -name '_Footer.md' -o -name '_Sidebar.md' ')' | sed 's/"/\\"/g' | xargs -I % sh -c 'cat _Footer.md >> %' 

echo "guide.acmutd.co" > CNAME

git add .

git commit -m "Update Stuff"

git push --force
