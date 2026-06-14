+++
title = "厭倦了重複打E-mail、地址、電話嗎？試試Espanso吧！"
date = 2024-02-14
tags = ["espanso"]
draft = false
summary = "Espanso是一個關鍵字擴展軟體，只要將常用的詞設成關鍵字，就能少敲幾個鍵，輕鬆又方便。"
+++

[Espanso](https://espanso.org/)是一個**關鍵字擴展軟體**，只要將常用的詞設成關鍵字，就能少敲幾個鍵，輕鬆又方便。這樣講或許有些抽象，舉個例子來說，很多平台常常會用E-mail當作帳號吧？如果我們把`:mail`設成關鍵字，就能省下許多時間，也避免了打錯字的風險。

官網有非常詳細的安裝教學，照著做就可以囉～如果是Windows的朋友，推薦用`winget install Espanso.Espanso`在命令列安裝，不用再按什麼煩人的下一步了。

## 設定與實際用例

Espanso的設定檔放在`C:\Users\[your_username]\AppData\Roaming\espanso`這個目錄底下：
```text
├─config
│      default.yml
│
└─match
    │  base.yml # 👈關鍵字在這邊設定
    │
    └─packages # 外掛
        ├─actually-all-emojis
        └─shruggie
```

我們要編輯的就是這個`base.yml`，舉個實際的例子：
```yml
matches:
  # 電郵
  - trigger: ":mail"
    replace: "john.doe@example.com"
  # 學號
  - trigger: ":001"
    replace: "001342045"
  # 學校電郵
  - trigger: ":cc"
    replace: "001342045@cc.ncu.edu.tw"
  # 姓名
  - trigger: ":name"
    replace: "王大明"
  # 三重nerd face，我聊天的時候常用
  - trigger: ":nd"
    replace: "🤓🤓🤓"
  # 電話號碼
  - trigger: ":phone"
    replace: "0912345678"
  # 身分證字號
  - trigger: ":id"
    replace: "A123456789"
  # 住家地址
  - trigger: ":addr"
    replace: "台北市中正區重慶南路一段122號"
```

是不是很簡單啊？注意`:`不是必要的，只是為避免誤觸補完功能而加上的前綴字元。這邊附上一個`:nd`實際補完情形：

![real example](espanso_nerd_face.gif)

## ...

其實Espanso還有許許多多功能，例如呼叫shell回傳值、Regex配對、表單、變數、外掛等等等，說實話覺得有點多了，我僅僅把他當作一個快速補完工具。

Espanso的功能的確十分豐富而且穩定，但或許要向一般使用者推廣還差了「圖形化界面」，用YAML設定這件事對一般人而言頗具難度。
