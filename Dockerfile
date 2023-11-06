FROM alpine AS builder
ARG HatH_VERSION
ARG HatH_SHA256
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
CMD ["/root/start.sh"]
