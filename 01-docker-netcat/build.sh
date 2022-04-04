#!/bin/sh
VERSION="1.0.0"
DOCKERFILE="Dockerfile"
BASE="alpine"
DIST="3.14"
PACKAGES="netcat-openbsd"
CMD='["nc","-l","-p","5060"]'

create_dockerfile(){
cat > "${DOCKERFILE}" <<EOF
FROM ${BASE}:${DIST}
LABEL maintainer=Andre.Santos

RUN apk add --no-cache ${PACKAGES}

EXPOSE 5060

RUN addgroup -g 1069 ncuser && adduser --disabled-password --gecos "" --no-create-home --uid 1069 --ingroup ncuser ncuser
USER ncuser

CMD ${CMD}
EOF
}


create_dockerfile
sha1sum ${DOCKERFILE}

# Build and push to dockerhub
docker build -t netcat:${VERSION} .
docker tag netcat:${VERSION} asantoshub/netcat:${VERSION}
docker push asantoshub/netcat:${VERSION}
