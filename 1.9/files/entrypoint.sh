#!/bin/bash

chown -R :www-data /var/www/html/files
chmod 770 /var/www/html/files

# Execute the CMD
exec "$@"