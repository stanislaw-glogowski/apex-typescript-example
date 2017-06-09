resource "aws_iam_role" "role" {
  name = "${var.project}_api_gateway_role"
  assume_role_policy = "${file("${path.module}/policy/assume_role.json")}"
}

resource "aws_iam_role_policy" "policy_lambda" {
  name = "${var.project}_api_gateway_policy_lambda"
  role = "${aws_iam_role.role.id}"
  policy = "${file("${path.module}/policy/lambda.json")}"
}