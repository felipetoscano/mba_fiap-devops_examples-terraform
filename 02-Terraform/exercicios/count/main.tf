provider "aws" {
  region = "us-east-1"
}

resource "aws_sqs_queue" "queue" {
  name = "fila-criada-${count.index}"
  tags = {
    environment = "development"
  }
  count = 3
}