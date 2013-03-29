---
filename: 2012-05-14-stage-all-deleted-files-in-a-git-repository.mkd
layout:   article
category: articles
title:    Stage All Deleted Files In A Git Repository
---

    git ls-files -d | xargs git rm

A [short post on how to use xargs][1] I found this morning let me to a simple
solution to a occaisional problem I have. When I'm working in a git repository
I don't always use `git rm` to remove files. Sometimes I delete files in
[nautilus][2]. Sometimes I use `rm-rf` haphazardly. But when it comes time to
commit my changes I'm presented with a problem: the deleted files are not staged
for the commit.

In order to stage all the deleted files I have had to copy and paste lines out
of `git status` or type out the filenames without the benefit of tab completion.
Now, by utilizing a venerable unix tool, I don't have to do that any more. `git
ls-files` lists all the files tracked by the git repository. Passing the `-d`
flag only lists the deleted files. `xargs` then iterates over each line in the
list of files while prepending its arguments. In the example above each deleted
file as identified by `git ls-files` is then converted to `git rm _filename_`
and executed.

[1]: http://bitops.io/blog/1336893229/xargs
[2]: http://en.wikipedia.org/wiki/Nautilus_%28file_manager%29
