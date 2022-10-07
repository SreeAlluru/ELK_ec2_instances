resource "aws_instance" "Kibana_Server" {
  ami           = data.aws_ami.Kibana.id
  instance_type = "m4.large"

  # security group
  vpc_security_group_ids = [aws_security_group.kibana_security.id]
  # key-pair
  key_name          = "elk"
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
  instance_type          = "m4.large"
  vpc_security_group_ids = [aws_security_group.BastionSecurity.id]
  key_name               = "elk"
  #availability_zone      = "eu-west-2"
  subnet_id              = data.aws_subnet.public.id

  tags = {
    Name = "BastionHost"
  }
}

resource "aws_instance" "Logstash" {
  ami           = data.aws_ami.Kibana.id
  instance_type = "m4.large"

  # security group
  vpc_security_group_ids = [aws_security_group.logstach_security.id]
  # key-pair
  key_name          = "elk"
  #availability_zone = "eu-west-2"
  # subnet
  subnet_id = data.aws_subnet.private.id
  # EIP

  tags = {
    Name = "logstash Server"
  }
}


resource "aws_instance" "ElasticSearch" {
  ami           = data.aws_ami.Kibana.id
  instance_type = "m4.large"

  # security group
  vpc_security_group_ids = [aws_security_group.elastic_security.id]
  # key-pair
  key_name          = "elk"
  #availability_zone = "eu-west-2"
  # subnet
  subnet_id = data.aws_subnet.private.id
  # EIP

  tags = {
    Name = "elastic  Server"
  }
}


resource "aws_instance" "Demo_Server1" {
  ami           = data.aws_ami.Kibana.id
  instance_type = "m4.large"

  # security group
  vpc_security_group_ids = [aws_security_group.demo_security.id]
  # key-pair
  key_name          = "elk"
  #availability_zone = "eu-west-2"
  # subnet
  subnet_id = data.aws_subnet.private1.id
  # EIP

  tags = {
    Name = "demo_Server1"
  }
}

resource "aws_instance" "Demo_Server2" {
  ami           = data.aws_ami.Kibana.id
  instance_type = "m4.large"

  # security group
  vpc_security_group_ids = [aws_security_group.demo_security.id]
  # key-pair
  key_name          = "elk"
  #availability_zone = "eu-west-2"
  # subnet
  subnet_id = data.aws_subnet.private2.id
  # EIP

  tags = {
    Name = "demo_Server2"
  }
}


resource "aws_instance" "Demo_Server3" {
  ami           = data.aws_ami.Kibana.id
  instance_type = "m4.large"

  # security group
  vpc_security_group_ids = [aws_security_group.demo_security.id]
  # key-pair
  key_name          = "elk"
  #availability_zone = "eu-west-2"
  # subnet
  subnet_id = data.aws_subnet.private3.id
  # EIP

  tags = {
    Name = "demo_Server3"
  }
}