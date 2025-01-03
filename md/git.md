@git
@recipes

## Autogenerate release

config in ~/.config/git-cliff

    git cliff --unreleased --latest --topo-order

see template exampe at https://github.com/orhun/git-cliff/blob/main/cliff.toml

## Logs

Search commits where a <pattern> has been introduced

    git log -S <pattern> --source --all


## Stats

count line of code, count files

    git diff --stat 4b825dc642cb6eb9a060e54bf8d69288fbee4904

and sumary

    git diff --shortstat (git hash-object -t tree /dev/null)


## Global options

cred timeout store/cache

    git config --global credential.helper 'cache --timeout=3600'

## Restore

Various (equivalent) ways to discard unstaged change

    git restore .
    # or
    git checkout -- .

## Reset

cancel the last commit (commit on bad branch for example!)

    git reset --soft HEAD~1


How to undo a git reset (if the above command is typed in the wrong directory for example!)

    git reset 'HEAD@{1}'

Abort a conflictual "stash pop"

    git checkout -f
    # OR
    git reset --merge


## Submodule

clone with submodule

    git clone --recursive [URL to Git repo]

get after cloning

    git submodule update --init --recursive

Pull change including submodule
    
    git pull --recurse-submodules

Pull in submodule only

    git submodule update --remote

Executing a command in every submodule
    
    git submodule foreach --recursive 'git reset --hard'

adding submodule

    git submodule add -b master [URL to Git repo] path/to/submodule
    git submodule init # if not present

## Diffs

Show the files modified in the last commit

    git diff --name-status HEAD HEAD~1

Show commits where a file was modified:

    git log --pretty=oneline -- filename
    git log --all --first-parent --remotes --reflog --author-date-order -- filename
    # With gitk
    gitk --all --first-parent --remotes --reflog --author-date-order -- filename

Show successive diff of a file accros time (commits)

    git log --follow --patch 

with patch

    git log --pretty=oneline -u dotfiles/.vimrc

between given line

    git log --pretty=oneline -u -L lineStart,lineEnd:dotfiles/.vimrc

Git diff on previous commit (e.g. head bacward 2 commits):

    git diff HEAD~2 -- <path>

Diff between Head and a other branch

    git diff branch-name -- a-file
    # or
    git diff branch-name..HEAD -- a-file

    # exclude some path from the diff
    git diff dev op  -- ':!\_op/*'

## Stashes

Pop only one file from a stash
https://stackoverflow.com/questions/15264553/how-to-unstash-only-certain-files

    git checkout stash@{0} -- <filename>

or save it under another name

    git show stash@{0}:<full filename>  >  <newfile>

or check change

    git difftool stash@{0}..HEAD -- <filename>

## Branches

add a remote branch

    # simply push the branch
    git push origin new_branch

remove a remote branch

    git push origin <remote_branch_name> --delete 


Move a branch base to another commit:

    git rebase  C --onto G feature

-> It will move branch feature starting at `C` to `G`:

    A---B---C---D---E---F---G master
            \
             P---Q---R feature

    A---B---C---D---E---F---G master
                            \
                             P---Q---R feature



Bring back lost commit did in a "detached branch"

    # 1. Look up the SHA-1 hashes of the commits you made in detached HEAD state with 
    git reflog

    # 2. Then execute, with all the commit hashes ordered from oldest to most recent:
    git cherry-pick <hash1> <hash2> <hash3> ...

    # 3. For example if I had only one, given in the "first 7 characters" short hash format:
    git cherry-pick a21d053

## Rebase

Rebase a branch in the current (it will rebase branch-name, waring !)
    git rebase <branch-name>

In case of of rebase conflit, when resolved

    git rebase --continue 

To cancel a conflicted rebase

    git rebase --abort 

interactive 

    git rebase -i hash-of-last-commit-to-rebase

## Interactive rebase

Rebase until the last 9 commits:

    git rebase -i @~9

(example: replace "pick" by "reword" of a commit in the editor to ammend its name)


Nice tuto about amend/rebase(-i)/cherry-pick/etc for *rewriting history* !:
    https://backlog.com/git-tutorial/rewriting-history/#git-rebase


