resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket

  versioning {
    enabled = var.versioning
  }

  tags = {
    Name = "s3-data-bootcamp-jmru111292"
  }
}

resource "aws_s3_bucket_object" "object_raw" {
  bucket   = aws_s3_bucket.bucket.id
  key      = "raw/"
  source   = "/dev/null"
}
resource "aws_s3_bucket_object" "object_stage" {
  bucket   = aws_s3_bucket.bucket.id
  key      = "stage/"
  source   = "/dev/null"
}
resource "aws_s3_bucket_object" "object_scripts" {
  bucket   = aws_s3_bucket.bucket.id
  key      = "scripts/"
  source   = "/dev/null"
}
resource "aws_s3_bucket_object" "object_jars" {
  bucket   = aws_s3_bucket.bucket.id
  key      = "jars/"
  source   = "/dev/null"
}
resource "aws_s3_bucket_object" "object_xml_jar" {
  bucket   = aws_s3_bucket.bucket.id
  key      = "jars/spark-xml_2.12-0.15.0.jar"
  source   = "jars/spark-xml_2.12-0.15.0.jar"
  etag     = filemd5("jars/spark-xml_2.12-0.15.0.jar")
}
resource "aws_s3_bucket_object" "object_logs_script" {
  bucket   = aws_s3_bucket.bucket.id
  key      = "scripts/logs_transform.py"
  source   = "scripts/logs_transform.py"
  etag     = filemd5("scripts/logs_transform.py")
}
resource "aws_s3_bucket_object" "object_reviews_script" {
  bucket   = aws_s3_bucket.bucket.id
  key      = "scripts/revs_transform.py"
  source   = "scripts/revs_transform.py"
  etag     = filemd5("scripts/revs_transform.py")
}
resource "aws_s3_bucket_object" "object_movie" {
  bucket   = aws_s3_bucket.bucket.id
  key      = "raw/movie_reviews.csv"
  source   = "data/movie_review.csv"
  etag     = filemd5("data/movie_review.csv")
}
resource "aws_s3_bucket_object" "object_log" {
  bucket   = aws_s3_bucket.bucket.id
  key      = "raw/log_reviews.csv"
  source   = "data/log_reviews.csv"
  etag     = filemd5("data/log_reviews.csv")
}
resource "aws_s3_bucket_object" "object_purchase" {
  bucket   = aws_s3_bucket.bucket.id
  key      = "raw/user_purchase.csv"
  source   = "data/user_purchase.csv"
  etag     = filemd5("data/user_purchase.csv")
}