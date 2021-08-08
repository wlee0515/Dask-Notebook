FROM ubuntu:latest

RUN ["echo", "installing apps"]
RUN ["apt-get", "update"]
RUN ["apt-get", "install", "-y", "g++"]
RUN ["apt-get", "install", "-y", "python3"]
RUN ["apt-get", "install", "-y", "python3-pip"]

WORKDIR /code
COPY requirements.txt requirements.txt
RUN ["pip", "install", "-r", "requirements.txt"]

RUN ["useradd", "-m", "-G", "root", "myuser"]
USER myuser

WORKDIR /home/myuser/playground

