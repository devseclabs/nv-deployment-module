# pass your sensitive data with tfvars
variable "sensitive_vars" {
  type = object({
    docker_user    = string
    docker_pass    = string
    admin_pass     = string
  })
  sensitive = true
}

module "nv-deployment" {
    source                  = "git::https://github.com/devseclabs/nv-deployment.git?ref=main"

    #see provider.tf - k8s context configured in ~/-kube/config
    context                 =   "nvdemo-context"

    # dockerhub by default
    registry_username   = var.sensitive_vars.docker_user
    registry_password   = var.sensitive_vars.docker_pass
    #registry_server     = "registry-server"

    #config enable
    enable_config = true
    #change admin pass
    pass = var.sensitive_vars.admin_pass

    #nv conf
    manager_svc_type = "LoadBalancer"
    scanner_replicas = 1
    controller_replicas = 3
    nv_version = "4.2.1"

    #license data
    license = ".secret/license.txt"
}
