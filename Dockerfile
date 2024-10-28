FROM alpine:latest
LABEL maintainer="Oleks Dovzh oleksdovz@gmail.com"

RUN apk upgrade --no-cache -a --prune
RUN apk add --no-cache git curl helm

ADD  https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64  /usr/bin/yq

RUN  chmod +x /usr/bin/yq

RUN helm plugin install --version=v0.9.0 https://github.com/chartmuseum/helm-push.git