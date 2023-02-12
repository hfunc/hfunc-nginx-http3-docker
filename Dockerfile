# 构建 http3环境
FROM hikit/nginx-http3-build:latest as build

RUN mkdir /home/build/nginx && mkdir /home/nginx

COPY ./nginx-quic /home/build/nginx

WORKDIR /home/build/nginx

RUN ./auto/configure --prefix=/home/nginx \
     --with-debug \
     --with-http_v2_module \
     --with-http_v3_module \
     --with-stream_quic_module \
     --with-cc-opt="-I../openssl/include -I../pcre/include"   \
     --with-ld-opt="-L../openssl/ssl -L../openssl/crypto -L../pcre/lib" \
    && make \
    && make install

FROM debian:buster-slim
RUN mkdir /home/nginx

COPY --from=build /home/nginx /home/nginx
COPY --from=build /home/build/pcre/lib /usr/local/lib

ENV LD_LIBRARY_PATH /usr/local/lib
ENV PATH /home/nginx/sbin:$PATH

WORKDIR /home/nginx/sbin

ENTRYPOINT ["nginx","-g","daemon off;"]



