# procmail

procmail 是一款强大的邮件处理工具，其主要功能是根据规则（recipe）匹配（使用 `egrep` ）邮件，若匹配，则传递到文件夹中或通过管道输送给别的软件或直接转发到别的邮件地址。

# getmail 与其的整合

我们之前配置的 `getmail` 是直接将邮件传递到文件中的，现在可以将其改为传递给 `procmail`。

只需将 `getmail` 的配置改为

```
[desintation]
type = MDA_external
path = /usr/bin/procmail
arguments = ("D=sth", )
```

而不是之前的文件夹目标，即可触发 procmail。

传递参数中的 `"D=sth"` 是给 `procmail` 的参数，该参数会进而传递到 `procmailrc`


# procmailrc

对于 `procmail` 规则，请参考 `procmailrc` 的 `man page`。

```
:0 [flags] [ : [locallockfile] ]
<zero or more conditions (one per line)>
<exactly one action line>
```

简单来说是以上的结构。

## 直接递送到文件夹中

```
:0:
$HOME/M/$D/
```

此处可以看出 `$D` 的作用。

## 传递到文件夹中，并传递给后层

```
:0 c:
$HOME/M/$D/

:0 Whi
| $HOME/.procmail/notify.sh $D
```

其中第一条 recipe 的 `c` 表示 Carbon Copy，即抄送后面的规则。

# 触发DBUS通知

参见 `notify.sh`，其中注意到 `$D` 被作为参数传递给该脚本，体现为 `$1`。

注意其中要设置正确的 dbus session address，并保证配置了相关的通知服务器，以及开启了 dbus。
