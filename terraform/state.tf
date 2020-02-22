resource "aws_iam_user" "terraform" {
  name = "terraform"
}

resource "aws_s3_bucket" "tfstate" {
    bucket = "0rng-terraform"
    acl = "private"
}

resource "aws_iam_user_policy" "terraform" {
    name = "terraform"
    user = aws_iam_user.terraform.name

    policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": "iam:*",
            "Resource": "${aws_iam_user.terraform.arn}"
        },
        {
            "Sid": "VisualEditor1",
            "Effect": "Allow",
            "Action": "s3:*",
            "Resource": [
                "${aws_s3_bucket.tfstate.arn}",
                "${aws_s3_bucket.tfstate.arn}/*"
            ]
        }
    ]
}
EOF
}
