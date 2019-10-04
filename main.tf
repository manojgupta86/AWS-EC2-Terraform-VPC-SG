terraform {
backend "s3" {
bucket = "terrafrom-s3-manoj"
key="terraform.tfstate"
region="ap-south-1"
}
}
