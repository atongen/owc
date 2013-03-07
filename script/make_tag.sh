#!/bin/bash

if [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]]; then
  echo "Clean up your working copy, then try again."
  exit 1
fi

echo "Type a tag name in snake case:"
read TAG_NAME

DATE=`date +%Y%m%d%H%M`
TAG="${DATE}_$TAG_NAME"
echo "Does this look good? (this tag will be pushed to origin) (y/n)"
echo "$TAG"

read OK
if [ "$OK" == "y" ]; then
  echo "Creating tag $TAG"
  git tag -a "$TAG"
  echo "Pushing to origin..."
  git push origin "$TAG"
fi
