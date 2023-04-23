output "id" {
    value = aws_vpc.main.id
}

output "public_rt_id" {
    value = aws_vpc.main.default_route_table_id
}