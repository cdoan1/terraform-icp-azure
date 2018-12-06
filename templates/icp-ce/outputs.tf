output "ICP Console URL" {
  value = "https://${element(azurerm_public_ip.master_pip.*.fqdn, 0)}:8443"
}

output "ICP Proxy" {
  value = "${element(azurerm_public_ip.proxy_pip.*.fqdn, 0)}"
}

output "ICP Kubernetes API URL" {
  value = "https://${element(azurerm_public_ip.master_pip.*.fqdn, 0)}:8001"
}

output "ICP Admin Username" {
  value = "admin"
}

output "ICP Admin Password" {
  value = "${local.icppassword}"
}

output "cloudctl" {
  value = "cloudctl login --skip-ssl-validation -a https://${element(azurerm_public_ip.master_pip.*.fqdn, 0)}:8443 -u admin -p ${local.icppassword} -n default -c id-${var.cluster_name}-account"
}
