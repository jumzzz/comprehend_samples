import argparse
import boto3

def get_args():
    pass


def main():
    client = boto3.client('comprehend')
    response = client.start_entities_detection_job(
        InputDataConfig={
            'S3Uri': 'string',
            'InputFormat': 'ONE_DOC_PER_FILE',
            'DocumentReaderConfig': {
                'DocumentReadAction': 'TEXTRACT_ANALYZE_DOCUMENT',
                'DocumentReadMode': 'SERVICE_DEFAULT'|'FORCE_DOCUMENT_READ_ACTION',
                'FeatureTypes': [
                    'TABLES',
                ]
            }
        },
        OutputDataConfig={
            'S3Uri': 'string',
            'KmsKeyId': 'string'
        },
        DataAccessRoleArn='string',
        JobName='string',
        EntityRecognizerArn='string',
        LanguageCode='en',
        ClientRequestToken='string',
        VolumeKmsKeyId='string',
        VpcConfig={
            'SecurityGroupIds': [
                'string',
            ],
            'Subnets': [
                'string',
            ]
        },
        Tags=[
            {
                'Key': 'string',
                'Value': 'string'
            },
        ]
    )