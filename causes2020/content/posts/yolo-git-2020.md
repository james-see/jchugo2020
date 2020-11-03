---
title: "Stop Worrying and Git Yolo"
date: 2020-10-11T10:10:10-05:00
showDate: true
draft: false
tags: ["git", "tips"]
images:
  - /img/git-yolo.png
---

Git yolo has changed my life for the better. It saves me tons of time. You never have to type in a commit comment again.

Here is how to get the yolo alias working:

You need to edit your gitconfig dotfile that is located at `~/.gitconfig`.

Mine before:

```
$ cat ~/.gitconfig
# This is Git's per-user configuration file.
[user]
# Please adapt and uncomment the following lines:
	name = jamesacampbell
	email = james@jamescampbell.us
[url "git@gitlab.com:"]
		insteadOf = https://gitlab.com/
```

Mine after:

```
$ cat ~/.gitconfig
# This is Git's per-user configuration file.
[user]
# Please adapt and uncomment the following lines:
	name = jamesacampbell
	email = james@jamescampbell.us
[url "git@gitlab.com:"]
		insteadOf = https://gitlab.com/
[alias]
yolo = !git add -A && git commit -am \"`curl -s http://whatthecommit.com/index.txt `\" && git push -f origin master
```

This has saved me _hours_ over the past year. It uses random text snippets from http://whatthecommit.com for your commit statements. So be prepared to have some silly commit statements.

Enjoy!
