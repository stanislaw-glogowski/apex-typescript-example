module "lambda_role" {
  source = "../modules/lambda_role"
  project = "${var.project}"
}

module "api_gateway_role" {
  source = "../modules/api_gateway_role"
  project = "${var.project}"
}

module "api_gateway" {
  is_active = "${var.apex_function_lambda_with_api_gateway_event != "" ? 1 : 0}"
  source = "../modules/api_gateway"
  name = "${var.project}_api_gateway"
  stage = "${var.apex_environment}"
  credentials = "${module.api_gateway_role.arn}"
  hello_lambda_url = "arn:aws:apigateway:${var.aws_region}:lambda:path/2015-03-31/functions/${var.apex_function_lambda_with_api_gateway_event}/invocations"
}