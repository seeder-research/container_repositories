#!/bin/bash

export PATH_ORIG=$PATH
export CONDA_DIR_ORIG=/opt/conda-annarchy
export CONDA_DIR=$CONDA_DIR_ORIG
export PATH=$CONDA_DIR_ORIG/bin:$PATH_ORIG
export LANGUAGE=$LANG
export LC_ALL=C
cd /opt
if [ ! -e /opt/Miniconda2-latest-Linux-x86_64.sh ]; then
  wget --quiet --no-check-certificate https://repo.anaconda.com/miniconda/Miniconda2-latest-Linux-x86_64.sh
fi
/bin/bash /opt/Miniconda2-latest-Linux-x86_64.sh -f -b -p $CONDA_DIR && \
$CONDA_DIR/bin/conda config \
  --append channels \
  conda-forge && \
$CONDA_DIR/bin/conda install -y \
  wheel \
  scipy \
  sympy \
  numpy \
  cython \
  setuptools \
  matplotlib \
  lxml \
  protobuf \
  PyQtGraph && \
$CONDA_DIR/bin/pip install ANNarchy && \
$CONDA_DIR/bin/pip install onnx && \
$CONDA_DIR/bin/conda clean -yt
