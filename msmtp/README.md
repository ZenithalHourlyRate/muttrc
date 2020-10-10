# msmtp

`msmtp` 在本配置中用于发信。

## 文件约定

`msmtp` 的配置文件放置在 `~/.msmtprc` 中。

在我们的系统中，`sendmail` 被符号链接到 `msmtp`，故在之前的 `mutt` 配置中我们使用了 `sendmail`，若并非如此，请将 `mutt` 配置中的 `sendmail` 改为 `msmtp`，或将 `sendmail` 符号链接到 `msmtp` 上（可能会破坏其他服务）。

## 配置样例

```
defaults
auth    on
tls     on
tls_starttls off

account foo
host    example.com
port    465
from    foo@example.com
user    foo@example.com
password password

account bar
host    example.com
port    465
from    bar@example.com
user    bar@example.com
tls_starttls on
password password

account default : bar
```

## 帐号相关

帐号密码的相关问题，可以参考 getmail 文件夹 README.md 中的说明。

对于一些邮件提供商，其可能需要starttls，需要注意。例如office365，gmail，outlook均需要starttls。

## 命令运行

实际运行时，我们采用

```
msmtp -a foo
```

的方式选择使用的发信账户。故而在此前 `muttrc.d/foo` 的配置中相关配置需要与 msmtp 中的配置一致。
