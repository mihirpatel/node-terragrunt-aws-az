ARG TERRAGRUNT
ARG TERRAFORM
FROM mihirpatel/node-terragrunt-aws:12-alpine-${TERRAFORM}-${TERRAGRUNT}

#https://docs.docker.com/engine/reference/builder/#understand-how-arg-and-from-interact
ARG TERRAGRUNT
ARG TERRAFORM
ARG AZURE
RUN echo "Terraform: ${TERRAFORM}, Terragrunt: ${TERRAGRUNT}, AZURE: ${AZURE}"

# https://github.com/Azure/azure-cli/issues/8863
# RUN apk --no-cache add postgresql-client postgresql
RUN apk add --no-cache --virtual=build gcc libffi-dev musl-dev openssl-dev make python3-dev linux-headers
RUN pip --no-cache-dir install virtualenv && python -m virtualenv /azure-cli
RUN /azure-cli/bin/python -m pip --no-cache-dir install azure-cli==${AZURE}
RUN echo -en '#!/usr/bin/env bash\n/azure-cli/bin/python -m azure.cli "$@"' > /usr/bin/az && chmod u+x /usr/bin/az
RUN apk del build

WORKDIR /apps

ENTRYPOINT []