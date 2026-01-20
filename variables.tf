variable "region" {
  default = "ap-south-1"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "bucket_name" {
  description= "default name of private s3 bucket"
  default = "adi-private-app-bucket-001"
}

variable "tf_state_bucket" {
  default = "adi-terraform-remote-state-001"
}

variable "tf_lock_table" {
  default = "terraform-state-lock"
}
