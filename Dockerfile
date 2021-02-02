FROM appsvcorg/wordpress-alpine-php:0.9.3

COPY startup.sh /usr/local/bin/startup.sh
RUN chmod -R +x /usr/local/bin

ENTRYPOINT [ "startup.sh" ]