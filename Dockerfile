FROM jupyter/scipy-notebook:ubuntu-20.04

# install the notebook package etc.
RUN pip install --no-cache --upgrade pip \
    && pip install --no-cache datalad==0.15.4
    
ARG NB_USER=jovyan
ARG NB_UID=1000

RUN rm -rf ${HOME}/work

# prepare datalad procedure dir
RUN mkdir -p ${HOME}/.config/datalad/procedures

WORKDIR ${HOME}
COPY . ${HOME}

USER root
RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}

# Specify the default command to run
CMD ["jupyter", "notebook", "--ip", "0.0.0.0"]
