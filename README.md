# General
This simple example implements the [Serverless Applications with AWS Lambda and API Gateway](https://registry.terraform.io/providers/hashicorp/aws/2.34.0/docs/guides/serverless-with-aws-lambda-and-api-gateway) from the Official documentation

## Usage
1. Make sure you have `terragrunt` installed on your machine
2. Authenticate to AWS
3. You can Modify AWS Region in `infrastructure/terragrunt.hcl` file Globally (for all environment) or overwrite it by creating a new `provider.tf` under the envinment folder.
4. Navigate to the `infrastructure\<environment>` folder and run the following command to create a "Hello World" lambda and expose it through the API Gateway
```
terragrunt run-all apply
```
5. As a result, terragrunt will provide you the Base URL which you can navite to invoke the function (please find the example below):
```
base_url = "https://9jsa9ocmyj.execute-api.us-east-1.amazonaws.com/dev"
```
6. Please remember to Destoy all resources after the test with following command:
```
terragrunt run-all destroy
```
