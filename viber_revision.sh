#!/bin/sh
#echo `pwd`
parent_branch=`git rev-parse --abbrev-ref HEAD`
#echo $parent_branch
commit_message="Merge branch 'IOS-$1' into '$parent_branch'"
#echo $commit_message
logs=`git log --merges --grep "$commit_message"`
#echo $logs
commit_hash=''
if [[ $logs =~ commit[[:space:]]([0-9a-f]{5,40})[[:space:]] ]];

then
	commit_hash=${BASH_REMATCH[1]} ;
fi

viber_revision=`sh ./gitver -c $commit_hash`
echo $viber_revision
