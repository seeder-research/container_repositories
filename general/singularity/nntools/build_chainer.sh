#!/bin/bash
. /etc/profile
export MODULEPATH=/usr/local/modulefiles/dev
module load openmpi
export PATH_ORIG=$PATH
export CONDA_DIR_ORIG=/opt/conda-chainer
export CONDA_DIR=$CONDA_DIR_ORIG
export PATH=$CONDA_DIR_ORIG/bin:$PATH
export LANGUAGE=$LANG
export LC_ALL=C
export ONNX_ML=1
export CC=mpicc
export CXX=mpicxx
export FC=mpifort
export OMPI_CC=gcc
export OMPI_CXX=g++
export OMPI_FC=gfortran
cd /opt
if [ ! -e /opt/Miniconda2-latest-Linux-x86_64.sh ]; then
    wget --quiet --no-check-certificate https://repo.anaconda.com/miniconda/Miniconda2-latest-Linux-x86_64.sh
fi
/bin/bash /opt/Miniconda2-latest-Linux-x86_64.sh -f -b -p $CONDA_DIR && \
$CONDA_DIR/bin/conda config \
  --append channels \
  conda-forge && \
$CONDA_DIR/bin/conda \
  install -y \
  python=2.7.16 && \
$CONDA_DIR/bin/pip install -U setuptools pip && \
$CONDA_DIR/bin/pip install mpi4py && \
$CONDA_DIR/bin/pip install cupy-cuda102 && \
$CONDA_DIR/bin/conda install -y \
  ipython \
  jupyter \
  jupyterlab \
  numpy \
  protobuf && \
$CONDA_DIR/bin/pip install chainer && \
$CONDA_DIR/bin/pip install onnx && \
$CONDA_DIR/bin/conda clean -yt
