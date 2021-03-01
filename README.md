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

- Create the NV deployment file:

## file - nv-deployment.tf
```
module "nv-deployment" {
    source                  = "git::https://github.com/devseclabs/nv-deployment/?ref=main"

    #see provider.tf - k8s context configured in ~/-kube/config
    context                 =   "my-local-context"

    #nv conf
    manager_svc_type        =   "LoadBalancer"
    scanner_replicas        =   1
    controller_replicas     =   1
    nv_version              =   "4.1.2"

    #license data
    license                 =   "my-license-key""

    # Dockerhub settings
    registry_username       =   "dockerhub-user"
    registry_password       =   "dockerhub-pass"
}
```

-  Deploy and Manage your deployment using terraform:
    - init your plugins  - ```terraform init```
    - plan your deployment - ```terraform plan```
    - apply the changes in your cluster ```terraform apply```

### Clean Up
- destroy your deployment: ```terraform destroy```
