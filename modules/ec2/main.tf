resource "aws_instance" "app" {
  ami                  = "ami-0f5ee92e2d63afc18"
  instance_type        = "t3.micro"
  subnet_id            = var.subnet_id
  iam_instance_profile = var.iam_instance_profile
}

resource "aws_instance" "app2" {
  ami                  = "ami-0f5ee92e2d63afc18"
  instance_type        = "t3.micro"
  subnet_id            = var.subnet_id
  iam_instance_profile = var.iam_instance_profile
}