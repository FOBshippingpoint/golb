+++
title = "Unreasonable Effectiveness of AsciiDoc"
date = 2026-07-19
tags = ["asciidoc", "agent"]
categories = []
draft = false
summary = "AsciiDoc is easier for humans to read and interact than Markdown or HTML as agents' output."
+++

I always ask agent to generate [AsciiDoc](https://asciidoc.org/) instead of Markdown or HTML.

Back in May, [a Claude Code blog post](https://claude.com/blog/using-claude-code-the-unreasonable-effectiveness-of-html) go viral.
It laid out several benefits of replacing Markdown with HTML: better readability, interactivity, richer charts, and so on. To me, though, it might just want to burn more token.

Compared with Markdown, raw HTML is neither easy to read nor easy to edit, which largely defeats the point of Markdown in the first place.
When I read an LLM's output, I often find things to nitpick. Sometimes I want to revise it myself or add a little more content.
At that point, a concise, editable format matters more to me, and that is where AsciiDoc kick in.

AsciiDoc is like Markdown but "stronger" (although much more complex syntax to remember). It supports images, text formatting, syntax highlighting, complex tables, [PlantUML](https://plantuml.com), and more.
It can also export to HTML, PDF, and DOCX. PlantUML in particular GOOD in my opinion: agents can generate near perfect sequence diagrams, database tables, and class diagrams.
I like using it with the [IntelliJ AsciiDoc Plugin](https://plugins.jetbrains.com/plugin/7391-asciidoc).
You can preview the HTML output immediately, with no toolchain setup to worry about.
It is easy to read, and it looks great when shared with the team.

You might say, "But some things need interactive content, or an HTML UI showcase." In that case, just drop this in:

```adoc
++++
include::some.html[]
++++
```
