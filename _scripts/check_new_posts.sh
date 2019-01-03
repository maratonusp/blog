#!/bin/bash

echo -e "\033[0;32m[Verificando posts novos]\033[0m"
if [ "$TRAVIS_PULL_REQUEST" != "false" ]; then
	echo -e "\033[0;33m[Passo ignorado: Pull Request]\033[0m"
	exit 0
fi

# Getting the name of all files in the directory `_posts/` that were added in the last commit
for f in `git diff HEAD^ --name-only --diff-filter=A --relative=_posts`; do
	python3 ./_scripts/post_to_world.py $f $MARATONIME_HELPER_TOKEN $MARATONIME_PAGE_TOKEN
done
