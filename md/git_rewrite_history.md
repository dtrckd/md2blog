nice tuto about amend/rebase(-i)/cherry-pick/etc:
    https://backlog.com/git-tutorial/rewriting-history/#git-rebase


Assuming a list of commit starting from A, suppose you want to change order of a previous commit:

    Create your new commit at the end, D. Now you have:

    A -- B -- C -- D

    Then run:

    $ git rebase -i hash-of-A

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


((
Nice idea, however it may be hard to introduce D on C, when you intend these changes being wrt. to A. – BartoszKP Oct 14 '17 at 10:33

I have a situation where I have 3 commits that I want to rebase together and a commit in the middle that is unrelated. This is super nice to be able to just move that commit earlier or later down the line of commits. – unflores Sep 7 at 10:21

))

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

    Modify your code and then git add . && git commit -m "I"

    git rebase --continue

Now your Git commit history is preA -- A -- I -- B -- C

If you encounter a conflict, Git will stop at this commit. You can use git diff to locate conflict markers and resolve them. After resolving all conflicts, you need to use git add <filename> to tell Git that the conflict has been resolved and then rerun git rebase --continue.

If you want to undo the rebase, use git rebase --abort
