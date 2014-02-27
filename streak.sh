#!/bin/bash

current=$(date -j -v-2000d)
counter=1

while [ $counter -le 2000 ]; do
    export GIT_AUTHOR_DATE="$current"
    export GIT_COMMITTER_DATE=$GIT_AUTHOR_DATE
    git commit --allow-empty -m "$(fortune)"

    echo $GIT_AUTHOR_DATE

    current=$(date -j -v+1d -f "%a %b %d %T %Z %Y" "$current")

    counter=$(( $counter + 1 ))
done

# make things smaller
git gc
