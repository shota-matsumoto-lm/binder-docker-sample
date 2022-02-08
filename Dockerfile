FROM jupyter/scipy-notebook:ubuntu-20.04

# # install the notebook package etc.
# RUN pip install --no-cache --upgrade pip \
#     && pip install --no-cache datalad==0.15.4

ARG NB_USER=jovyan
ARG NB_UID=1000

WORKDIR ${HOME}
COPY . ${HOME}

USER root
RUN chown -R ${NB_UID} ${HOME}

USER ${NB_USER}
