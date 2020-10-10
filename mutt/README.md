# Mutt

## 文件约定

我们在 `~/.mutt` 中放置 `muttrc`，作为全局设置。

由于我们面对的是多账户的需求，对各个账户的配置文件，我们放置在 `~/.mutt/muttrc.d` 中。

对于其余配置文件，例如键位绑定，颜色配置，文件扩展名等，放在 `~/.mutt` 下供 `muttrc` 使用。

## 一些概念

刚进入 `mutt` 时，我们见到的是 `index` 界面，该界面列举了该邮箱（mailbox）中的邮件，一般包括时间，发件人，主题。

在最小配置中，我们打开了侧边栏（`sidebar`），其中列举了一些邮箱。

当我们选择一个邮件打开（通常是按 enter 键）后，进入的是 `pager` 界面，显示邮件具体内容。

若我们发信（compose，往往以 m 为快捷键）或回信（reply，往往以 r 为快捷键）时，我们进入的是 `compose` 界面。

当对按键不清楚时，可以随时按`?`键调出帮助界面。

## 最小工作配置

参见 minimal 文件夹，注释均在文件内，若有不清楚的，请查询手册。

## 笔者脱敏完整配置

参见 full 文件夹，大部分无注释。

## 颜色配置

笔者使用[该项目](https://github.com/altercation/mutt-colors-solarized)的配置 

## gpg 配置

`gpg.rc` 文件一般随着 `mutt` 安装是自动发放，一般在 `/usr/share/doc/mutt/samples` 中。

首先确保自己能签名一个文件，具体如何签参考 gpg 教程。

快速检验方式。
```
echo "Test" | gpg --clear-sign
```
若能成功签名，则无问题。

之后在 `gpg.rc` 中配置你所用签名密钥的指纹，并在 `muttrc` 中 source 该文件。

## 快捷键配置

参见 `full/muttrc.keybind`。该配置使得部分行为类似 `vim`

## 别名配置

参见 `full/muttrc.alias`。 别名可用于在发件时快速选定收件人。

## mailcap

邮件中有大量附件，如何处理这些附件是个问题，对此我们使用 mailcap 文件记录该关系。具体配置参见 `full/mailcap`

尤其是一些邮件发送者发来的是 html 页面，此时我们可以用 w3m 渲染该邮件。

## 邮件正文尾部签名

参见 `full/muttrc.d/foo`，其中设置了签名文件的位置。

## 邮件别名，邮件列表

一个邮件帐号可能对应多个邮件地址，此时我们用 `alternatives` 来记录。

一个帐号可能订阅了一些邮件列表，我们可以将用 `lists` 与 `subscribe` 来记录。
