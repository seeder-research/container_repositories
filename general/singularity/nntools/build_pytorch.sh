#!/bin/bash
export PATH_ORIG=$PATH
export CONDA_DIR_ORIG=/opt/conda-pytorch-py
export CONDA_DIR=$CONDA_DIR_ORIG
export PATH=$CONDA_DIR_ORIG/bin:$PATH
export LANGUAGE=$LANG
export LC_ALL=C
cd /opt
if [ ! -e /opt/Miniconda2-latest-Linux-x86_64.sh ]; then
    wget --quiet --no-check-certificate https://repo.anaconda.com/miniconda/Miniconda2-latest-Linux-x86_64.sh
fi
/bin/bash /opt/Miniconda2-latest-Linux-x86_64.sh -f -b -p ${CONDA_DIR}2 && \
${CONDA_DIR}2/bin/conda config \
  --append channels \
  conda-forge && \
${CONDA_DIR}2/bin/pip install --upgrade pip && \
${CONDA_DIR}2/bin/conda install -y \
  ipython \
  jupyter \
  jupyterlab \
  numpy \
  protobuf && \
${CONDA_DIR}2/bin/conda install -y \
  -c anaconda \
   pytorch-gpu && \
${CONDA_DIR}2/bin/pip install ANNarchy && \
${CONDA_DIR}2/bin/conda clean -yt
cd /opt
if [ ! -e /opt/Miniconda3-latest-Linux-x86_64.sh ]; then
    wget --quiet --no-check-certificate https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
fi
/bin/bash /opt/Miniconda3-latest-Linux-x86_64.sh -f -b -p ${CONDA_DIR}3 && \
${CONDA_DIR}3/bin/conda config \
  --append channels \
  conda-forge && \
${CONDA_DIR}3/bin/pip install --upgrade pip && \
${CONDA_DIR}3/bin/conda install -y \
  ipython \
  jupyter \
  jupyterlab \
  numpy \
  protobuf && \
${CONDA_DIR}3/bin/conda install -y \
  -c anaconda \
   pytorch-gpu && \
${CONDA_DIR}3/bin/pip install pysnn && \
${CONDA_DIR}3/bin/conda clean -yt
