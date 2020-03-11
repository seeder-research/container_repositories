#!/bin/bash
. /etc/profile
export MODULEPATH=/usr/local/modulefiles/dev
module load openmpi
export PATH_ORIG=$PATH
export CONDA_DIR_ORIG=/opt/conda-mxnet
export CONDA_DIR=$CONDA_DIR_ORIG
export PATH=$CONDA_DIR_ORIG/bin:$PATH
export LANGUAGE=$LANG
export LC_ALL=C
export CC=mpicc
export CXX=mpicxx
export FC=mpifort
export OMPI_CC=gcc
export OMPI_CXX=gxx
export OMPI_FC=gfortran
export LD_LIBRARY_PATH=/usr/local/cuda/lib64/stubs:$LD_LIBRARY_PATH
export LIBRARY_PATH=/usr/local/cuda/lib64/stubs:$LIBRARY_PATH
export LD_RUN_PATH=/usr/local/cuda/lib64/stubs:$LD_RUN_PATH
cp /usr/local/cuda/lib64/stubs/libnvidia-ml.so /usr/local/cuda/lib64/stubs/libnvidia-ml.so.1 && \
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
$CONDA_DIR/bin/conda install -y \
  ipython \
  jupyter \
  jupyterlab \
  numpy \
  protobuf && \
$CONDA_DIR/bin/pip install mxnet-cu102mkl && \
$CONDA_DIR/bin/pip install onnx && \
rm -rf \
  /usr/local/cuda/lib64/stubs/libnvidia-ml.so.1 && \
$CONDA_DIR/bin/conda clean -yt
