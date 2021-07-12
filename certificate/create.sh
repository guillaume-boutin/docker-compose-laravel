#!/bin/sh

DOMAIN=$1
{\
    echo "CA"; \
    echo "Quebec"; \
    echo "Montreal"; \
    echo "SnapX"; \
    echo "Development"; \
    echo $DOMAIN; \
    echo "support@$DOMAIN"; \
} | openssl req -newkey rsa:2048 -nodes -keyout /home/cert/ssl/$DOMAIN.pem -x509 -days 5000 -out /home/cert/ssl/$DOMAIN.crt

openssl pkcs12 -inkey /home/cert/ssl/$DOMAIN.pem -in /home/cert/ssl/$DOMAIN.crt -export -out /home/cert/ssl/$DOMAIN.p12 -password pass:secret

echo ""

chown -R cert:cert /home/cert/ssl