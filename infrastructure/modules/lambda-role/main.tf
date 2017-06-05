resource "aws_iam_role" "lambda_role" {
  name = "${var.project}_lambda_function"
  assume_role_policy = "${file("${path.module}/policy/lambda_role.json")}"
}

resource "aws_iam_role_policy" "lambda_role_logs" {
  name = "${var.project}_lambda_function_logs"
  role = "${aws_iam_role.lambda_role.id}"
  policy = "${file("${path.module}/policy/lambda_role_logs.json")}"
}