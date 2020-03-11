#!/bin/bash
export PATH_ORIG=$PATH
export CONDA_DIR_ORIG=/opt/conda-snntoolset
export CONDA_DIR=$CONDA_DIR_ORIG
export PATH=$CONDA_DIR_ORIG/bin:$PATH
export LANGUAGE=$LANG
export LC_ALL=C
export GENN_VER=4.2.0
export NEST_VER=2.20.0
cd /opt
if [ ! -e /opt/Miniconda3-latest-Linux-x86_64.sh ]; then
    wget --quiet --no-check-certificate https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
fi
/bin/bash /opt/Miniconda3-latest-Linux-x86_64.sh -f -b -p ${CONDA_DIR} && \
${CONDA_DIR}/bin/conda config \
  --append channels \
  conda-forge && \
${CONDA_DIR}/bin/conda install -y \
  python=3.7 && \
${CONDA_DIR}/bin/pip install --upgrade pip && \
${CONDA_DIR}/bin/conda install -y \
  ipython \
  jupyter \
  jupyterlab \
  mpmath \
  numpy \
  protobuf \
  pyparsing \
  pytorch \
  sympy && \
${CONDA_DIR}/bin/pip install brian2 && \
${CONDA_DIR}/bin/pip install brian2tools && \
${CONDA_DIR}/bin/pip install onnx && \
${CONDA_DIR}/bin/pip install snntoolbox && \
. /etc/profile.d/modules.sh && \
export MODULEPATH=/usr/local/modulefiles:/usr/local/modulefiles/dev && \
module load \
  openmpi
export LD_LIBRARY_PATH=/usr/local/cuda/lib64/stubs:$LD_LIBRARY_PATH
export LIBRARY_PATH=/usr/local/cuda/lib64/stubs:$LIBRARY_PATH
export LD_RUN_PATH=/usr/local/cuda/lib64/stubs:$LD_RUN_PATH
cp /usr/local/cuda/lib64/stubs/libnvidia-ml.so /usr/local/cuda/lib64/stubs/libnvidia-ml.so.1 && \
cd /opt && \
wget --no-check-certificate \
  https://github.com/genn-team/genn/archive/${GENN_VER}.tar.gz && \
tar xf /opt/${GENN_VER}.tar.gz && \
cd /opt/genn-${GENN_VER} && \
make PREFIX=/usr/local/genn/${GENN_VER} install && \
make clean && \
make DYNAMIC=1 LIBRARY_DIRECTORY=$(pwd)/pygenn/genn_wrapper/ && \
cd /opt/genn-${GENN_VER} && \
${CONDA_DIR}/bin/python \
  setup.py \
  install && \
rm -rf \
  /opt/${GENN_VER} \
  /opt/genn-${GENN_VER} && \
cd /usr/local && \
git clone https://github.com/neurosim/DNN_NeuroSim_V2.0.git \
  /usr/local/neurosim_dnn_2_0 && \
git clone https://github.com/neurosim/MLP_NeuroSim_V3.0.git \
  /usr/local/neurosim_mlp_3_0 && \
cd /usr/local/neurosim_mlp_3_0 && \
make all && \
cd /usr/local/neurosim_dnn_2_0/Training_pytorch/NeuroSIM && \
make all && \
cd /opt && \
wget --no-check-certificate \
  https://github.com/nest/nest-simulator/archive/v${NEST_VER}.tar.gz && \
tar xf /opt/v${NEST_VER}.tar.gz && \
mkdir /opt/nest-simulator-${NEST_VER}/builddir && \
cd /opt/nest-simulator-${NEST_VER}/builddir && \
cmake \
  -DCMAKE_INSTALL_PREFIX=/usr/local/nest-simulator/${NEST_VER} \
  -DCMAKE_BUILD_TYPE=Release \
  -Dwith-mpi=${MPI_ROOT} \
  -Dwith-python=OFF \
  -Dwith-boost=OFF \
  .. && \
make -j$(nproc) && \
make install && \
cd /opt && \
${CONDA_DIR}/bin/conda install -y \
  nest-simulator && \
${CONDA_DIR}/bin/pip install Brian2GeNN && \
${CONDA_DIR}/bin/conda clean -yt && \
rm -rf \
  /usr/local/cuda/lib64/stubs/libnvidia-ml.so.1 \
  /opt/nest-simulator-${NEST_VER} \
  /opt/v${NEST_VER}
if [ ! -d /usr/local/modulefiles/genn ]; then
    mkdir -p /usr/local/modulefiles/genn
fi
if [ -e /opt/modfile_genn ]; then
    sed -i "s/@pver@/${GENN_VER}/g" /opt/genn_mod && \
    mv /opt/genn_mod \
      /usr/local/modulefiles/genn/${GENN_VER}
fi
if [ ! -d /usr/local/modulefiles/nest ]; then
    mkdir -p /usr/local/modulefiles/nest
fi
if [ -e /opt/${NEST_VER}_nest ]; then
    sed -i "s/@pver@/${NEST_VER}/g" /opt/nest_mod && \
    mv /opt/nest_mod \
      /usr/local/modulefiles/nest/${NEST_VER}
fi
