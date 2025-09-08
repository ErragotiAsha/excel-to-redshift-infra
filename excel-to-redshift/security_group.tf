resource "aws_security_group" "redshift_sg" {
  name        = "redshift-sg"
  description = "Allow access to Redshift only from trusted sources"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 5439
    to_port     = 5439
    protocol    = "tcp"
    cidr_blocks = ["10.0.1.0/24"] # Allow access from public subnet or update as needed
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "redshift-sg"
  }
}
