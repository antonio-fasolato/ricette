FROM alpine:3.21.2

RUN apk add --no-cache tzdata bash nginx python3 py3-pip

RUN ln -s /usr/share/zoneinfo/Europe/Rome /etc/localtime
RUN ln -sf /dev/stdout /var/log/nginx/access.log && ln -sf /dev/stderr /var/log/nginx/error.log
#COPY docker/nginx.conf /etc/nginx/http.d/default.conf

RUN echo "server {listen 12345; root /ricette/site; location / { autoindex on; } }" > /etc/nginx/http.d/default.conf

WORKDIR /ricette
COPY mkdocs.yml /ricette/mkdocs.yml
COPY docs /ricette/docs
COPY requirements.txt /ricette/requirements.txt
RUN pip3 install --break-system-packages --no-cache-dir -r requirements.txt
RUN cd /ricette && \
    mkdocs build

ENTRYPOINT ["sh", "-c", "nginx -g 'daemon off;'"]
