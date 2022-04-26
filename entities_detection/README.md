# Using AWS Comprehend Insights

In this sample implementation we will implement the following.

## Steps to Run

You can use terraform to deploy your AWS Resources
```
terraform -chdir=infra/ init
terraform -chdir=infra/ plan
terraform -chdir=infra/ apply
```
Then generate a configuration file `config.json` using the following commands: 

```
terraform -chdir=infra/ output -json > config.json
```

Then, afterwards you can run `run_comprehend.sh`

```
chmod +x run_comprehend.sh
./run_comprehend.sh
```

This produces an output
```
...
JobId = 33416accdfab89b7175e5945c17df58f still in progress...
Current Status = IN_PROGRESS
JobId = 33416accdfab89b7175e5945c17df58f still in progress...
Current Status = IN_PROGRESS
JobId = 33416accdfab89b7175e5945c17df58f still in progress...
Current Status = IN_PROGRESS
JobId = 33416accdfab89b7175e5945c17df58f still in progress...
Current Status = IN_PROGRESS
JobId = 33416accdfab89b7175e5945c17df58f still in progress...
Current Status = IN_PROGRESS
JobId = 33416accdfab89b7175e5945c17df58f still in progress...
Current Status = IN_PROGRESS
JobId = 33416accdfab89b7175e5945c17df58f still in progress...
Current Status = IN_PROGRESS
Final Status: COMPLETED
Done...

```

## Cleaning up
After running this sample implementation feel free to clean up your resources

```
aws s3 rm s3://<name_of_the_bucket>/ --recursive
terraform -chdir=infra/ destroy
```

## Note
- You can change the `bucket_name`, `role_name`, and `policy_name` on `infra/vars.tf`