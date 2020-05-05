#!/bin/bash

# CA 作成
CACN=saml.local
openssl req -new -x509 -sha256 -subj "/C=JP/ST=Tokyo/L=Chiyoda-ku/O=danmrkm/OU=Section/CN=${CACN}" -newkey rsa:2048 -nodes -out ./ca.crt -keyout ./ca.key -days 1095

# CSR 作成
IDPCN=idp.saml.local
openssl req -new -nodes -sha256 -subj "/C=JP/ST=Tokyo/L=Chiyoda-ku/O=danmrkm/OU=Section/CN=${IDPCN}" -keyout idp.key -out idp.csr

SPCN=sp.saml.local
openssl req -new -nodes -sha256 -subj "/C=JP/ST=Tokyo/L=Chiyoda-ku/O=danmrkm/OU=Section/CN=${SPCN}" -keyout sp.key -out sp.csr

# CA で署名
openssl x509 -req -sha256 -CA ./ca.crt -CAkey ./ca.key -CAcreateserial -days 1095 -in ./idp.csr -out ./idp.crt
openssl x509 -req -sha256 -CA ./ca.crt -CAkey ./ca.key -CAcreateserial -days 1095 -in ./sp.csr -out ./sp.crt
