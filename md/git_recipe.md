@git
@recipes

## Git Diff

Git diff on previous commit (e.g. head bacward 2 commits):
    git diff HEAD~2 -- <path>

## reseting files permission change only (git diff | git apply)

    git diff -p \
            | grep -E '^(diff|old mode|new mode)' \
            | sed -e 's/^old/NEW/;s/^new/old/;s/^NEW/new/' \
            | git apply

An alias for this:

    git config --global --add alias.permission-reset '!git diff -p | grep -E "^(diff|old mode|new mode)" | sed -e "s/^old/NEW/;s/^new/old/;s/^NEW/new/" | git apply'


##  Make the current commit the only (initial) commit in a Git repository

```bash
git branch new_branch_name $(echo "init message" | git commit-tree HEAD^{tree}) 
git checkout new_branch_name # swith to new branch mirror just created
git branch -D master # delete master
git branch -m master # rename new_branch to master
%git push -f origin master # eventually push the reseted repository
```

## Ammend author name and email (last commit)

```bash
git config user... 'new_name..'
git commit --amend --reset-author
```

## Rename author/email (all commit / breaks)

git filter-branch -f --commit-filter  'if [ "$GIT_AUTHOR_NAME" = "smith" ];
then export GIT_AUTHOR_NAME="dtrckd"; export GIT_AUTHOR_EMAIL=ddtracked@gmail.com;
fi; git commit-tree "$@"'

### Remove Backup
git update-ref -d refs/original/refs/heads/master

