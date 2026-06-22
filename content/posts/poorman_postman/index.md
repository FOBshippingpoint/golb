+++
title = "Poorman: A Minimal Postman Alternative"
date = '2026-06-22'
draft = false
tags = ['postman', 'shell']
summary = 'Postman alternative built with shell and curl.'
+++

Because of [Postman](https://www.postman.com/)'s bloat, I created something even more terrifying with POSIX shell, curl, and jq: [Poorman](https://github.com/FOBshippingpoint/poorman).

An example:

```bash
#!/bin/sh

. ./poorman.sh

GET /users/1
Snapshot

POST /posts --json '
{
  "title": "poorman",
  "body": "A very limited alternative to postman",
  "userId": 1
}
'
Snapshot
```

`GET` and `POST` are just wrappers around `curl -X GET/POST`, so you can append whatever curl options you need.
`Snapshot` means "paste the API response here." The whole script almost looks like some kind of <abbr title="Domain-Specific Language">DSL</abbr>.

## DSL-ish

Poorman's syntax is inspired by [ShellSpec](https://github.com/shellspec/shellspec):
a DSL that is simple, readable, and still flexible. It may not look like one at first glance, but it is still valid shell script.

Design principles:

- Request methods are UPPERCASE: `GET`, `POST`, `PATCH`, `PUT`, `DELETE`

  It looks clean and familiar.
- Configuration values are UPPERCASE: `BASE_URL`, `DRY_RUN`

  They feel like environment variables.
- Public methods use PascalCase: `CurlOptionOnce`, `Only`, `BeforeHook`

  This separates them from ordinary shell functions, making it obvious that they are Poorman functions.
- Private methods use snake_case: `_after_hook`, `_self_replace`

  These are not meant to be called or overridden by users.

## Documentation Full of Examples

I like documentation with examples. Whenever I see the output of `man blah` without examples, I feel sad.
The help text can be extremely detailed and still somehow avoid telling you how to use the thing directly.
That is why almost every function in [Poorman's documentation](https://github.com/FOBshippingpoint/poorman/blob/main/README.adoc) includes an example.

![Example of the Only modifier](doc_with_example.png)

## Out of Scope

When I was trying to reproduce some JMeter scripts at $dayjob, I considered adding assertions.
I generated some ideas with AI and got things like `ExpectStatus 200` and `Expect ".token" != "null"`.
They sounded cool, so I started implementing those functions.

Halfway through, I realized something was wrong. The edge cases and assertion types would never end.
Comparing decimals in shell is already hard enough, so why did I think it was a good idea to implement assertions in shell?

> "Every line of code is a debt. The best code is no code at all.[^1]"

A feature nobody needs only adds complexity and makes it harder to maintain.
So I gave up and kept the code small (297 lines).

![Gemini's proposal](ai_assertion.png)

## ...

A while later, I rediscovered the value of a UI.
So I vibe-coded a Python + HTML web UI:

![Poorman Web UI](web_ui.png)

Terrifying. Completely violates the core idea. Bye.

[^1]: https://blog.codinghorror.com/the-best-code-is-no-code-at-all/
