+++
title = 'Zsh路徑之謎'
date = '2026-06-17'
draft = false
tags = ['zsh', 'TIL']
summary = 'path和PATH是一體兩面'
+++

今天傳給同事我寫的cd shell alias `c`:

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

結果他一執行完，後續的命令都變成command not found？

在我的環境下沒辦法重現，這才想到同事用的是zsh而不是bash，問題可能就出在這，
起一個alpine + zsh container debug看看：

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

果然修改小寫的`path`會連帶改變`PATH`（反之亦然），這並非是zsh不忽略大小寫，
而是`path`在zsh裡面是`PATH`的陣列型態[^pathref]，superuser上也有人問過[類似的問題](https://superuser.com/questions/1733936/why-does-assigning-to-path-break-my-path-in-zsh)。

今天又學到一個跟shell可攜性有關的坑。

[^pathref]: https://man.archlinux.org/man/zshall.1.en#:~:text=tied%20together%20in%20the%20manner%20of%20%24PATH%20and%20%24path.
我並沒有查到`path`和`PATH`關係的直接解釋。
