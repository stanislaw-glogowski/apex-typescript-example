resource "aws_api_gateway_rest_api" "api" {
  count = "${var.is_active}"
  name = "${var.name}"
}

resource "aws_api_gateway_resource" "hello_resource" {
  count = "${var.is_active}"
  rest_api_id = "${aws_api_gateway_rest_api.api.id}"
  parent_id = "${aws_api_gateway_rest_api.api.root_resource_id}"
  path_part = "hello"
}

# Intex action
resource "aws_api_gateway_method" "hello_method" {
  count = "${var.is_active}"
  rest_api_id = "${aws_api_gateway_rest_api.api.id}"
  resource_id = "${aws_api_gateway_resource.hello_resource.id}"
  http_method = "GET"
  authorization = "NONE"
  request_parameters = {
    "method.request.querystring.query" = true
  }
}

resource "aws_api_gateway_integration" "hello_integration" {
  count = "${var.is_active}"
  rest_api_id = "${aws_api_gateway_rest_api.api.id}"
  resource_id = "${aws_api_gateway_resource.hello_resource.id}"
  http_method = "${aws_api_gateway_method.hello_method.http_method}"
  integration_http_method = "POST"
  type = "AWS_PROXY"
  credentials = "${var.credentials}"
  uri = "${var.hello_lambda_url}"
}

# Deployment
resource "aws_api_gateway_deployment" "deployment" {
  count = "${var.is_active}"
  rest_api_id = "${aws_api_gateway_rest_api.api.id}"
  depends_on = [
    "aws_api_gateway_integration.hello_integration",
  ]
  stage_name = "${var.stage}"
}

