#!/bin/bash
# rebuild docs if there's update in the github repository
#
WATCH_FILE=/tmp/update_docs.github
[[ -s "$WATCH_FILE" ]] || exit 1
# can't delete webserver's files in the /tmp direcotry
echo -n '' > $WATCH_FILE

cd `dirname "$0"`
/usr/bin/git checkout --quiet .
/usr/bin/git pull --quiet origin 

# add front matter to all markdown files
IFS="
"
for f in `find . -name \*.markdown -type f` ; do
  if ! sed -n 1p "$f" | egrep -q '^---$'; then
    title=`basename "$f" .markdown`
    #echo "Adding fron matter title='$title' to '$f'"
    echo -e "---\ntitle: ${title}\n---\n" > "$f".$$
    cat "$f" >> "$f".$$
    mv "$f".$$ "$f"
  fi
done

#echo "Building static site"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
jekyll build -q
