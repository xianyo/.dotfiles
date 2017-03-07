#!/bin/bash

if [ $1 == do ]; then
	echo "do"
	find  .  -type d -name ".git"  -exec rename 's/\.git/\.git_bak/'  {} \;
	find  .  -type f -name ".gitignore"  -exec rename 's/\.gitignore/\.gitignore_bak/' {} \;
elif [ $1 == re ]; then
	echo "re"
	#find  .  -type d -name ".git_bak"  -exec rename 's/\.git_bak/\.git/'  {} \;
	find  .  -type f -name ".gitignore_bak"  -exec rename 's/\.gitignore_bak/\.gitignore/' {} \;
elif [ $1 == gi ]; then
	echo "gi"
	echo "gi do**********************************************"
	find  .  -type d -name ".git_bak"
	find  .  -type f -name ".gitignore_bak"

	echo "gi re**********************************************"
	find  .  -type d -name ".git"
	find  .  -type f -name ".gitignore"
fi

