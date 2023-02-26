FROM nvidia/cuda:11.7.1-cudnn8-devel-ubuntu20.04

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y tzdata
ENV TZ Asia/Tokyo

WORKDIR /work/elicit

RUN apt-get update \
    && apt-get install --yes --no-install-recommends git libgl1-mesa-dev libopencv-dev python3-dev python3-pip \
    && rm --recursive --force /var/lib/apt/lists/*

COPY requirements.txt .

RUN pip3 install torch==1.13.1 torchvision==0.13.0 \
    && pip3 install -r requirements.txt
