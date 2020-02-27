====DockerTomcat====

#Docker Image built from centos7 with apache tomcat running

docker build -t mdsdbc/tomcat-8 .

#ssh pem style keys without the need to use java key store
#used changeit(default) as pass, default fields on the rest of the certificate

openssl req -x509 -newkey rsa:4096 -keyout xpand-rsa-key.pem -out xpand-rsa-cert.pem -days 36500

#launch the docker container

docker-compose up --force-recreate

