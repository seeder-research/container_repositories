#!/bin/bash
export PATH_ORIG=$PATH
export CONDA_DIR_ORIG=/opt/conda-nupic
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
cd /opt && \
${CONDA_DIR}/bin/pip install --upgrade pip && \
git clone https://github.com/numenta/nupic.torch.git && \
cd /opt/nupic.torch && \
${CONDA_DIR}/bin/python \
  setup.py \
  install && \
$CONDA_DIR/bin/conda clean -yt
