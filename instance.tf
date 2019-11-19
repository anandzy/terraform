#First instance 
resource "aws_instance" "example" {
  ami           = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"

  # the VPC subnet
  subnet_id = "${aws_subnet.main-public-1.id}"

  # the security group here 'allow-ssh' is the subnet id
  vpc_security_group_ids = ["${aws_security_group.allow-ssh.id}"]

  # the public SSH key, herevmykeypair is the key name
  key_name = "${aws_key_pair.mac.key_name}"
}

resource "aws_ebs_volume" "ebs-volume-1" {
    availability_zone = "us-east-1a"
    size = 20
    type = "gp2" 
    tags {
        Name = "instance1"
    }
}

resource "aws_volume_attachment" "ebs-volume-1-attachment" {
  device_name = "/dev/xvdh"
  volume_id = "${aws_ebs_volume.ebs-volume-1.id}"
  instance_id = "${aws_instance.example.id}"
}


#Second Instance 
resource "aws_instance" "example1" {
  ami           = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"

  # the VPC subnet
  subnet_id = "${aws_subnet.main-public-1.id}"

  # the security group
  vpc_security_group_ids = ["${aws_security_group.allow-ssh.id}"]

  # the public SSH key
  key_name = "${aws_key_pair.mac.key_name}"
}

resource "aws_ebs_volume" "ebs-volume-2" {
    availability_zone = "us-east-1a"
    size = 20
    type = "gp2" 
    tags {
        Name = "instance2"
    }
}

resource "aws_volume_attachment" "ebs-volume-2-attachment" {
  device_name = "/dev/xvdh"
  volume_id = "${aws_ebs_volume.ebs-volume-2.id}"
  instance_id = "${aws_instance.example1.id}"
}

output "ip" {
    value = "${aws_instance.example.public_ip}"
    value = "${aws_instance.example1.public_ip}"
}
