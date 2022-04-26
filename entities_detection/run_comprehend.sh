input_s3_uri='s3://comprehend-in-out-v4/input_data/sample_comprehend_01.txt'
output_s3_uri='s3://comprehend-in-out-v4/output_data'
job_name='comprehend-sample-job'

s3_kms_id=$(cat config/kms_config.json | jq '.KeyMetadata.KeyId')
# role_arn=$(cat config/role_description.json | jq '.Role.Arn')
# role_arn=$(aws iam list-roles | jq '.Roles[0].Arn')
role_arn='arn:aws:iam::238029455348:role/comprehend-test-role'


# echo $kms_key_id
# echo $role_arn

# python local_comprehend.py --help

python local_comprehend.py --input_s3_uri $input_s3_uri \
            --output_s3_uri $output_s3_uri \
            --job_name $job_name \
            --role_arn $role_arn \
            --s3_kms_id $s3_kms_id


# aws comprehend start-entities-