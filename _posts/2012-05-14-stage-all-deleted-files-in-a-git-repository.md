---
filename: 2012-05-14-stage-all-deleted-files-in-a-git-repository.md
layout:   post
category: blog
tags:     git development
title:    Stage All Deleted Files In A Git Repository
---
Sometimes I use `rm` instead of `git rm` to delete files in a git repository.
This simple mistake means that the deleted files are not staged when I try to commit my changes.

A [short post on how to use xargs][1] I found this morning led me to a simple solution:

    git ls-files -d | xargs git rm

How does this work?

 - `git ls-files` lists all the files tracked by the git repository.
 - Passing the `-d` flag only lists the deleted files.
 - `xargs` then iterates over each line in the list of files while prepending its arguments.

Each deleted file as identified by `git ls-files` gets converted to `git rm FILENAME` and then executed.

In the past I had to copy and paste lines out of `git status` or type out the filenames without the benefit of tab completion in order to stage all the deleted files.
I don't have to do that now.
To speed things up even further I [added an alias][2] to my [dotfiles][3].

[1]: http://bitops.io/blog/1336893229/xargs
[2]: https://github.com/danhorst/dotfiles/commit/5fbea03246aff7715693e1d248108c39ab62ce66
[3]: https://github.com/danhorst/dotfiles
