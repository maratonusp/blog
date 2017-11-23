#!/bin/bash

for f in `git diff HEAD^ --name-only --diff-filter=A --relative=_posts`; do
	./post_to_world.py $f $MARATONIME_HELPER_TOKEN $MARATONIME_PAGE_TOKEN
done
