module "nv-deployment" {
source                  = "git::https://github.com/devseclabs/nv-deployment/?ref=develop"

# dockerhub by default
registry_username   = "registry-user"
registry_password   = "registry-pass"
#registry_server     = "registry-server"

#provider - k8s context
context = "gke-foo-dev"

#nv conf
manager_svc_type = "LoadBalancer"
scanner_replicas = 1
controller_replicas = 3
nv_version = "4.2.0"

#license data
license = "my-license-key"
}