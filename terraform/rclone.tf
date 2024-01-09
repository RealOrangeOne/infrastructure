resource "aws_iam_user" "rclone" {
  name = "rclone"
}

resource "aws_iam_user_policy" "read-terraform-state" {
  name = "read-terraform-state"
  user = aws_iam_user.rclone.name

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "ReadTerraformState",
            "Effect": "Allow",
            "Action": [
                "s3:GetObject",
                "s3:ListBucket"
            ],
            "Resource": [
                "${aws_s3_bucket.tfstate.arn}/*",
                "${aws_s3_bucket.tfstate.arn}"
            ]
        }
    ]
}
EOF
}
