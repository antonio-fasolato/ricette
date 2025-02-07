FROM alpine:3.21.2

RUN apk add --no-cache tzdata bash rust cargo nginx
RUN cargo install --version 0.4.40 mdbook
RUN cargo install mdbook-indexing

RUN ln -s /usr/share/zoneinfo/Europe/Rome /etc/localtime
RUN ln -sf /dev/stdout /var/log/nginx/access.log && ln -sf /dev/stderr /var/log/nginx/error.log
COPY docker/nginx.conf /etc/nginx/http.d/default.conf

RUN mkdir /ricette | true
RUN mkdir /book | true
WORKDIR /ricette

ENTRYPOINT ["bash", "-c", "chmod +x /ricette/docker/run-in-docker.sh && /ricette/docker/run-in-docker.sh"]
