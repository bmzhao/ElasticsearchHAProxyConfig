FROM haproxy:1.6
COPY haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg
COPY cors_file.http /usr/local/etc/haproxy/cors_file.http
EXPOSE 9400
EXPOSE 5602