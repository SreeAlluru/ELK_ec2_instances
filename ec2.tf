resource "aws_instance" "Kibana_Server" {
  ami           = data.aws_ami.Kibana.id
  instance_type = "t3.micro"

  # security group
  vpc_security_group_ids = [aws_security_group.kibana_security.id]
  # key-pair
  key_name          = "key1"
  #availability_zone = "eu-west-2"
  # subnet
  subnet_id = data.aws_subnet.public.id
  # EIP

  tags = {
    Name = "Kibana Server"
  }
}

resource "aws_eip" "BastionHost_EIP" {
  instance = aws_instance.BastionHost.id
  vpc      = true
}

resource "aws_instance" "BastionHost" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.BastionSecurity.id]
  key_name               = "key1"
  #availability_zone      = "eu-west-2"
  subnet_id              = data.aws_subnet.public.id

  tags = {
    Name = "BastionHost"
  }
}