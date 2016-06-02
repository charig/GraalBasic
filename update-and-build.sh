#!/bin/sh
# usage: update-and-build.sh [hg-id]

./update-graal-revision.sh "$1"
GRAAL_DIR=`pwd`

echo
echo Push to GraalBasic repository
git push
cd graal-compiler
GRAAL_REV=`git rev-parse HEAD`
cd ..

echo 
echo Update and Push TruffleMate
cd ../TruffleMate
cp $GRAAL_DIR/../TruffleMate/.graal-git-rev .
git commit -m "Update graal to ${GRAAL_REV}" .graal-git-rev
git push
