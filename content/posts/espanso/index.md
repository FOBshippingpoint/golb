+++
title = "Try Espanso. Auto-complete Email, Address, or Phone Number"
date = 2024-02-14
tags = ["espanso"]
draft = false
summary = "Espanso is a text expansion tool that lets you type common phrases with short triggers."
+++

[Espanso](https://espanso.org/) is a **text expansion tool**. You can define keywords for common phrases, type fewer characters, and save yourself some effort.
That may sound a little abstract, so here is an example.
Many platforms use an email address as the account name.
If we set `:mail` as a keyword, we can save time and avoid typos.

The official website has very detailed installation instructions, so you can just follow them.
For Windows, I recommend installing it from the command line with `winget install Espanso.Espanso`,
we don't have to keep clicking through annoying "Next" buttons.

## Configuration And Practical Examples

Espanso's configuration files are located under `C:\Users\[your_username]\AppData\Roaming\espanso`:

```text
├─config
│      default.yml
│
└─match
    │  base.yml # 👈 Keywords are configured here
    │
    └─packages # Packages
        ├─actually-all-emojis
        └─shruggie
```

The pattern locates in `base.yml`. Here is a practical example:

```yml
matches:
  # Email
  - trigger: ":mail"
    replace: "john.doe@example.com"
  # Student ID
  - trigger: ":001"
    replace: "001342045"
  # School email
  - trigger: ":cc"
    replace: "001342045@cc.ncu.edu.tw"
  # Name
  - trigger: ":name"
    replace: "John Doe"
  # Triple nerd face, which I often use in chats
  - trigger: ":nd"
    replace: "🤓🤓🤓"
  # Phone number
  - trigger: ":phone"
    replace: "0912345678"
  # ID number
  - trigger: ":id"
    replace: "A123456789"
  # Home address
  - trigger: ":addr"
    replace: "台北市中正區重慶南路一段122號"
```

Pretty simple, right? The `:` prefix is not required.
Just a leader key to avoid triggering expansions accidentally.
Here is what the `:nd` expansion looks like in practice:

![real example](espanso_nerd_face.gif)

## ...

Espanso actually has many more features, such as shell commands, regex matches, forms, variables, packages, and so on.
Honestly, I only use it as a quick text completion tool.

Espanso is powerful and stable, but promoting it to general users may still require a graphical interface.
However, I think configuring with YAML is hard to ordinary people.
