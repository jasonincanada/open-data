# build an ubuntu image with q installed, for running SQL queries on .csv files

FROM ubuntu:latest

# update ubuntu and install wget
RUN apt update
RUN apt install -y wget

WORKDIR /q
RUN wget https://github.com/harelba/q/releases/download/2.0.19/q-text-as-data_2.0.19-2_amd64.deb
RUN dpkg -i q-text-as-data_2.0.19-2_amd64.deb

WORKDIR /data

