#!/bin/bash

cd /etc/pki/tls/certs/
openssl genrsa -out mydomain.key 2048
openssl req -new -key mydomain.key -out mydomain.csr
openssl x509 -req -days 365 -in mydomain.csr -signkey mydomain.key -out mydomain.crt
sudo bash -c 'cat mydomain.key mydomain.crt >> /etc/pki/tls/certs/mydomain.pem'


