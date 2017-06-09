module "lambda_role" {
  source = "../modules/lambda-role"
  project = "${var.project}"
}