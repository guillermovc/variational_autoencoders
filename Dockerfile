FROM nvidia/cuda:11.4.2-devel-ubuntu18.04
FROM python:3.10.0-slim
# Install some basic utilities
RUN apt-get update && apt-get install -y \
    curl \
    ca-certificates \
    sudo \
    git \
    bzip2 \
    libx11-6 \
    vim \
    build-essential \
    screen \
 && rm -rf /var/lib/apt/lists/*
# Install necessary python packages you need
COPY requirements.txt /
RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install -r /requirements.txt
CMD ["/bin/bash"]