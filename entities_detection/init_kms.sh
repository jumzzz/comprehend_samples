mkdir -p config
aws kms create-key \
    --tags TagKey=Purpose,TagValue=Test \
    --description "Development Test Key" > config/kms_config.json

python parse_s3_kms.py config/kms_config.json config/s3_config.json