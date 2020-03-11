#!/bin/bash
export PATH_ORIG=$PATH
export CONDA_DIR_ORIG=/opt/conda-nengo
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
$CONDA_DIR/bin/pip install --upgrade pip && \
$CONDA_DIR/bin/conda install -y \
  ipython \
  jupyter \
  jupyterlab && \
$CONDA_DIR/bin/pip install \
  nengo \
  nengo-dl \
  nengo-extras \
  nengo-gui \
  nengo-loihi \
  nengo-ocl \
  nengo-spa && \
$CONDA_DIR/bin/conda clean -yt
