data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  owners = ["099720109477"] # Canonical
}


data "aws_ami" "Kibana" {
  #most_recent = true

  filter {
    name   = "name"
    values = ["Kibana"]
  }

  owners = ["247548036690"] # Canonical
}


data "aws_ami" "ElasticSearch" {
  #most_recent = true

  filter {
    name   = "name"
    values = ["ElasticSearch"]
  }

  owners = ["247548036690"] # Canonical
}

data "aws_ami" "Logstash" {
  #most_recent = true

  filter {
    name   = "name"
    values = ["Logstash"]
  }

  owners = ["247548036690"] # Canonical
}

data "aws_vpc" "elk_vpc" {
  filter {
    name   = "tag:Name"
    values = ["elk_vpc"]
  }
}

data "aws_subnet" "public" {
  filter {
    name   = "tag:Name"
    values = ["public"]
  }
}

data "aws_internet_gateway" "igw" {
  filter {
    name   = "tag:Name"
    values = ["igw"]
  }
}

#data "aws_security_group" "elk_securitygrp" {
#  filter {
 #   name   = "tag:Name"
 #   values = ["elk_securitygrp"]
  #}
#}