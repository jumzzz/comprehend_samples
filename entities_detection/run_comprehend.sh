s3_uri=$(jq '.bucket_name.value' config.json | sed 's/"//g')
input_s3_uri=s3://$s3_uri/input_data/sample_comprehend_01.txt
output_s3_uri=s3://$s3_uri/output_data
job_name='comprehend-sample-job'

upload_file='../input_data/sample_comprehend_01.txt'

echo "Uploading $upload_dir to S3 $s3_uri..."
echo aws s3 cp $upload_file $input_s3_uri
aws s3 cp $upload_file $input_s3_uri

s3_kms_id=$(jq '.aws_kms_key_id.value' config.json | sed 's/"//g')
role_arn=$(jq '.aws_role_arn.value' config.json | sed 's/"//g')

echo input_s3_uri   = $input_s3_uri
echo output_s3_uri  = $output_s3_uri
echo job_name       = $job_name
echo s3_kms_id      = $s3_kms_id
echo role_arn       = $role_arn

python local_comprehend.py --input_s3_uri $input_s3_uri \
            --output_s3_uri $output_s3_uri \
            --job_name $job_name \
            --role_arn $role_arn \
            --s3_kms_id $s3_kms_id
