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
path = ~/M/foo/

[options]
read_all = False
verbose = 0
```

配置分为三部分：retriever，destination 以及 options。

retriever 负责连接邮件服务器，其参数请查询您的邮件服务商的相应参数，尤其是 type 与 server。用户名与密码有特殊需求，请参考后面的描述。

destination 描述取得的邮件的储存位置。我们已经假设了我们的邮件文件夹为 `~/M`，由于我们有多个账户，我们不可能将全部储存在一个文件夹中，于是我们在 `~/M` 中建立文件夹 `foo` （请您自己取自己喜欢的名字），将所取文件储存在此。

options 中，这里记录了是否每次全量更新，以及啰嗦程度等，其他选项请参考手册。

## 实际运行与定时任务

当写好一个配置文件 `~/.getmail/foo` 时，可以通过
```bash
getmail -v --rcfile foo
```
来测试是否成功。

如果有多个配置文件，对应多个帐号，可以在一行命令中做到
```bash
getmail --rcfile foo --rcfile bar
```

之后可以将之放到 crontab 中
```crontab
*/10 * * * * /usr/bin/getmail --rcfile foo --rcfile bar
```
该 crontab 表示每10分钟执行一次，您可以更改为您所需要的参数。

## 用户密码相关

对于大部分邮箱来说（例如清华，outlook），可以直接使用帐号对应的用户名密码，但对于一些邮箱需要特殊配置

### QQ 邮箱

对于 QQ 邮箱来说，要想在普通客户端获取邮箱内容，首先需要授权开启 IMAP/POP3，在此时你会设置一个邮箱的独立密码。我们同时推荐开启 SMTP 功能，以便之后的发信。在之后的设置中（包括发信部分），你使用的密码都是该独立密码。

### Gmail

需要先开启「Allow less secure apps」的选项，如何打开请查阅谷歌。之后便可以使用用户密码登录。注意到 imap.gmail.com 可以国内访问，故可以不配置代理。
