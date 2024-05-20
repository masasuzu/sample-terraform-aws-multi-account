# remote stateで情報を連携するパターン

あらかじめリモートステートのS3バケットに以下のバケットポリシーを追加する。

```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "from account-b",
            "Effect": "Allow",
            "Principal": {
                "AWS": "${IAM Role or User ARN}"
            },
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::${バケット名}/remote-state/account-a/terraform.tfstate"
        }
    ]
}
```
