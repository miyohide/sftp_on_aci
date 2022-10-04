# これは何か

SFTPでファイルを送受信するためのサーバーをAzure上で構築するためのTerraformスクリプトです。
以下の記事を参考に実装しました。

https://learn.microsoft.com/ja-jp/samples/azure-samples/sftp-creation-template/sftp-on-azure/

# 実行ログ

```
miyohide@tsubame 01_exec % sftp sftpuser001@xxx.xxx.xxx.xxx
sftpuser001@xxx.xxx.xxx.xxx's password:
Connected to xxx.xxx.xxx.xxx.
sftp> ls
upload
sftp> cd upload
sftp> pwd
Remote working directory: /upload
sftp> put test.txt
Uploading test.txt to /upload/test.txt
test.txt                                      100%   16     1.4KB/s   00:00
sftp> ls
test.txt
sftp> quit
miyohide@tsubame 01_exec %
```
