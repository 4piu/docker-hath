FROM alpine AS builder
ENV HatH_VERSION 1.6.1
ENV HatH_SHA256 b8889b2c35593004be061064fcb6d690ff8cbda9564d89f706f7e3ceaf828726
RUN apk --no-cache add unzip \
    && mkdir -p /tmp/hath_client \
    && cd /tmp/hath_client \
    && wget https://repo.e-hentai.org/hath/HentaiAtHome_$HatH_VERSION.zip -O hath.zip \
    && echo -n ""$HatH_SHA256"  hath.zip" | sha256sum -c \
    && unzip hath.zip

FROM eclipse-temurin:8-jre AS release
WORKDIR /root
COPY --from=builder /tmp/hath_client .
COPY build/start.sh .
RUN chmod +x start.sh
CMD ["start.sh"]
