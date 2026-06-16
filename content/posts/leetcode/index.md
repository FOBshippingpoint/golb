+++
title = 'Solving LeetCode in 4 Languages'
date = '2026-06-14'
draft = false
tags = ['leetcode']
categories = []
+++

Recently, I tried solving LeetCode problems in four languages: Java, Go, Rust, and Ruby.

<!--more-->

Except for Java, I had not learned any of them before. Here are my impressions:

- Java: boring but stable. I think this might be the language I would choose when I have an IDE.
- Go: no surprises. The standard library covers almost everything, and it compiles quickly.
- Rust: very strict. I don't think it is suitable for LeetCode, but it is probably the most "unbreakable" one, if you can get it to compile.
- Ruby: expressive and elegant, but the lack of typing is unfortunate. Unlike Python, Ruby does not really support gradual typing.

I wrote a template generator for each language. It reads a LeetCode URL and problem title, then creates the directories and files.
Probably the most interesting part...

One thing worth mentioning is that Ruby has great CLI support, where you can do a lot with just [OptionParser](https://docs.ruby-lang.org/en/master/optparse/tutorial_rdoc.html). Here is the snippet I wrote:

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
