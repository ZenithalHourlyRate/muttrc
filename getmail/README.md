# getmail

## 配置文件夹

getmail 一般会在 `~/.getmail/` 文件夹下寻找配置文件（rcfile）。若要指定其他配置文件夹，请查询 getmail 的手册。

## rcfile

对于一个配置文件，我们有以下模板

```
[retriever]
type = SimpleIMAPSSLRetriever
server = imap.example.com
username = foo@example.com
password = password

[destination]
type = Maildir
path = ~/M/bar/

[options]
read_all = False
verbose = 0
```

配置分为三部分：retriever，destination 以及 options。

retriever 负责连接邮件服务器，其参数请查询您的邮件服务商的相应参数，尤其是 type 与 server。用户名与密码有特殊需求，请参考后面的描述。

destination 描述取得的邮件的储存位置。我们已经假设了我们的邮件文件夹为 `~/M`，由于我们有多个账户，我们不可能将全部储存在一个文件夹中，于是我们在 `~/M` 中建立文件夹 `bar` （请您自己取自己喜欢的名字），将所取文件储存在此。

options 中，这里记录了是否每次全量更新，以及啰嗦程度等，其他选项请参考手册。

## 用户密码相关
