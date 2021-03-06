# Mutt 配置

处理邮件，难。

命令行处理邮件，更难。

但是能够在命令行中完成大部分工作，爽。

但是能够亲手处理（mangle）大部分细节，更爽。

## Tunight

本配置参加过一次 Tunight，讲稿和相关链接在 slides 文件夹中。

## 架构

本配置中，我们主要使用了三个程序，分别完成收、处理、发邮件的过程。尽管 Mutt 本身可以完成全过程，但本文不使用该方式。

本文使用 `getmail` 获取邮件，储存在 Maildir 中（可以参考 `procmail`，使得被传递前进行一些处理）；`mutt` 读取 Maildir 中的邮件，根据 muttrc 作出相应处理；当在 `mutt` 中写好邮件时，`mutt` 通过调用 `sendmail`（在我们的系统中链接被符号链接到 `msmtp` 上） 发送邮件。

由于三个程序之间的接口相当标准，您可以自由更换其中的部件。

三个软件的配置方式请参考其对应文件夹。

## 环境变量

我们可以设置这样一些环境变量，使得方便我们的使用。

```bash
export MAIL=/path/to/your/maildir
export EDITOR=your favorite editor
```

在设置了 `MAIL` 变量时，zsh 等 shell 会检查 `MAILCHECK` 的环境变量，以检查 `MAIL` 是否改动，若有改动，会在终端中提醒 `You have new mail.`

### 一些假设

我们会在配置文件中硬编码一些环境变量，所以我们作出以下假设，这些假设在所有配置中起作用。若您的部署与我不同，请在相应文件夹中找到相应字符串进行更改。

```bash
export MAIL=~/M/
```
