FROM ubuntu
MAINTAINER adrian_black@idg.co.uk
RUN sudo apt-get update
RUN sudo apt-get install -qy curl wget  default-jdk git
RUN mkdir /tmp/railofiles /tmp/railofiles/railo
RUN wget  http://www.getrailo.org/railo/remote/download42/4.2.1.008/railix/linux/railo-express-4.2.1.008-nojre.tar.gz
RUN mv *.tar.gz /tmp/railofiles/railo.tar.gz
RUN tar zxpvf /tmp/railofiles/railo.tar.gz -C /tmp/railofiles/railo
RUN rm /tmp/railofiles/*.tar.gz
RUN mv /tmp/railofiles/railo/* /var/railo
RUN rm -rf /var/railo/webapps/ROOT/*
RUN rm -rf /tmp/railofiles
WORKDIR ["/tmp"]
RUN git clone https://github.com/idguk/railojars.git
RUN mkdir -p /var/railo/lib/ext/railo-server/context/lib
RUN mv railojars/*.jar /var/railo/lib/ext/railo-server/context/lib
ENTRYPOINT ["/var/railo/start"]
EXPOSE 8888

