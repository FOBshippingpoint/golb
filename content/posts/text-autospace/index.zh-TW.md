+++
title = 'CSS text-autospace'
date = '2026-06-13'
draft = false
tags = ['css']
summary = '盤古之白的現代解決方案'
+++

撰寫中文跟英文混雜的文章時，許多人會在英文或數字和中文之間加入空格提昇可讀性，
此舉與撰寫程式時在運算子之間加上空白類似
（`a=1` → `a = 1`）

甚至有人為此創建[瀏覽器擴充](https://github.com/vinta/pangu.js)；
我個人完全贊同加入空白來讓文章變好看，然而手動處理這件事實在讓人抓狂，
所幸2025年的baseline CSS屬性[`text-autospace`](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference/Properties/text-autospace)可以拯救我們。

此網站為所有文字套用autospace：

```css
html {
  text-autospace: normal;
}
```

套用`text-autospace: no-autospace`：

<span style="margin-left:1em; text-autospace:no-autospace">Hello世界，42是一個神秘的number</span>

套用`text-autospace: normal`：

<span style="margin-left:1em; text-autospace:normal">Hello世界，42是一個神秘的number</span>

手動加入空白：

<span style="margin-left:1em">Hello 世界，42 是一個神秘的 number</span>

