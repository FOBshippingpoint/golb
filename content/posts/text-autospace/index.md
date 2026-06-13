+++
title = 'CSS text-autospace'
date = '2026-06-13'
draft = false
tags = ['css']
summary = 'A lifesaver for mixed CJK and non-CJK text'
+++

When mixing CJK (Chinese/Japanese/Korean) and non-CJK characters,
many people add whitespace between them to improve readability. Similar to adding spaces around operators in code, like `a=1` → `a = 1`.

Someone even created a [web extension](https://github.com/vinta/pangu.js) to apply this spacing across all web pages.
Personally, I agree that it looks great, but adding the whitespace manually is annoying. Thanks to the new CSS property [`text-autospace`](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference/Properties/text-autospace), we no longer need to add this 盤古之白 by hand.

In this site, I use `normal` for all text:

```css
html {
  text-autospace: normal;
}
```

With `text-autospace: no-autospace`:

<span style="margin-left:1em; text-autospace:no-autospace">Hello世界，42是一個神秘的number</span>

With `text-autospace: normal`:

<span style="margin-left:1em; text-autospace:normal">Hello世界，42是一個神秘的number</span>

With manual space:

<span style="margin-left:1em">Hello 世界，42 是一個神秘的 number</span>
