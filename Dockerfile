FROM abiosoft/caddy:latest

COPY Caddyfile /etc/Caddyfile

VOLUME /www

EXPOSE 80 443

ENTRYPOINT ["/usr/bin/caddy"]
CMD ["--conf", "/etc/Caddyfile"]