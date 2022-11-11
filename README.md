This image is based on node:12-alpine and has Terraform 0.13.4, Terragrunt 0.25.2, the AWS CLI, and Azure CLI and Yarn installed (see Dockerfile for all other installed utilities).

Combination of https://github.com/jch254/docker-node-terraform-aws and https://github.com/alpine-docker/terragrunt, in order to support lambda build with nodejs runtime, and terraform extension for unsupported resources using aws cli.

Azure CLI: https://github.com/Azure/azure-cli/issues/8863

```
# Uses base image mihirpatel/node-terragrunt-aws:${TERRAFORM}-${TERRAGRUNT}, so make sure base image is built with required versions
# Set Arguments
TERRAGRUNT=0.39.2
TERRAFORM=1.3.3
AZURE=2.41.0
image="mihirpatel/node-terragrunt-aws-az"
tag="14-bullseye-${TERRAFORM}-${TERRAGRUNT}-${AZURE}"

# Build
docker build --build-arg TERRAGRUNT=${TERRAGRUNT} --build-arg TERRAFORM=${TERRAFORM} --build-arg AZURE=${AZURE} --no-cache -t ${image}:${tag} .

# Push to registry
docker push ${image}:${tag}
```


