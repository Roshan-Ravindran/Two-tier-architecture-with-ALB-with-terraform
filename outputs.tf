output "ipaddress" {
  value = aws_lb.test.dns_name
}
