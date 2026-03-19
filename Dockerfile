FROM appsvcorg/wordpress-alpine-php:0.72

COPY startup.sh /usr/local/bin/startup.sh
RUN chmod -R +x /usr/local/bin

ENTRYPOINT [ "startup.sh" ]