provider "aws" {
    region = "ap-south-1"
    profile = "default"
}

resource "aws_instance" "ec2" {
	ami = "ami-011c99152163a87ae"
	instance_type = "t2.micro"
	tags = {
	       Name = "Summer_task-6"
	}
}

resource "aws_ebs_volume" "storage" {
	availability_zone = aws_instance.ec2.availability_zone
	size = 1 
	tags = {
	       Name = "Summer_volume"
	}
}

resource "aws_volume_attachment"  "ebs_attach" {
	device_name = "/dev/sdh"
	volume_id = aws_ebs_volume.storage.id
	instance_id = aws_instance.ec2.id
}