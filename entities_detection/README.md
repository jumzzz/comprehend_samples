# Using AWS Comprehend Insights

In this sample implementation we will implement the following.

```
```

## Steps to take

1. Get AWS Account ID

```
aws sts get-caller-identity
```

2. Create a Role

```
aws iam create-role --role-name Test-Role --assume-role-policy-document file://Test-Role-Trust-Policy.json
```

```
{
  "Role": {
      "AssumeRolePolicyDocument": "<URL-encoded-JSON>",
      "RoleId": "AKIAIOSFODNN7EXAMPLE",
      "CreateDate": "2013-06-07T20:43:32.821Z",
      "RoleName": "Test-Role",
      "Path": "/",
      "Arn": "arn:aws:iam::123456789012:role/Test-Role"
  }
}
```

3. Save the Role ARN
4. Create an SSE-KMS
