resource "aws_glue_job" "logs_transf" {
  name     = "logs_transf"
  role_arn = "arn:aws:iam::579142603345:role/glue_admin"
  glue_version = "3.0"
  worker_type = "G.1X"
  number_of_workers = "2" 

  command {
    script_location = "s3://s3-data-bootcamp-elchemarug0102003/scripts/logs_transform.py"
  }
  default_arguments = {"--job-language" = "python"
                       "--extra-jars" = "s3://s3-data-bootcamp-elchemarug0102003/jars/spark-xml_2.12-0.15.0.jar"
                       }
}
resource "aws_glue_job" "revs_transf" {
  name     = "revs_transf"
  role_arn = "arn:aws:iam::579142603345:role/glue_admin"
  glue_version = "3.0"
  worker_type = "G.1X"
  number_of_workers = "2" 

  command {
    script_location = "s3://s3-data-bootcamp-elchemarug0102003/scripts/revs_transform.py"
  }
  default_arguments = {"--job-language" = "python"
                       }
}