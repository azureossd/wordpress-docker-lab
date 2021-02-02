#!/bin/bash

# set -e

# That wp-config.php doesn't exist means WordPress is not installed/configured yet.
if [ ! -e "$WORDPRESS_HOME/wp-config.php" ]; then
    wget https://raw.githubusercontent.com/azureossd/arm-templates-php/master/wordpressdb.sql
    mysql -h $DATABASE_HOST -u $DATABASE_USERNAME -p$DATABASE_PASSWORD $DATABASE_NAME < wordpressdb.sql
fi

/usr/local/bin/entrypoint.sh
