@git

http://stackoverflow.com/questions/449541/how-do-you-merge-selective-files-with-git-merge

and

http://jasonrudolph.com/blog/2009/02/25/git-tip-how-to-merge-specific-files-from-another-branch/

### Summary:

Checkout the path(s) from the branch you want to merge,

	 git checkout source_branch -- <paths>...

If you need to merge changes selectively, use reset and then add,

	git reset <paths>...
	git add -p <paths>...

Finally commit

	git commit -m "'Merge' these changes"

