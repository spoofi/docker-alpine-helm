FROM alpine:latest

ARG VERSION=3.7.2
ARG TARGETARCH

RUN apk add --update --no-cache curl ca-certificates && \
	curl -L https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/${TARGETARCH}/kubectl -o /usr/local/bin/kubectl && \
    chmod +x /usr/local/bin/kubectl && \
    curl -L https://get.helm.sh/helm-v${VERSION}-linux-${TARGETARCH}.tar.gz |tar xvz && \
    mv linux-${TARGETARCH}/helm /usr/bin/helm && \
    chmod +x /usr/bin/helm && \
    rm -rf linux-${TARGETARCH} && \
    apk del curl && \
    rm -f /var/cache/apk/*
	
CMD ["sh"]
