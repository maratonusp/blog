#!/bin/bash

for f in `git diff HEAD^ --name-only --diff-filter=A --relative=_posts`; do
	./post_to_bot.py $f
done
