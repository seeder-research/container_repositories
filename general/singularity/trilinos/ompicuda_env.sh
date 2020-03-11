#!/bin/bash
#       SuperLU/5.2.1 SuperLU_MT/3.1 SuperLU_DIST/5.1.3 \
#	parmetis/4.0.3 \
#       yaml-cpp/0.6.2 libscotch/6.0.4 \
export TRILINOS_SRC=/apps/sources/Trilinos-git-12-14-1
export TRILINOS_BUILDDIR=/apps/sources/Trilinos-12-14/build_cuda
module load intel/mkl intel/iomp intel/tbb_gcc47 && \
. ${MKLROOT}/bin/mklvars.sh intel64 ilp64 && \
. ${MKLROOT}/../tbb/bin/tbbvars.sh intel64 ilp64 && \
module load cuda/10.0 \
        pbspro/19.1.1 openmpi/4.0.0 \
        SuiteSparse/5.4.0 boost/1.69 hdf5/1.10.5 \
        glpk/4.65 netcdf/4.6.1 pnetcdf/1.10.0
export MPICH_CXX="${TRILINOS_SRC}/packages/kokkos/config/nvcc_wrapper"
export OMPI_CXX="${TRILINOS_SRC}/packages/kokkos/config/nvcc_wrapper"
export NVCC_WRAPPER_DEFAULT_COMPILER="/usr/bin/g++-6"
export CUDA_LAUNCH_BLOCKING=1
export CC="mpicc"
export CXX="mpicxx"
export F77="mpifort"

