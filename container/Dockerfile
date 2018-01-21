FROM microsoft/cntk:2.3-cpu-python2.7

MAINTAINER Lorenzo Toscano <lorenzo.toscano@gmail.com>

RUN apt-get -y update && apt-get install -y --no-install-recommends python nginx

RUN wget https://bootstrap.pypa.io/get-pip.py && python get-pip.py

ENV PYTHONUNBUFFERED=TRUE 
ENV PYTHONDONTWRITEBYTECODE=TRUE

ENV LD_LIBRARY_PATH="/cntk/cntk/lib:/cntk/cntk/dependencies/lib:/root/openmpi/lib:" 
ENV PATH="/root/anaconda3/envs/cntk-py27/bin:/cntk/cntk/bin:/opt/program:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/root/openmpi/bin" 
ENV CNTK_VERSION="2.3" 
ENV CONDA_DEFAULT_ENV="/root/anaconda3/envs/cntk-py27" 
ENV CONDA_PATH_BACKUP="/cntk/cntk/bin:/opt/program:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/root/openmpi/bin"
ENV CONDA_PREFIX="/root/anaconda3/envs/cntk-py27"

RUN pip install 'requests[security]'
RUN pip install --upgrade pip
RUN pip install numpy scipy scikit-learn pandas flask gevent gunicorn keras

RUN mkdir /root/.keras
COPY keras.json /root/.keras/keras.json

# Set up the program in the image
COPY setup /opt/program

RUN chmod +x /opt/program/train
RUN chmod +x /opt/program/serve

WORKDIR /opt/program

