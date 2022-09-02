

resource "aws_s3_bucket" "bucket" {
  bucket_prefix = var.bucket_prefix
  acl    = var.acl


versioning {
        enabled = var.versioning
    }

server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = var.kms_master_key_id
        sse_algorithm     = var.sse_algorithm
      }
    }
}  

tags = var.tags
}

  resource "aws_s3_bucket" "website_bucket" {
  bucket = "this-is-only-a-test"
  acl = "public-read"
  #policy = data.aws_iam_policy_document.website_policy.json
  website {
    index_document = "index.html"
    error_document = "index.html"
  }
}




  
  