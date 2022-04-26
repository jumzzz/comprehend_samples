# tmp_file='tmp_caller_identity.json'
# skel_file='assume_policy_skeleton.json'
# aws sts get-caller-identity > $tmp_file
# python generate_role.py --caller_identity $tmp_file --role_template $skel_file comprehend_policy.json
# job_name='comprehend-job-sample'


document_role='comprehend_role.json'
document_policy='comprehend_policy.json'

description_role='role_description.json'
description_policy='policy_description.json'

# aws iam create-role --role-name comprehend-role-v3 \
#             --assume-role-policy-document file://$document_role > $description_role

# aws iam create-policy --policy-name comprehend-policy \
#             --policy-document file://$document_policy > $description_policy

# aws iam create-policy --policy-name comprehend-policy-v2 --policy-document file://comprehend_policy.json > policy_description.json


policy_arn=$(jq '.Policy.Arn' policy_description.json)

aws iam attach-role-policy --role-name comprehend-role-v3 --policy-arn arn:aws:iam::238029455348:policy/comprehend-policy > attach_policy_description.json
