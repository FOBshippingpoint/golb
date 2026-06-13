+++
title = 'Markdown Syntax Showcase'
date = '2026-03-22T09:00:00+08:00'
draft = true
tags = ['hugo', 'markdown', 'syntax']
categories = ['Examples']
summary = 'A Hugo Markdown example for headings, lists, tables, code blocks, footnotes, and summaries.'
+++

This post checks that common Markdown content renders cleanly with the current Hugo theme.

## Headings And Paragraphs

Hugo uses Goldmark as its default Markdown renderer. A paragraph can include **bold text**, *emphasis*, `inline code`, and links to the [About page](/en/about/).

## Lists

- Keep content structure clear.
- Use short paragraphs so posts are easy to scan.
- Switch to numbered lists when order matters.

1. Write the draft.
2. Add front matter.
3. Preview with `hugo server`.

## Tables

| Type | Use |
| --- | --- |
| Leaf bundle | A single post with its own images, data, or video |
| Branch bundle | A section, taxonomy, term, or home page |
| Static file | favicon, robots.txt, or site verification files |

## Quotes And Footnotes

> A good static-site structure keeps source content paths close to the final URLs.

Here is a footnote example.[^note]

[^note]: Footnotes are useful for extra context without crowding the main text.

## Code

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

## Task List

- [x] Add front matter
- [x] Test syntax highlighting
- [ ] Write more production posts

