#!/bin/bash
SRCDIR=/opt/Trilinos-trilinos-release-12-12-1
ARCHDIR=/usr/local/trilinos/${TRILINOSVER}
FLAGS="-O3 -fPIC -std=c++11"
cmake \
-G "Unix Makefiles" \
-DCMAKE_C_COMPILER=mpicc \
-DCMAKE_CXX_COMPILER=mpic++ \
-DCMAKE_Fortran_COMPILER=mpif77 \
-DCMAKE_CXX_FLAGS="$FLAGS" \
-DCMAKE_C_FLAGS="$FLAGS" \
-DCMAKE_Fortran_FLAGS="$FLAGS" \
-DCMAKE_INSTALL_PREFIX=$ARCHDIR \
-DCMAKE_MAKE_PROGRAM="make" \
-DTrilinos_ENABLE_NOX=ON \
  -DNOX_ENABLE_LOCA=ON \
-DTrilinos_ENABLE_EpetraExt=ON \
  -DEpetraExt_BUILD_BTF=ON \
  -DEpetraExt_BUILD_EXPERIMENTAL=ON \
  -DEpetraExt_BUILD_GRAPH_REORDERINGS=ON \
-DTrilinos_ENABLE_TrilinosCouplings=ON \
-DTrilinos_ENABLE_Ifpack=ON \
-DTrilinos_ENABLE_ShyLU=ON \
-DTrilinos_ENABLE_Isorropia=ON \
-DTrilinos_ENABLE_AztecOO=ON \
-DTrilinos_ENABLE_Belos=ON \
-DTrilinos_ENABLE_Teuchos=ON \
  -DTeuchos_ENABLE_COMPLEX=ON \
-DTrilinos_ENABLE_Amesos=ON \
  -DAmesos_ENABLE_KLU=ON \
-DTrilinos_ENABLE_Sacado=ON \
-DTrilinos_ENABLE_Kokkos=OFF \
-DTrilinos_ENABLE_Zoltan=ON \
-DTrilinos_ENABLE_ALL_OPTIONAL_PACKAGES=OFF \
-DTrilinos_ENABLE_CXX11=ON \
-DTPL_ENABLE_AMD=ON \
-DAMD_LIBRARY_DIRS="${SUITESPARSE_ROOT}/lib" \
-DTPL_AMD_INCLUDE_DIRS="${SUITESPARSE_ROOT}/include" \
-DTPL_ENABLE_BLAS=ON \
-DBLAS_LIBRARY_DIRS="${MKLROOT}/lib/intel64" \
-DBLAS_LIBRARY_NAMES="mkl_intel_lp64;mkl_gnu_thread;mkl_core" \
-DTPL_ENABLE_LAPACK=ON \
-DLAPACK_LIBRARY_DIRS="${MKLROOT}/lib/intel64" \
-DLAPACK_LIBRARY_NAMES="mkl_intel_lp64;mkl_gnu_thread;mkl_core" \
-DTPL_ENABLE_MPI=ON \
-DBUILD_SHARED_LIBS=ON \
-DTrilinos_ENABLE_EXPLICIT_INSTANTIATION=ON \
${SRCDIR} && \
make -j$(nproc) all && \
make install
