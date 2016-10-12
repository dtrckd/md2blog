@git

http://blog.ostermiller.org/git-remove-from-history

(warning  those command permanent remove bunch of files)
# Purging git history
git filter-branch --index-filter "git rm -rf --cached --ignore-unmatch YOURFILENAME" HEAD
rm -rf .git/refs/original/ 
git reflog expire --all 
git gc --aggressive --prune
git push origin master --force


# Removing and purging files from git history (Advanced)


Occasionally, a git source code repository needs to have something removed from it permanently, even from the history.


## Step 1: Create a clone of the repository

Replace MY_GIT_REPOSITORY with the URL of your git repository. This will also track all the branches so all branches can be cleaned as well. ([source](https://stackoverflow.com/questions/2199897/how-to-convert-a-normal-git-repository-to-a-bare-one))

    cd /tmp
    git clone MY_GIT_REPOSITORY.git workingrepo
    cd workingrepo
    for branch in `git branch -a | grep remotes | grep -v HEAD | grep -v master`; do
        git branch --track ${branch##*/} $branch
    done

## Step 2: Find the files that you want to remove

### Case A: Large deleted files

Large deleted files are stored in the repository and are still transfered for every clone. Here is a command that will find the 20 largest files in your git repository ([source](http://blog.jessitron.com/2013/08/finding-and-removing-large-files-in-git.html)):

    git rev-list master | while read rev; do git ls-tree -lr $rev  | cut -c54- | sed -r 's/^ +//g;'; done  | sort -u | perl -e 'while (<>) { chomp; @stuff=split("\t");$sums{$stuff[1]} += $stuff[0];} print "$sums{$_} $_\n" for (keys %sums);' | sort -rn | head -n 20

### Case B: Deleting a file that contains a password

You can grep the history for the password and find the file that contains it:

    git grep -i 'mypassword' $(git rev-list --all)

### Case C: Deleting entire deleleted directories

To get a list of entire directories that have been removed from the repository:

    git log --all --pretty=format: --name-only --diff-filter=D | sed -r 's|[^/]+$||g' | sort -u

## Step 3: Rewrite history and remove the old files

Replace FILE_LIST with the files or directories that you are removing.

    git filter-branch --tag-name-filter cat --index-filter 'git rm -r --cached --ignore-unmatch FILE_LIST' --prune-empty -f -- --all

## Step 4: Prune all references with garbage collection and reclaim space

([source](http://stevelorek.com/how-to-shrink-a-git-repository.html))

    rm -rf .git/refs/original/
    git reflog expire --expire=now --all
    git gc --aggressive --prune=now

## Step 5: Verify they have been removed

Run the same command that you used to in step 2 to verify that your removed files are no longer in history.

## Step 6: Push the history changes

    git push origin --force --all
    git push origin --force --tags

## Step 7: Garbage collect the server

If you are running your own server, garbage collect there as well. Servers are usually garbage collected periodically if you not running your own

    cd MY_SERVER_GIT_REPO
    git reflog expire --expire=now --all
    git gc --aggressive --prune=now

## Step 8: Everybody must rebase and prune

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

</section>
