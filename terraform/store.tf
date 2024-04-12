# resource "random_password" "password" {
#   length = 16
#   special = true
# }

# resource "aws_ssm_parameter" "db_password" {
#     name = "/jones/db/password"
#     type = "SecureString"
#     value = random_password.password.result
#     key_id = aws_kms_key.mykey.arn
# }

resource "aws_ssm_parameter" "vpc_id" {
    name = "${local.ssm_prefix}/vpc-id"
    type = "String"
    value = aws_vpc.vpc_web.id
}