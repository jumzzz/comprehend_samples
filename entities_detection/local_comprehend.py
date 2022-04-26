import argparse
import boto3
import json
import time

def get_args():
    parser = argparse.ArgumentParser()
    parser.add_argument('--input_s3_uri',  help='input S3 URI of the documents')
    parser.add_argument('--output_s3_uri', help='output S3 URI of the documents')
    parser.add_argument('--job_name', help='Job name of the AWS Comprehend Job.')
    parser.add_argument('--role_arn', help='Role ARN.')
    parser.add_argument('--s3_kms_id', help='SSE KMS ID.')

    args = parser.parse_args()
    return args


def print_args(args):
    print('Current Arguments of args.')
    print(f'input_s3_uri = {args.input_s3_uri}')    
    print(f'output_s3_uri = {args.output_s3_uri}')    
    print(f'job_name = {args.job_name}')    
    print(f'role_arn = {args.role_arn.strip()}')
    print(f's3_kms_config = {args.s3_kms_id.strip()}')


def main():
    args = get_args()

    print_args(args)

    input_s3_uri = args.input_s3_uri
    output_s3_uri = args.output_s3_uri
    
    job_name = args.job_name
    
    role_arn = args.role_arn.replace('"', '')
    s3_kms_id = args.s3_kms_id.replace('"', '')

    print(role_arn)
    print(s3_kms_id)

    client = boto3.client('comprehend')
    response = client.start_entities_detection_job(
        InputDataConfig={
            'S3Uri': input_s3_uri,
            'InputFormat': 'ONE_DOC_PER_FILE'
        },
        OutputDataConfig={
            'S3Uri': output_s3_uri,
            'KmsKeyId': s3_kms_id
        },
        DataAccessRoleArn=role_arn,
        JobName=job_name,
        LanguageCode='en',
    )

    job_id = response['JobId']

    status = client.describe_entities_detection_job(JobId=job_id)

    print('Original Status: ')
    print(status)
    print('')

    status = status['EntitiesDetectionJobProperties']['JobStatus'].upper()

    while status != 'COMPLETED' and status != 'FAILED':
        print(f'JobId = {job_id} still in progress...')
        print(f'Current Status = {status}')
        time.sleep(5)

        status = client.describe_entities_detection_job(JobId=job_id)
        status = status['EntitiesDetectionJobProperties']['JobStatus'].upper()

    print(f'Final Status: {status}')
    print('Done...')


if __name__ == '__main__':
    main()