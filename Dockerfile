FROM openresty/openresty:alpine-fat

RUN luarocks install luaossl \
      CRYPTO_DIR=/usr/local/openresty/openssl \
      OPENSSL_DIR=/usr/local/openresty/openssl \
  && luarocks install lapis

WORKDIR /opt/apps/transparent-cache
ADD . /opt/apps/transparent-cache

ENTRYPOINT ["lapis", "server"]
EXPOSE 8080/tcp
