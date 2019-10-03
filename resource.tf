# Define SSH key pair for our instances
resource "aws_key_pair" "default" {
  key_name = "terraformprivatekey"
  public_key = "${file("${var.key_path}")}"
}

# Define webserver inside the public subnet
resource "aws_instance" "wb" {
   ami  = "${var.ami}"
   instance_type = "t2.micro"
   key_name = "${aws_key_pair.default.id}"
   subnet_id = "${aws_subnet.public-subnet.id}"
   vpc_security_group_ids = ["${aws_security_group.sgweb.id}"]
   associate_public_ip_address = true
   source_dest_check = false
   user_data = "${file("userdata.sh")}"

  tags = {
    Name = "webappserver"
  }
}

## Define database inside the private subnet
#resource "aws_instance" "db" {
#   ami  = "${var.ami}"
#   instance_type = "t2.micro"
#   key_name = "${aws_key_pair.default.id}"
#   subnet_id = "${aws_subnet.private-subnet.id}"
#   vpc_security_group_ids = ["${aws_security_group.sgdb.id}"]
#   source_dest_check = false

 # tags = {
 #   Name = "database"
 # }
#}
#resource "aws_db_instance" "default" {
#  allocated_storage    = 2
#  storage_type         = "gp2"
#  engine               = "mysql"
#  engine_version       = "5.7"
#  instance_class       = "db.t2.micro"
#  name                 = "mydb_test"
#  username             = "mydb_test"
#  password             = "mydb_test"
 # parameter_group_name = "default.mysql5.7"
#}


