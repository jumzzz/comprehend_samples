input_s3_uri='s3://comprehend-in-out-v2/input_data/comprehend_sample_01.pdf'
output_s3_uri='s3://comprehend-in-out-v2/output_data'
job_name='comprehend-sample-job'

s3_kms_id=$(cat config/kms_config.json | jq '.KeyMetadata.KeyId')
role_arn=$(cat config/role_description.json | jq '.Role.Arn')

# echo $kms_key_id
# echo $role_arn

# python local_comprehend.py --help

python local_comprehend.py --input_s3_uri $input_s3_uri \
            --output_s3_uri $output_s3_uri \
            --job_name $job_name \
            --role_arn $role_arn \
            --s3_kms_id $s3_kms_id

# aws comprehend start-entities-