**moving a commit**

Assuming a list of commit starting from A, suppose you want to change order of a previous commit:

    A -- B -- C -- D

Then run:

    git rebase -i hash-of-A

Git will open your editor and it will look like this:

    pick 8668d21 B
    pick 650f1fc C
    pick 74096b9 D

Just move D to the top like this, then save and quit

    pick 74096b9 D
    pick 8668d21 B
    pick 650f1fc C

Now you will have:

    A -- D -- B -- C


**editing a commit**

Assuming that the commit history is preA -- A -- B -- C, if you want to insert a commit between A and B, the steps are as follows:

    git rebase -i hash-of-preA

Git will open your editor. The content may like this:

    pick 8668d21 A
    pick 650f1fc B
    pick 74096b9 C

Change the first pick to edit:

    edit 8668d21 A
    pick 650f1fc B
    pick 74096b9 C

Save and Exit.

Modify your code and then `git add . && git commit -m "I"`

    git rebase --continue

Now your Git commit history is

    preA -- A -- I -- B -- C

If you encounter a conflict, Git will stop at this commit. You can use git diff to locate conflict markers and resolve them. After resolving all conflicts, you need to use git add <filename> to tell Git that the conflict has been resolved and then rerun git rebase --continue.

If you want to undo the rebase, use git rebase --abort


**droping a commit**

use the keyword "drop" instead of "edit"...


## Merge

merge an authorative branch "dev" into "master"

    git checkout master
    git merge -Xtheirs dev
    git diff --name-only --diff-filter=U | xargs -I{} git checkout dev {}

Selective merge
    http://stackoverflow.com/questions/449541/how-do-you-merge-selective-files-with-git-merge
    http://jasonrudolph.com/blog/2009/02/25/git-tip-how-to-merge-specific-files-from-another-branch/

Checkout the path(s) from the branch you want to merge,

	 git checkout source_branch -- <paths>...

If you need to merge changes selectively, use reset and then add,

	git reset <paths>...
	git add -p <paths>...

Finally commit

	git commit -m "'Merge' these changes"

Cancel (e.g conflit)

    git merge --abort

## Subtree

Merge git repository in subdirectory - 
To merge a repository <repo> at revision <rev> as subdirectory <prefix>, use git subtree add as follows:

    git subtree add -P <prefix> <repo> <rev>

see https://stackoverflow.com/questions/6426247/merge-git-repository-in-subdirectory

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

## Remove Backup

    git update-ref -d refs/original/refs/heads/master

## git-fatfiles (show fat files)

    git rev-list --all --objects | \
        sed -n $(git rev-list --objects --all | \
        cut -f1 -d' ' | \
        git cat-file --batch-check | \
        grep blob | \
        sort -n -k 3 | \
        tail -n40 | \
        while read hash type size; do
        echo -n "-e s/$hash/$size/p ";
        done) | \
        sort -n -k1


## git-eradicate (purge history)

Remove the identified file (warning those command permanent remove bunch of files)

    git filter-branch -f  --index-filter \
        'git rm --force --cached --ignore-unmatch video/parasite-intro.avi' \
         -- --all

    rm -Rf .git/refs/original
    git reflog expire --expire=now --all
    git gc --aggressive # --prune
    git prune
    #git push origin master --force

Or with git filter-repo

    git filter-repo --path path/to/your/folder --invert-paths


All collaborator that cloned the repo must run

    git fetch origin
    git rebase
    git reflog expire --expire=now --all
    git gc --aggressive --prune=now


references:
https://blog.ostermiller.org/removing-and-purging-files-from-git-history/
https://marcofranssen.nl/remove-files-from-git-history-using-git-filter-repo

### Rename branch master name


    git branch -m master prod

    git push origin prod
    # Eventually change default branch on server before
    git push origin --delete master

    # update the remote's Head
    git remote set-head origin -a

    #
    # Delete refs?
    git remote prune origin

    #
    # For eventual collaborators that have that have clone.
    git fetch --all
    git remote set-head origin -a
    git branch --set-upstream-to origin/main
    git branch -m master prod
    
