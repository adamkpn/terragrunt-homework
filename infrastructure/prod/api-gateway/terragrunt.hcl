terraform {
  source = "../../../terraform-modules/api-gateway"
}

include "root" {
  path = find_in_parent_folders()
}

include "env" {
  path           = find_in_parent_folders("env.hcl")
  expose         = true
  merge_strategy = "no_merge"
}

inputs = {
  env         = include.env.locals.env
  lambda_invoke_arn = dependency.lambda.outputs.invoke_arn
  lambda_function_name = dependency.lambda.outputs.function_name
}

dependency "lambda" {
  config_path = "../lambda"

  mock_outputs = {
    invoke_arn = "invoke_arn"
    function_name = "function_name"
  }
}

