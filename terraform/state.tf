resource "aws_iam_user" "terraform" {
  name = "terraform"
}

resource "aws_iam_user" "minio" {
  name = "minio"
}

resource "aws_s3_bucket" "tfstate" {
  bucket = "0rng-terraform"
}

resource "aws_s3_bucket_versioning" "tfstate" {
  bucket = aws_s3_bucket.tfstate.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "tfstate" {
  bucket = aws_s3_bucket.tfstate.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "tfstate" {
  bucket = aws_s3_bucket.tfstate.id

  rule {
    id     = "Delete old non-current versions"
    status = "Enabled"

    noncurrent_version_expiration {
      noncurrent_days = 30
    }
  }
}

resource "aws_s3_bucket_acl" "tfstate" {
  bucket = aws_s3_bucket.tfstate.id
  acl    = "private"
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
    aws_iam_user.terraform.name,
    aws_iam_user.minio.name,
  ])

  user       = each.key
  policy_arn = aws_iam_policy.terraform_state.arn
}
