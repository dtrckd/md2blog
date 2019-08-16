@git
@recipes

## Diffs

Git diff on previous commit (e.g. head bacward 2 commits):

    git diff HEAD~2 -- <path>

Diff between Head and a other branch

    git diff branch-name -- a-file
    or
    git diff branch-name..HEAD -- a-file

## Stashes

Pop only one file from a stash          # https://stackoverflow.com/questions/15264553/how-to-unstash-only-certain-files

    git checkout stash@{0} -- <filename>

or save it under another name

    git show stash@{0}:<full filename>  >  <newfile>

or  check change

    git difftool stash@{0}..HEAD -- <filename>

## branches

add a remote branch

    # simply push the branch
    git push origin new_branch

remove a remote branch

    git push origin --delete <remote_branch_name>


move a branch base to another commit:
Example, move branch feature starting at C to F:

    A---B---C---D---E---F---G master
            \
             P---Q---R feature

    A---B---C---D---E---F---G master
                        \
                         P---Q---R feature


    git rebase --onto F C feature


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

## git-fatfiles (show fat files

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
http://blog.ostermiller.org/git-remove-from-history
(warning  those command permanent remove bunch of files)

    git filter-branch -f  --index-filter \
        'git rm --force --cached --ignore-unmatch video/parasite-intro.avi' \
         -- --all

    rm -Rf .git/refs/original
    git reflog expire --expire=now --all
    git gc --aggressive # --prune
    git prune
    #git push origin master --force


## Removing and purging files from git history (Advanced)


Occasionally, a git source code repository needs to have something removed from it permanently, even from the history.


### Step 1: Create a clone of the repository

Replace MY_GIT_REPOSITORY with the URL of your git repository. This will also track all the branches so all branches can be cleaned as well. ([source](https://stackoverflow.com/questions/2199897/how-to-convert-a-normal-git-repository-to-a-bare-one))

    cd /tmp
    git clone MY_GIT_REPOSITORY.git workingrepo
    cd workingrepo
    for branch in `git branch -a | grep remotes | grep -v HEAD | grep -v master`; do
        git branch --track ${branch##*/} $branch
    done

### Step 2: Find the files that you want to remove

#### Case A: Large deleted files

Large deleted files are stored in the repository and are still transfered for every clone. Here is a command that will find the 20 largest files in your git repository ([source](http://blog.jessitron.com/2013/08/finding-and-removing-large-files-in-git.html)):

    git rev-list master | while read rev; do git ls-tree -lr $rev  | cut -c54- | sed -r 's/^ +//g;'; done  | sort -u | perl -e 'while (<>) { chomp; @stuff=split("\t");$sums{$stuff[1]} += $stuff[0];} print "$sums{$_} $_\n" for (keys %sums);' | sort -rn | head -n 20

#### Case B: Deleting a file that contains a password

You can grep the history for the password and find the file that contains it:

    git grep -i 'mypassword' $(git rev-list --all)

#### Case C: Deleting entire deleleted directories

To get a list of entire directories that have been removed from the repository:

    git log --all --pretty=format: --name-only --diff-filter=D | sed -r 's|[^/]+$||g' | sort -u

### Step 3: Rewrite history and remove the old files

Replace FILE_LIST with the files or directories that you are removing.

    git filter-branch --tag-name-filter cat --index-filter 'git rm -r --cached --ignore-unmatch FILE_LIST' --prune-empty -f -- --all

### Step 4: Prune all references with garbage collection and reclaim space

([source](http://stevelorek.com/how-to-shrink-a-git-repository.html))

    rm -rf .git/refs/original/
    git reflog expire --expire=now --all
    git gc --aggressive --prune=now

### Step 5: Verify they have been removed

Run the same command that you used to in step 2 to verify that your removed files are no longer in history.

### Step 6: Push the history changes

    git push origin --force --all
    git push origin --force --tags

### Step 7: Garbage collect the server

If you are running your own server, garbage collect there as well. Servers are usually garbage collected periodically if you not running your own

    cd MY_SERVER_GIT_REPO
    git reflog expire --expire=now --all
    git gc --aggressive --prune=now

### Step 8: Everybody must rebase and prune

All users must get the alter history and prune their own copies of the repository. Tell your coworkers and teammates that have clones of this repostory to run the following:

    cd MY_LOCAL_GIT_REPO
    git fetch origin
    git rebase
    git reflog expire --expire=now --all
    git gc --aggressive --prune=now

or if they have no work outstanding commits, they can just set their repository to mirror the origin rather than rebasing (WARNING: destroys anything not pushed!):

    cd MY_LOCAL_GIT_REPO
    git fetch origin
    # WARNING: can destroy unpublished data!
    git reset --hard origin/master
    git reflog expire --expire=now --all
    git gc --aggressive --prune=now


### Detack a subdirectory into a new repo

Prepare the old repo

    pushd <big-repo>
    git subtree split -P <name-of-folder> -b <name-of-new-branch>
    popd

    Note: <name-of-folder> must NOT contain leading or trailing characters. For instance, the folder named subproject MUST be passed as subproject, NOT ./subproject/

    Note for windows users: when your folder depth is > 1, <name-of-folder> must have *nix style folder separator (/). For instance, the folder named path1\path2\subproject MUST be passed as path1/path2/subproject

Create the new repo

    mkdir <new-repo>
    pushd <new-repo>

    git init
    git pull </path/to/big-repo> <name-of-new-branch>

Link the new repo to Github or wherever

    git remote add origin <git@github.com:my-user/new-repo.git>
    git push origin -u master

Cleanup, if desired

    popd # get out of <new-repo>
    pushd <big-repo>

    git rm -rf <name-of-folder>

