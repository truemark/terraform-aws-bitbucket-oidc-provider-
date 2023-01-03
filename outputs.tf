output "provider_arn" {
  value = join("", aws_iam_openid_connect_provider.github.*.arn)
}

output "provider_id" {
  value = join("", aws_iam_openid_connect_provider.github.*.id)
}
