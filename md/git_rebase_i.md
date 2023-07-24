# Interactive rebase

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

