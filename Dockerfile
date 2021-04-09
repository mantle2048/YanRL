FROM pytorch/pytorch:1.6.0-cuda10.1-cudnn7-devel

LABEL maintainer="Ma Yan <mayan20091@gmail.com>"


# Create a working directory
RUN mkdir /YanRL
WORKDIR /YanRL

# Create a non-root user and switch to it
RUN adduser --disabled-password --gecos '' --shell /bin/bash user \
 && chown -R user:user /workspace
RUN echo "user ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/90-user
USER user


RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       apt-utils \
       build-essential \
       curl \
       xvfb \
       ffmpeg \
       xorg-dev \
       libsdl2-dev \
       swig \
       cmake \
       python-opengl

# Upgrade pip3
RUN pip3 install --upgrade pip

# Move the requirements file into the image
COPY requirements.txt /tmp/


RUN rm /tmp/requirements.txt
