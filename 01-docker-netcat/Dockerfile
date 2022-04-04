FROM alpine:3.14
LABEL maintainer=Andre.Santos

RUN apk add --no-cache netcat-openbsd

EXPOSE 5060

RUN addgroup -g 1069 ncuser && adduser --disabled-password --gecos "" --no-create-home --uid 1069 --ingroup ncuser ncuser
USER ncuser

CMD ["nc","-l","-p","5060"]
