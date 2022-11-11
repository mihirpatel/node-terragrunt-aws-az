ARG TERRAGRUNT
ARG TERRAFORM
FROM mihirpatel/node-terragrunt-aws:14-bullseye-${TERRAFORM}-${TERRAGRUNT}

#https://docs.docker.com/engine/reference/builder/#understand-how-arg-and-from-interact
ARG TERRAGRUNT
ARG TERRAFORM
ARG AZURE
RUN echo "Terraform: ${TERRAFORM}, Terragrunt: ${TERRAGRUNT}, AZURE: ${AZURE}"

# https://github.com/Azure/azure-cli/issues/8863
RUN pip install azure-cli==${AZURE}

WORKDIR /apps

ENTRYPOINT []