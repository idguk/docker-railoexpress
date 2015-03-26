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
RUN mv railojars/*.jar /var/railo/lib/ext/railo-server/context/lib
ENTRYPOINT ["/var/railo/start"]
#What is difference between entry point and cmd? CMD can be overriden on image creation and can be executable and arguments ENTRYPOINT cant be overriden but cant take args but args at end of run command are passed to entry point process 
#CMD ["/var/railo/start"]
#expose jetty port
EXPOSE 8888
