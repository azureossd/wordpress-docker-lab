#!/bin/bash

# set -e

# That wp-config.php doesn't exist means WordPress is not installed/configured yet.
if [ ! -e "/home/site/wwwroot/wp-config.php" ]; then
    echo "INFO: There in no wordpress, going to restore backup...:"
    while [ -d /home/site/wwwroot ]
    do
        mkdir -p /home/bak
        mv /home/site/wwwroot /home/bak/wordpress_bak$(date +%s)            
    done
    mkdir /home/site/wwwroot
    cd /home/site/wwwroot
    wget https://raw.githubusercontent.com/azureossd/wordpress-docker-lab/master/wordpressdb.sql
    mysql -h $DATABASE_HOST -u $DATABASE_USERNAME -p$DATABASE_PASSWORD $DATABASE_NAME < wordpressdb.sql
    wget https://raw.githubusercontent.com/azureossd/wordpress-docker-lab/master/wordpress-src/wordpress-azure-linux-appservice.tar.gz
    tar -xf wordpress-azure-linux-appservice.tar.gz -C /home/site/wwwroot
    cp /usr/src/wordpress/wp-config.php /home/site/wwwroot/ && chmod 777 /home/site/wwwroot/wp-config.php
    chown -R nginx:nginx /home/site/wwwroot
fi

/usr/local/bin/entrypoint.sh
