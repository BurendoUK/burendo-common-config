resource "aws_ecr_repository" "stackedit" {
  name                 = "stackedit"
  image_tag_mutability = "MUTABLE"
}
