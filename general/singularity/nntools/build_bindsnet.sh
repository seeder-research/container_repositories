#!/bin/bash
export PATH_ORIG=$PATH
export CONDA_DIR_ORIG=/opt/conda-bindsnet
export CONDA_DIR=$CONDA_DIR_ORIG
export PATH=$CONDA_DIR_ORIG/bin:$PATH
export LANGUAGE=$LANG
export LC_ALL=C
cd /opt
if [ ! -e /opt/Miniconda3-latest-Linux-x86_64.sh ]; then
    wget --quiet --no-check-certificate https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
fi
/bin/bash /opt/Miniconda3-latest-Linux-x86_64.sh -f -b -p $CONDA_DIR && \
$CONDA_DIR/bin/conda config \
  --append channels \
  conda-forge && \
$CONDA_DIR/bin/conda install -y \
  python=3.8.2 && \
$CONDA_DIR/bin/pip install --upgrade pip && \
$CONDA_DIR/bin/conda install -y \
  ipython \
  jupyter \
  jupyterlab \
  numpy \
  protobuf && \
$CONDA_DIR/bin/conda install -y \
  -c anaconda \
  cython \
  matplotlib \
  numpy \
  pandas \
  pre-commit \
  pytest \
  scipy \
  setuptools \
  sphinx_rtd_theme \
  torchvision \
  tqdm && \
$CONDA_DIR/bin/conda install -y \
  -c anaconda \
  foolbox \
  opencv-python \
  scikit_image \
  scikit_learn && \
$CONDA_DIR/bin/conda install -y \
  -c anaconda \
  pytorch-gpu && \
$CONDA_DIR/bin/pip install tensorflow-gpu && \
$CONDA_DIR/bin/conda install -y \
  tensorboardX && \
$CONDA_DIR/bin/pip install pybullet && \
$CONDA_DIR/bin/pip install gym && \
$CONDA_DIR/bin/conda clean -yt
cd /opt && \
$CONDA_DIR/bin/pip install git+https://github.com/BindsNET/bindsnet.git
