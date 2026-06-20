local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local terraform_snippets = {
  -- Provider AWS
  s("provider_aws", {
    t({
      "terraform {",
      "  required_providers {",
      "    aws = {",
      "      source  = \"hashicorp/aws\"",
      "      version = \"~> ",
      i(1, "5.0"),
      "\"",
      "    }",
      "  }",
      "}",
      "",
      "provider \"aws\" {",
      "  region = \"",
      i(2, "us-east-1"),
      "\"",
      "}",
    }),
  }),

  -- EC2 Instance
  s("ec2", {
    t({
      "resource \"aws_instance\" \"",
      i(1, "example"),
      "\" {",
      "  ami           = \"",
      i(2, "ami-0c55b159cbfafe1f0"),
      "\"",
      "  instance_type = \"",
      i(3, "t2.micro"),
      "\"",
      "",
      "  tags = {",
      "    Name = \"",
      i(4, "my-instance"),
      "\"",
      "  }",
      "}",
    }),
  }),

  -- VPC
  s("vpc", {
    t({
      "resource \"aws_vpc\" \"",
      i(1, "main"),
      "\" {",
      "  cidr_block           = \"",
      i(2, "10.0.0.0/16"),
      "\"",
      "  enable_dns_hostnames = true",
      "  enable_dns_support   = true",
      "",
      "  tags = {",
      "    Name = \"",
      i(3, "main-vpc"),
      "\"",
      "  }",
      "}",
    }),
  }),

  -- Subnet
  s("subnet", {
    t({
      "resource \"aws_subnet\" \"",
      i(1, "public"),
      "\" {",
      "  vpc_id            = aws_vpc.",
      i(2, "main"),
      ".id",
      "  cidr_block        = \"",
      i(3, "10.0.1.0/24"),
      "\"",
      "  availability_zone = \"",
      i(4, "us-east-1a"),
      "\"",
      "",
      "  tags = {",
      "    Name = \"",
      i(5, "public-subnet"),
      "\"",
      "  }",
      "}",
    }),
  }),

  -- Security Group
  s("sg", {
    t({
      "resource \"aws_security_group\" \"",
      i(1, "allow_ssh"),
      "\" {",
      "  name        = \"",
      i(2, "allow-ssh"),
      "\"",
      "  description = \"",
      i(3, "Allow SSH access"),
      "\"",
      "  vpc_id      = aws_vpc.",
      i(4, "main"),
      ".id",
      "",
      "  ingress {",
      "    from_port   = 22",
      "    to_port     = 22",
      "    protocol    = \"tcp\"",
      "    cidr_blocks = [\"",
      i(5, "0.0.0.0/0"),
      "\"]",
      "  }",
      "",
      "  egress {",
      "    from_port   = 0",
      "    to_port     = 0",
      "    protocol    = \"-1\"",
      "    cidr_blocks = [\"0.0.0.0/0\"]",
      "  }",
      "}",
    }),
  }),

  -- RDS Database
  s("rds", {
    t({
      "resource \"aws_db_instance\" \"",
      i(1, "default"),
      "\" {",
      "  allocated_storage    = ",
      i(2, "20"),
      "  storage_type         = \"gp2\"",
      "  engine               = \"",
      i(3, "postgres"),
      "\"",
      "  engine_version       = \"",
      i(4, "15.3"),
      "\"",
      "  instance_class       = \"",
      i(5, "db.t3.micro"),
      "\"",
      "  db_name              = \"",
      i(6, "mydb"),
      "\"",
      "  username             = \"",
      i(7, "admin"),
      "\"",
      "  password             = \"",
      i(8, "changeme123"),
      "\"",
      "  skip_final_snapshot  = true",
      "}",
    }),
  }),

  -- Variables
  s("variable", {
    t({
      "variable \"",
      i(1, "environment"),
      "\" {",
      "  description = \"",
      i(2, "Environment name"),
      "\"",
      "  type        = ",
      i(3, "string"),
      "  default     = \"",
      i(4, "dev"),
      "\"",
      "}",
    }),
  }),

  -- Outputs
  s("output", {
    t({
      "output \"",
      i(1, "instance_id"),
      "\" {",
      "  description = \"",
      i(2, "The ID of the instance"),
      "\"",
      "  value       = aws_instance.",
      i(3, "example"),
      ".id",
      "}",
    }),
  }),
}

ls.add_snippets("terraform", terraform_snippets)
