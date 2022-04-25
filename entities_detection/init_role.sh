aws sts get-caller-identity > config/caller_identity.json
python generate_role.py --caller_identity config/caller_identity.json \
            --role_template config/role_template.json config/comprehend_role.json

aws iam create-role --role-name comprehend-role-v3 \
            --assume-role-policy-document file://config/comprehend_role.json > config/role_description.json