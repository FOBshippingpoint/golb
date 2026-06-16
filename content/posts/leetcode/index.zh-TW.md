+++
title = '四種語言的Leetcode'
date = '2026-06-14'
draft = false
tags = ['leetcode']
categories = []
+++

前陣子挑戰用不同語言練習Leetcode：Java、Go、Rust、Ruby。

<!--more-->

除了Java外，Go、Rust、Ruby都是我從來沒學過的語言，簡單總結一下感想：

- Java：無聊穩定，我最熟練的語言，如果有IDE的話寫起來並不慢。
- Go：意外性最低的語言，標準函式庫應有盡有，編譯速度快。
- Rust：嚴格的特性使其最不適合Leetcode，但或許是最不容易出錯的（前提是要編譯成功）。
- Ruby：自由度高表達性強，但缺乏類型（Type）這點很可惜。


我用每種語言寫了模板產生器，從Leetcode網頁擷取網址、題目名稱當作輸入，
再用cli解析產生目錄跟檔案模板。或許這是其中最快樂的部份……

值得一提的是Ruby提供一流的cli支援，透過[OptionParser](https://docs.ruby-lang.org/en/master/optparse/tutorial_rdoc.html)定義好short option / long option / help就可以直接倒成hash來用了：

```ruby
# https://github.com/FOBshippingpoint/leetcode-revamp/blob/main/contrib/scaffold.rb
options = {}
OptionParser.new do |parser|
  parser.banner = 'Usage: ruby scaffold.rb [options]'

  parser.on('-t', '--title TITLE', "Title of a LeetCode problem (e.g., '1. Two Sum')")
  parser.on('-u', '--url URL', 'URL of the LeetCode problem')

  parser.on('-h', '--help', 'Prints this help') do
    puts parser
    exit
  end
end.parse!(into: options)
```

https://github.com/FOBshippingpoint/leetcode-revamp
