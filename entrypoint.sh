#!/bin/sh -l

set -e

git config --global user.name "GitHub Actions"
git config --global user.email "github-actions@users.noreply.github.com"

git remote add upstream "$INPUT_UPSTREAM_URL"
git fetch upstream

if git rev-list HEAD..upstream/main --count > 0 ; then
  git checkout -b update-from-upstream-$(date +'%Y-%m-%d')
  git merge --allow-unrelated-histories --no-edit upstream/main
  git push origin update-from-upstream-$(date +'%Y-%m-%d')
  gh pr create --title "Update from upstream" --body "Incorporating upstream changes" --base main --head update-from-upstream-$(date +'%Y-%m-%d') --repo "$GITHUB_REPOSITORY" --token "$GITHUB_TOKEN"
fi
