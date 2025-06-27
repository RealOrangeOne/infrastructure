resource "b2_bucket" "gitea" {
  bucket_name = "0rng-gitea"
  bucket_type = "allPrivate"

  default_server_side_encryption {
    algorithm = "AES256"
    mode      = "SSE-B2"
  }

  lifecycle_rules {
    file_name_prefix              = ""
    days_from_hiding_to_deleting  = 1
    days_from_uploading_to_hiding = 0
  }
}

resource "b2_application_key" "gitea" {
  key_name  = "gitea"
  bucket_id = b2_bucket.gitea.id
  capabilities = [
    "readFiles",
    "deleteFiles",
    "listBuckets",
    "listFiles",
    "readBucketEncryption",
    "readBucketReplications",
    "readBuckets",
    "shareFiles",
    "writeBucketEncryption",
    "writeBucketReplications",
    "writeFiles",
  ]
}

resource "b2_bucket" "restic" {
  bucket_name = "0rng-restic"
  bucket_type = "allPrivate"

  default_server_side_encryption {
    algorithm = "AES256"
    mode      = "SSE-B2"
  }

  lifecycle_rules {
    file_name_prefix              = ""
    days_from_hiding_to_deleting  = 1
    days_from_uploading_to_hiding = 0
  }
}

resource "b2_application_key" "restic" {
  key_name  = "restic"
  bucket_id = b2_bucket.restic.id
  capabilities = [
    "readFiles",
    "deleteFiles",
    "listBuckets",
    "listFiles",
    "readBucketEncryption",
    "readBuckets",
    "shareFiles",
    "writeBucketEncryption",
    "writeFiles",
  ]
}

resource "b2_application_key" "restic_repos" {
  for_each = toset(["walker", "tang", "casey", "grimes"])

  key_name    = "restic-${each.key}"
  bucket_id   = b2_bucket.restic.id
  name_prefix = "${each.key}/"
  capabilities = [
    "readFiles",
    "deleteFiles",
    "listBuckets",
    "listFiles",
    "readBucketEncryption",
    "readBuckets",
    "shareFiles",
    "writeBucketEncryption",
    "writeFiles",
  ]
}

resource "b2_application_key" "infrastructure" {
  key_name = "infrastructure"
  capabilities = [
    "bypassGovernance",
    "deleteBuckets",
    "deleteFiles",
    "deleteKeys",
    "listBuckets",
    "listFiles",
    "listKeys",
    "readBucketEncryption",
    "readBucketReplications",
    "readBucketRetentions",
    "readBuckets",
    "readFileLegalHolds",
    "readFileRetentions",
    "readFiles",
    "shareFiles",
    "writeBucketEncryption",
    "writeBucketReplications",
    "writeBucketRetentions",
    "writeBuckets",
    "writeFileLegalHolds",
    "writeFileRetentions",
    "writeFiles",
    "writeKeys",
  ]
}
