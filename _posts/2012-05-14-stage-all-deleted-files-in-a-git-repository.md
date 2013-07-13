---
filename: 2012-05-14-stage-all-deleted-files-in-a-git-repository.md
layout:   post
category: blog
tags:     git development
title:    Stage All Deleted Files In A Git Repository
---
I occaisionally forget to use `git rm` to delete files in a git repository.
This happens every time I remove a file without expicitly remembering to do it a _particular_ way on the command line.
When it comes time to commit my changes I'm presented with a problem: the deleted files are not staged for the commit.

A [short post on how to use xargs][1] I found this morning let me to a simple solution to this problem:

    git ls-files -d | xargs git rm

How does this work?

 - `git ls-files` lists all the files tracked by the git repository.
 - Passing the `-d` flag only lists the deleted files.
 - `xargs` then iterates over each line in the list of files while prepending its arguments.

Each deleted file as identified by `git ls-files` gets converted to `git rm FILENAME` and then executed.

In the past I had to copy and paste lines out of `git status` or type out the filenames without the benefit of tab completion in order to stage all the deleted files.
Now, by utilizing a venerable unix tool I don't have to do that any more.

[1]: http://bitops.io/blog/1336893229/xargs
