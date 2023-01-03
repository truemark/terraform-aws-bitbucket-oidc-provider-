data "tls_certificate" "thumbprint" {
  count = var.create_provider ? 1 : 0

  url = var.url
}

resource "aws_iam_openid_connect_provider" "github" {
  count = var.create_provider ? 1 : 0
  
  url = var.url
  client_id_list = coalescelist(var.client_id_list, ["sts.amazonaws.com"])
  thumbprint_list = data.tls_certificate.thumbprint[0].certificates[*].sha1_fingerprint

  tags = var.tags
}