
resource "aws_s3_bucket" "coalfire" {
  
  bucket  = var.name
  acl     = "private"
  lifecycle_rule {
  id = "store"
  prefix = "Images/"
  enabled = true
  transition {
      days          = 90
      storage_class = "GLACIER"
    }
  }
  lifecycle_rule{
  id = "cleanup"
  prefix = "logs/"
  enabled = true
  expiration {
    days = 90
  }
  }
   

  }
  
