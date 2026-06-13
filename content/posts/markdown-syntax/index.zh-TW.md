+++
title = 'Markdown 語法展示'
date = '2026-03-22T09:00:00+08:00'
draft = true
tags = ['hugo', 'markdown', 'syntax']
categories = ['Examples']
summary = '一篇用來檢查標題、列表、表格、程式碼區塊、註腳和摘要的 Hugo Markdown 範例。'
+++

這篇文章用來確認常見 Markdown 內容在目前的 Hugo theme 中都能正常呈現。

## 標題和段落

Hugo 使用 Goldmark 作為預設 Markdown renderer。一般段落可以包含 **粗體**、*斜體*、`inline code`，也可以連到 [關於頁](/about/)。

{{< figure
  src="bryce-canyon.jpg"
  alt="Bryce Canyon的橘色岩柱"
  caption="同一張圖片也可以透過Hugo內建figure shortcode加上caption。"
>}}


## 列表

- 保持內容結構清楚。
- 使用短段落讓文章更容易掃讀。
- 需要順序時改用編號列表。

1. 先寫草稿。
2. 加上 front matter。
3. 執行 `hugo server` 預覽。

## 表格

| 類型 | 用途 |
| --- | --- |
| Leaf bundle | 單篇文章和它自己的圖片、資料、影片 |
| Branch bundle | section、taxonomy、term 或首頁 |
| Static file | favicon、robots.txt、站台驗證檔 |

## 引言和註腳

> 好的靜態網站結構應該讓內容路徑接近最後產生的 URL。

這裡有一個註腳範例。[^note]

[^note]: 註腳可以放補充資料，讓正文維持簡潔。

## 程式碼

```go {linenos=inline hl_lines=[6]}
package main

import "fmt"

func main() {
    fmt.Println("hello hugo")
}
```

```bash
hugo --destination /tmp/golb-check --cleanDestinationDir
```

## 工作清單

- [x] 加上 front matter
- [x] 測試語法高亮
- [ ] 寫更多正式文章

