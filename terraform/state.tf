resource "aws_iam_user" "terraform" {
  name = "terraform"
}

resource "aws_s3_bucket" "tfstate" {
  bucket = "0rng-terraform"
  acl    = "private"

  versioning {
    enabled = true
  }

  lifecycle_rule {
    enabled = true

    noncurrent_version_expiration {
      days = 10
    }
  }

}

resource "aws_iam_user_policy" "modify-terraform-user" {
  name = "modify-terraform-user"
  user = aws_iam_user.terraform.name

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "ModifyTerraformUser",
            "Effect": "Allow",
            "Action": "iam:*",
            "Resource": "*"
        }
    ]
}
EOF
}


resource "aws_iam_policy" "terraform_state" {
  name = "terraform-state"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "TerraformState",
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

resource "aws_iam_user_policy_attachment" "terraform-state" {
  for_each = toset([
    aws_iam_user.terraform.name
  ])

  user       = each.key
  policy_arn = aws_iam_policy.terraform_state.arn
}
