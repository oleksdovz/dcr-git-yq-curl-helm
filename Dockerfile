FROM alpine:latest
LABEL maintainer="Oleks Dovzh oleksdovz@gmail.com"

RUN apk upgrade --no-cache -a --prune
RUN apk add --no-cache git curl wget bash yq

ADD  https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64  /usr/bin/yq

RUN  chmod +x /usr/bin/yq

ENV VERSION="3.16.2"

ENV BASE_URL="https://get.helm.sh"

RUN case `uname -m` in \
        x86_64) ARCH=amd64; ;; \
        armv7l) ARCH=arm; ;; \
        aarch64) ARCH=arm64; ;; \
        ppc64le) ARCH=ppc64le; ;; \
        s390x) ARCH=s390x; ;; \
        *) echo "un-supported arch, exit ..."; exit 1; ;; \
    esac && \
    wget ${BASE_URL}/helm-v${VERSION}-linux-${ARCH}.tar.gz -O - | tar -xz && \
    mv linux-${ARCH}/helm /usr/bin/helm && \
    chmod +x /usr/bin/helm && \
    rm -rf linux-${ARCH}

RUN helm plugin install --version=v0.9.0 https://github.com/chartmuseum/helm-push.git