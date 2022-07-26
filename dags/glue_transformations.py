from airflow.models import DAG
from airflow.providers.amazon.aws.operators.glue import AwsGlueJobOperator
from datetime import datetime, timedelta


### glue job specific variables
glue_job_name_logs = "logs_transf"
#glue_job_name_revs = "my_glue_job"
glue_iam_role = "glue_admin"
region_name = "us-east-2"


with DAG(dag_id = 'glue_af_pipeline', default_args = default_args, schedule_interval = None) as dag:
    glue_job_step = AwsGlueJobOperator(
        task_id = "glue_job_step",
        job_name = glue_job_name_logs,
        job_desc = f"triggering glue job {glue_job_name_logs}",
        region_name = region_name,
        iam_role_name = glue_iam_role,
        num_of_dpus = 1,
        dag = dag
        )