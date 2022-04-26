echo "Creating Bucket..."
aws s3 mb s3://comprehend-in-out-v4

echo "Putting Encryption..."
aws s3api put-bucket-encryption \
    --bucket comprehend-in-out-v4 \
    --server-side-encryption-configuration file://config/s3_config.json

echo "Uploading ../input_data/"
aws s3 cp ../input_data/ s3://comprehend-in-out-v4/input_data/ --recursive
