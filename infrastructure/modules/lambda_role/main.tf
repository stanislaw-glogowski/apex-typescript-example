resource "aws_iam_role" "role" {
  name = "${var.project}_lambda_function"
  assume_role_policy = "${file("${path.module}/policy/assume_role.json")}"
}

resource "aws_iam_role_policy" "policy_logs" {
  name = "${var.project}_lambda_function_logs"
  role = "${aws_iam_role.role.id}"
  policy = "${file("${path.module}/policy/logs.json")}"
}