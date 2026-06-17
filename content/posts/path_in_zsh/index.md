+++
title = 'PATH & path in Zsh'
date = '2026-06-17'
draft = false
tags = ['zsh', 'TIL']
summary = 'Spoiler: they are the same.'
+++

Today I sent my `cd` shell alias to a colleague:

```bash
# Change directory improved
#
# $1 {path}? - directory or file path, if it is a file, then cd to file's parent directory
c() {
  path=${1:-$(copyq read 2>/dev/null ||:)}

  # https://github.com/dylanaraps/pure-sh-bible#trim-leading-and-trailing-white-space-from-string
  _trim_string() {
      # Usage: trim_string "   example   string    "

      # Remove all leading white-space.
      # '${1%%[![:space:]]*}': Strip everything but leading white-space.
      # '${1#${XXX}}': Remove the white-space from the start of the string.
      trim=${1#${1%%[![:space:]]*}}

      # Remove all trailing white-space.
      # '${trim##*[![:space:]]}': Strip everything but trailing white-space.
      # '${trim%${XXX}}': Remove the white-space from the end of the string.
      trim=${trim%${trim##*[![:space:]]}}

      printf '%s\n' "$trim"
  }

  if [ -f "$path" ]; then
    path=$(dirname "$path")
  elif [ -f "$(_trim_string "$path")" ]; then
    path=$(dirname "$(_trim_string "$path")")
  elif [ -d "$path" ]; then
    : # noop
  elif [ -d "$(_trim_string "$path")" ]; then
    path=$(_trim_string "$path")
  fi
  cd "$path" 2>/dev/null || cd ||:
}
```

But later he told me that after running it, every subsequent command became **command not found**.

I couldn't reproduce the issue in my environment, so I suspected the problem was related to zsh, which my colleague uses.
I spun up an Alpine + zsh Docker container to debug it:

```text
▶ docker run --interactive --tty alpine
/ # apk add zsh
(1/4) Installing libcap2 (2.78-r0)
(2/4) Installing ncurses-terminfo-base (6.5_p20251123-r0)
(3/4) Installing libncursesw (6.5_p20251123-r0)
(4/4) Installing zsh (5.9-r6)
  Executing zsh-5.9-r6.post-install
Executing busybox-1.37.0-r30.trigger
OK: 12.6 MiB in 20 packages

/ # zsh
8ee3839d06e8# echo "$PATH"
/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
8ee3839d06e8# path=helloworld
8ee3839d06e8# echo "$PATH"
helloworld
```

So changing `path` also updates `PATH` and vice versa, even though zsh is case-sensitive.
It turns out that `path` is the array mirror of `PATH`[^pathref]. I also found someone asking a [similar question](https://superuser.com/questions/1733936/why-does-assigning-to-path-break-my-path-in-zsh) on Super User.

TIL, another shell portability lesson.

[^pathref]: https://man.archlinux.org/man/zshall.1.en#:~:text=tied%20together%20in%20the%20manner%20of%20%24PATH%20and%20%24path.
    I did not find a direct explanation of the relationship between `path` and `PATH`.
