import sys
from awsglue.transforms import *
from awsglue.utils import getResolvedOptions
from pyspark.context import SparkContext
from awsglue.context import GlueContext
from awsglue.job import Job
from pyspark.sql.functions import *
from pyspark.ml.feature import Tokenizer, StopWordsRemover

args = getResolvedOptions(sys.argv, ['JOB_NAME'])

sc = SparkContext()
glueContext = GlueContext(sc)
spark = glueContext.spark_session
job = Job(glueContext)
job.init(args['JOB_NAME'], args)
job.commit()
bucket = "s3://s3-data-bootcamp-elchemarug0102003/"
path_mr = "raw/movie_review.csv"
mr = (spark
    .read
    .option("header", "true")
    .option("inferSchema", "true")
    .csv(bucket + path_mr))

tokenizer = Tokenizer(inputCol="review_str", outputCol="words")
remover = StopWordsRemover(inputCol="words", outputCol="words_filtered")
mr = tokenizer.transform(mr)
mr = remover.transform(mr)
mr = mr.withColumn("positive_review", when(array_contains("words_filtered",'good'), 1).otherwise(0))
mr = mr.withColumn('insert_date', current_timestamp())
mr = mr.drop('review_str',
             'words',
             'words_filtered')

mr.write.mode('overwrite').parquet(bucket + 'stage/movie_reviews')