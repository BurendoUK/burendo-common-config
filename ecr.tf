resource "aws_ecr_repository" "stackedit" {
  provider             = aws.eire
  name                 = "stackedit"
  image_tag_mutability = "MUTABLE"
}
