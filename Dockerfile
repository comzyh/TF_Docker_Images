FROM nvidia/cuda:8.0-cudnn6-devel-ubuntu16.04

LABEL maintainer "comzyh <comzyh@gmail.com>"

RUN apt-get update && apt-get install -y apt-transport-https

RUN echo "deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial main restricted universe multiverse" > /etc/apt/sources.list && \
    echo "deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-updates main restricted universe multiverse" >> /etc/apt/sources.list && \
    echo "deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-backports main restricted universe multiverse" >> /etc/apt/sources.list && \
    echo "deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-security main restricted universe multiverse" >> /etc/apt/sources.list

RUN apt-get update
RUN apt-get install -y wget python3.5 python3-pip locales
RUN locale-gen en_US.UTF-8

ADD tensorflow*.whl /tmp/
RUN python3.5 -m pip  install --upgrade pip && python3.5 -m pip install --ignore-installed -i https://pypi.tuna.tsinghua.edu.cn/simple /tmp/tensorflow*.whl

