# 1) choose base container
# generally use the most recent tag

# data science notebook
# https://hub.docker.com/repository/docker/ucsdets/datascience-notebook/tags
ARG BASE_CONTAINER=remenberl/autophrase
# scipy/machine learning (tensorflow)
# https://hub.docker.com/repository/docker/ucsdets/scipy-ml-notebook/tags
# ARG BASE_CONTAINER=ucsdets/scipy-ml-notebook:2020.2-stable

FROM $BASE_CONTAINER

#ARG BASE_CONTAINER_2=ucsdets/datascience-notebook:2020.2-stable

FROM ucsdets/datascience-notebook:2020.2-stable

#FROM ucsdets/datascience-notebook:2020.2-stable

#FROM $LOL

LABEL maintainer="Tiange Wan<t2wan@ucsd.edu>"

# 2) change to root to install packages
USER root
RUN apt-get update -y
RUN apt-get install -y htop gcc openjdk-8-jdk ant


# 3) install packages
RUN pip install --no-cache-dir requests


# 4) change back to notebook user
COPY /run_jupyter.sh /
RUN chmod 755 /run_jupyter.sh
USER $NB_UID
