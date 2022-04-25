aws sts get-caller-identity > config/caller_identity.json
python generate_role.py --caller_identity config/caller_identity.json \
            --role_template config/role_template.json config/comprehend_role.json

aws iam create-role --role-name comprehend-role-v2 \
            --assume-role-policy-document file://config/role_template.json > config/role_description.json