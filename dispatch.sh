#!/bin/bash

REMOTE=${1}
BRANCH=${2#"refs/heads/"}

curl -L \
	-X POST \
	-H "Accept: application/vnd.github+json" \
	-H "Authorization: Bearer ${GHBEARER}" \
	-H "X-GitHub-Api-Version: 2022-11-28" \
	https://api.github.com/repos/dby-pghacker/perftester/actions/workflows/dockercompose.yml/dispatches \
	-d "{\"ref\":\"main\",\"inputs\":{\"remote\":\"${REMOTE}\",\"branch\":\"${BRANCH}\"}}"
