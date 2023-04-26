output "public_dns" {
    value = aws_db_instance.instance.endpoint
}

output "arn" {
    value = aws_db_instance.instance.arn
}