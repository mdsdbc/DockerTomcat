====DockerTomcat====

#Docker Image built from centos7 with apache tomcat running
#Changed HTTP server port(8080) to 4041, later changed 8443 instead, exposes only port 4041

docker build -t mdsdbc/tomcat-8 .

#ssh pem style keys without the need to use java key store
#used changeit(default) as pass, default fields on the rest of the certificate

openssl req -x509 -newkey rsa:4096 -keyout xpand-rsa-key.pem -out xpand-rsa-cert.pem -days 36500

#The previous command generates the key with PKCS#8, and the JSSE rejects it, forcing a redirect to the OpenSSL prompt for passphrase input || WORKAROUND: convert the key to the traditional format PKCS#1

openssl rsa -in xpand-rsa-key.pem -out xpand-rsa-key.pem

#launch the docker container

docker-compose up --force-recreate

