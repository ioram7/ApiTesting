FROM jenkins:latest

USER root
RUN apt-get update

RUN mkdir /ApiTesting
WORKDIR /ApiTesting
RUN pwd
RUN ls -al
RUN echo "==> Install prerequisite stuff..."
RUN apt-get update
RUN apt-get install -y python3
RUN apt-get install -y python3-pip
RUN apt-get install zip            
        

 



