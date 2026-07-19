+++
title = "AI與AsciiDoc的不合理有效性"
date = 2026-07-19
tags = ["asciidoc", "agent"]
categories = []
draft = false
summary = "與其讓Agent產生Markdown/HTML，AsciiDoc更易於人類消化與善後"
+++

關於Agent產出的報告，我一律請他生成[AsciiDoc](https://asciidoc.org/)而非Markdown或HTML。

五月，Claude Code的[一篇blog](https://claude.com/blog/using-claude-code-the-unreasonable-effectiveness-of-html)火遍整個Vibe Coding圈子，
裡面闡述了HTML取代Markdown的幾種好處：更好閱讀、有互動性、圖表更豐富等等，但在我看來有點像是鼓勵你多消耗一點token。

相較於Markdown，HTML的原始碼並不好讀更不易編輯，大大削弱Markdown的優勢。我閱讀LLM的輸出時不免會有些地方想挑剔一下，甚至自行修改或加些內容，
這時精簡好編輯的格式對我來說更重要，在此情況下AsciiDoc反而脫穎而出。

AsciiDoc有點像Markdown強化版，內嵌圖片、文字排版、程式碼高亮、複雜表格、[PlantUML](https://plantuml.com)等等許多功能，
還能夠輸出成HTML、PDF、DOCX這些常用格式。尤其是PlantUML可謂是神來一筆，請Agent生成sequence diagram、database table、class diagram毫無阻力。
我喜歡搭配[IntelliJ AsciiDoc Plugin](https://plugins.jetbrains.com/plugin/7391-asciidoc)使用，
不用管環境工具鏈直接就能預覽HTML輸出，讀起來方便，分享給同事也是美美的。

你可能會說，但我有些東西需要互動內容或者UI Showcase必須得用HTML，這時請下：

```adoc
++++
include::some.html[]
++++
```
