import argparse
import json
import boto3

def get_args():
    parser = argparse.ArgumentParser()
    parser.add_argument('--caller_identity', help='Source file for JSON file caller_identity.json')
    parser.add_argument('--role_template', help='File path of role template.')
    
    parser.add_argument('dst_role_config', help='Role Config Destination in JSON')
    args = parser.parse_args()
    return args

def load_json(path):
    with open(path) as f:
        return json.load(f)

def get_current_region():
    return boto3.session.Session().region_name

def dump_json(path, data):
    with open(path, 'w') as f:
        data_str = json.dumps(data, indent=4)
        f.write(data_str)

def dump_json(path, data):
    with open(path, 'w') as f:
        data_str = json.dumps(data, indent=4)
        f.write(data_str)

def main():
    args = get_args()
    
    caller_identity_config = load_json(args.caller_identity)
    account_id = caller_identity_config['Account']
    role_template = load_json(args.role_template)
    region_name = get_current_region()

    source_arn = f'arn:aws:comprehend:{region_name}:{account_id}:*/*'
    role_template['Statement'][0]['Condition']['StringEquals']['aws:SourceAccount'] = account_id
    role_template['Statement'][0]['Condition']['ArnEquals']['aws:SourceArn'] = source_arn

    print('Role Generated for: ')
    print(json.dumps(role_template, indent=4))
    print(' ')

    dump_json(args.dst_role_config, role_template)

    print(f'role template dumped to {args.dst_role_config}')

if __name__ == '__main__':
    main()