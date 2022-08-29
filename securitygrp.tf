resource "aws_security_group" "BastionSecurity" {
  name        = "ansible-server"
  description = "Allow ansible server inbound traffic"
  vpc_id      = data.aws_vpc.elk_vpc.id

  

  ingress {
    description = "Allow port 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "ansible-server"
  }
}




resource "aws_security_group" "kibana_security" {
  name        = "kibana-elk-security"
  description = "Allow kibana dashboard traffic"
  vpc_id      = data.aws_vpc.elk_vpc.id

  ingress {
    description = "Allow port 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  #security_groups  = [data.aws_security_group.public_sg.id] 

  ingress {
    description = "Allow port 5601"
    from_port   = 5601
    to_port     = 5601
    protocol    = "tcp"
    #cidr_blocks      = [module.bastion.private_ip]
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "kibana-elk-security"
  }
}

resource "aws_security_group" "elastic_security" {
  name        = "elastic-elk-security"
  description = "Allow  elasticsearchinbound traffic"
  vpc_id      = data.aws_vpc.elk_vpc.id

  ingress {
    description = "Allow port 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["192.168.0.0/16"]
  }
  #security_groups  = [data.aws_security_group.public_sg.id]


  ingress {
    description = "Allow port 9200"
    from_port   = 9200
    to_port     = 9200
    protocol    = "tcp"
    cidr_blocks = ["192.168.0.0/16"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "elastic-elk-security"
  }
}



resource "aws_security_group" "logstach_security" {
  name        = "logstach-elk-security"
  description = "Allow new logstash inbound traffic"
  vpc_id      = data.aws_vpc.elk_vpc.id

  ingress {
    description = "Allow port 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["192.168.0.0/16"]
    #security_groups  = [data.aws_security_group.public_sg.id]

  }

  ingress {
    description = "Allow port 5000"
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["192.168.0.0/16"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "logstach-elk-security"
  }
}

resource "aws_security_group" "demo_security" {
  name        = "demo-elk-security"
  description = "Allow demo security inbound traffic"
  vpc_id      = data.aws_vpc.elk_vpc.id

  ingress {
    description     = "Allow port 22"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    #security_groups = [data.aws_security_group.public_sg.id]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "demo-elk-security"
  }
}