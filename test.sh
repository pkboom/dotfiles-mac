#!/bin/sh

remote=$(git config --get remote.origin.url)
branch_name=$(git rev-parse --abbrev-ref HEAD)

$(gh pr create --title "$branch_name" --assignee @me --draft)

# return
