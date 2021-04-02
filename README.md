# NV-Deployment-module
Terraform Neuvector Deployment using Module

## Versions

| Name | Version |
|------|---------|
| terraform | >= 0.14
| kubernetes provider| >= 2.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| nv_version | neuvector version to deploy or update | `string` | `{}` | yes |
| context | kubernetes context (~/.kube/config) | `string` | `{}` | yes |
| license | neuvector license key | `string` | `{}` | yes |
| manager_svc_type | NodePort/LoadBalancer ... | `string` | `[]` | yes |
| scanner_replicas | # replicas of scanners | `string` | `[]` | yes |
| controller_replicas | # replicas of controllers | `string` | `[]` | yes |
| registry_username | dockerhub username | `string` | `[]` | yes |
| registry_password  | dockerhub password | `string` | `[]` | yes |


### How to deploy

- Update your license key in: ```.secret/license.txt``` file
- Customize with your values the Neuvector Terraform Deployment file:

## file - nv-deployment.tf
```
module "nv-deployment" {
    source                  = "git::https://github.com/devseclabs/nv-deployment/?ref=main"

    #see provider.tf - k8s context configured in ~/-kube/config
    context                 =   "my-local-context"

    # dockerhub by default
    registry_username   = "registry-user"
    registry_password   = "registry-pass"
    #registry_server     = "registry-server"

    #nv conf
    manager_svc_type = "LoadBalancer"
    scanner_replicas = 1
    controller_replicas = 3
    nv_version = "4.2.0"

    #license data
    license = file(".secret/license.txt")
}
```

- Init your terraform plugins:
     ```terraform init```
- Plan your deployment and check all terraform resources configuration: 
     ```terraform plan```
- Apply your changes:
     ```terraform apply```

### Clean Up:
- Backup your configuration before
- if you want to delete the deployment: ```terraform destroy```
