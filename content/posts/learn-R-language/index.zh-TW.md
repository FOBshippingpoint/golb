+++
title = "學一下R語言"
date = "2023-01-26"
description = "R語言學習小筆記"
tags = [ "R語言", "平安走路許願帳戶", ]
draft = false
summary = '關於我R語言的學習歷程'
+++

## 為什麼要學 R？

由於哈爸於[平安走路許願帳戶][commutagSwak]的專案提供的參考範例是使用R
語言，然而我根本沒學過R，雖然用Python
也未嘗不可，但既然有這個機緣不妨學習一下
，搞不好以後做研究的時候會用到也說不定。

## R 簡介

R是1993
年出生的統計專門程式語言，如《[Deep R Programming][deep r]》寫道的：「R was
written “for statisticians by statisticians”.」，R 的創造者是Ross Ihaka和
Robert Gentleman，兩位皆是統計學家。R的DNA
裡面有統計學的血繼限界，支援許多統計的函式方法，例如`mean`、`median`、`sd`，平均數、中位數、標準差等等開箱即可用（off
the shelf），不像Python還要另外引入statistics library。

### R vs. Python

已熟悉Python的人，說不定會想知道R與Python有何不同。在我稍微玩了一下R
之後，打從心底認為R才是處理資料的王者（雖然近年活躍度不如Python）。至於其他方面的比較請參考Norm Matloff
教授寫的〈[R vs. Python for Data Science][r v python]〉。Python的pandas
亦有提供[相關比較][pandas v r]。

## 從哪裡著手？

稍微說說我尋找學習資源的心路歷程。一開始想從R
的[官網][r project]學，結果找了半天沒看到線上資源或是Getting Started
之類的頁面，只好轉頭搜尋Reddit，果不其然聰慧的網友們提供了各種線上學習資源，
其中我個人推薦的有《[fasteR: Fast Lane to Learning R!][fasteR]》、
《[Applied Statistics with R][applied r]》、
《[Deep R Programming][deep r]》，我主要是看fasteR。

### [fasteR][fasteR]

「通往R的快速道路」是加利福尼亞大學戴維斯分校的Norm Matloff
教授所撰寫的，總共有37個Lessons，整篇文章就是在GitHub上的一份Markdown文件
，不用翻頁這點還滿方便的。雖然文章看起來好像很長，但不知何故有許多重複的Lesson
1 ~ Lesson 13，所以實際上並沒有那麼多。

fasteR主打在R shell 就可以操作學習，不需要另外下載IDE（Integrated Development
Environment，整合開發環境）。

我的學習方式是依照fasteR建議的，「Your Turn」時乖乖做練習，讓打字的手指肌肉跟腦子接在一起，
程式這種東西不實際打打看可記不起來。

[commutagSwak]: https://www.facebook.com/groups/884215176097253/
[r v python]: https://github.com/matloff/R-vs.-Python-for-Data-Science
[pandas v r]: https://pandas.pydata.org/docs/getting_started/comparison/comparison_with_r.html
[r project]: https://www.r-project.org/
[fasteR]: https://github.com/matloff/fasteR
[applied r]: https://book.stat420.org/
[deep r]: https://deepr.gagolewski.com/
