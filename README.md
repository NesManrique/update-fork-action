# update-fork-action
Checks for changes in the upstream repository and creates a pull request with the changes

## Sample usage

```
name: Update from Upstream

on:
  schedule:
    - cron: '0 0 * * 1' # Run every Monday at 00:00

jobs:
  update_from_upstream:
    runs-on: ubuntu-latest

    steps:
    - name: Update Fork from Upstream
      uses: NesManrique/update-fork-action@main
      with:
        upstream-url: https://github.com/username/upstream-repo.git # Replace with the upstream repository URL
      env:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```
