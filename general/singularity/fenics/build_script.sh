#!/bin/bash
. /etc/profile.d/modules.sh
module load singularity
export BASE=${PWD}
export CON_UBUNTU_SRC=${BASE}/ubuntu/18/singularity
export CON_GEN_SRC=${BASE}/general/singularity
export SINGULARITY_CACHEDIR=/var/nvme_tmp/singularity/cachedir
export SINGULARITY_TMPDIR=/var/nvme_tmp/singularity/tmpdir
git clone https://github.com/seeder-research/container_recipes
cp -a ${CON_UBUNTU_SRC}/cuda_base ./ && \
cp -a ${CON_UBUNTU_SRC}/prep ./ && \
cd cuda_base && \
singularity build ../prep/pre.sif cuda10.2_base.def && \
cd ../prep && \
rm -rf ../cuda_base && \
cp -a ${CON_GEN_SRC}/pbspro ../ && \
singularity build ../pbspro/pre.sif prep.def && \
cd ../pbspro && \
rm -rf ../prep && \
cp -a ${CON_GEN_SRC}/openmpi ../ && \
singularity build ../openmpi/pre.sif pbspro.def && \
cd ../openmpi && \
rm -rf ../pbspro && \
cp -a ${CON_UBUNTU_SRC}/intel ../ && \
singularity build ../intel/prep/pre.sif ompi4_0_3.def && \
cd ../intel/prep && \
rm -rf ../../openmpi && \
singularity build ../mkl/pre.sif prep_mkl.def && \
cp -a ${CON_GEN_SRC}/hdf5 ../../. && \
cd ../mkl && \
rm -rf ../prep && \
singularity build ../../hdf5/pre.sif mkl.def && \
cd ../../hdf5 && \
rm -rf ../intel && \
cp -a ${CON_GEN_SRC}/pnetcdf ../ && \
singularity build ../pnetcdf/pre.sif hdf5-1_10_6.def && \
cd ../pnetcdf && \
rm -rf ../hdf5 && \
cp -a ${CON_GEN_SRC}/netcdf ../ && \
singularity build ../netcdf/pre.sif pnetcdf.def && \
cd ../netcdf && \
rm -rf ../pnetcdf && \
cp -a ${CON_GEN_SRC}/metis ../ && \
singularity build ../metis/pre.sif netcdf.def && \
cd ../metis && \
rm -rf ../netcdf && \
cp -a ${CON_GEN_SRC}/conda ../ && \
singularity build ../conda/pre.sif metis.def && \
cd ../conda && \
rm -rf ../metis && \
cp -a ${CON_GEN_SRC}/trilinos ../ && \
singularity build ../trilinos/pre.sif miniconda3.def && \
cd ../trilinos && \
rm -rf ../conda && \
cp -a ${CON_GEN_SRC}/boost ../ && \
singularity build ../boost/pre.sif prep_conda3.def && \
cd ../boost && \
rm -rf ../trilinos && \
cp -a ${CON_GEN_SRC}/parmetis ../ && \
singularity build ../parmetis/pre.sif boost_1_68_miniconda3.def && \
cd ../parmetis && \
rm -rf ../boost && \
cp -a ${CON_GEN_SRC}/suitesparse ../ && \
singularity build ../suitesparse/pre.sif parmetis.def && \
cd ../suitesparse && \
rm -rf ../parmetis && \
cp -a ${CON_GEN_SRC}/glpk ../ && \
singularity build ../glpk/pre.sif suitesparse.def && \
cd ../glpk && \
rm -rf ../suitesparse && \
cp -a ${CON_GEN_SRC}/bison ../ && \
singularity build ../bison/pre.sif glpk.def && \
cd ../bison && \
rm -rf ../glpk && \
cp -a ${CON_GEN_SRC}/flex ../ && \
singularity build ../flex/pre.sif bison.def && \
cd ../flex && \
rm -rf ../bison && \
cp -a ${CON_GEN_SRC}/scotch ../ && \
singularity build ../scotch/pre.sif flex.def && \
cd ../scotch && \
rm -rf ../flex && \
cp -a ${CON_GEN_SRC}/hypre ../ && \
singularity build ../hypre/pre.sif scotch.def && \
cd ../hypre && \
rm -rf ../scotch && \
cp -a ${CON_GEN_SRC}/mumps ../ && \
singularity build ../mumps/pre.sif hypre.def && \
cd ../mumps && \
rm -rf ../hypre && \
cp -a ${CON_GEN_SRC}/combblas ../ && \
singularity build ../combblas/pre.sif mumps.def && \
cd ../combblas && \
rm -rf ../mumps && \
cp -a ${CON_GEN_SRC}/superlu ../ && \
singularity build ../superlu/pre.sif combblas.def && \
cd ../superlu && \
rm -rf ../combblas && \
cp -a ${CON_GEN_SRC}/petsc ../ && \
singularity build ../petsc/pre.sif superlu_dist.def && \
cd ../petsc && \
rm -rf ../superlu && \
cp -a ${CON_GEN_SRC}/petsc4py ../ && \
singularity build ../petsc4py/pre.sif petsc.def && \
cd ../petsc4py && \
rm -rf ../petsc && \
cp -a ${CON_GEN_SRC}/slepc ../ && \
singularity build ../slepc/pre.sif petsc4py.def && \
cd ../slepc && \
rm -rf ../petsc4py && \
cp -a ${CON_GEN_SRC}/slepc4py ../ && \
singularity build ../slepc4py/pre.sif slepc.def && \
cd ../slepc4py && \
rm -rf ../slepc && \
cp -a ${CON_GEN_SRC}/sundials ../ && \
singularity build ../sundials/pre.sif slepc4py.def && \
cd ../sundials && \
rm -rf ../slepc4py && \
cp -a ${CON_GEN_SRC}/eigen ../ && \
singularity build ../eigen/pre.sif sundials.def && \
cd ../eigen && \
rm -rf ../sundials && \
cp -a ${CON_GEN_SRC}/fltk ../ && \
singularity build ../fltk/pre.sif eigen.def && \
cd ../fltk && \
rm -rf ../eigen && \
cp -a ${CON_GEN_SRC}/freetype ../ && \
singularity build ../freetype/pre.sif fltk.def && \
cd ../freetype && \
rm -rf ../fltk && \
cp -a ${CON_GEN_SRC}/occt ../ && \
singularity build ../occt/pre.sif freetype.def && \
cd ../occt && \
rm -rf ../freetype && \
cp -a ${CON_GEN_SRC}/gmsh ../ && \
singularity build ../gmsh/pre.sif occt.def && \
cd ../gmsh && \
rm -rf ../occt && \
cp -a ${CON_GEN_SRC}/pybind11 ../ && \
singularity build ../pybind11/pre.sif gmsh.def && \
cd ../pybind11 && \
rm -rf ../gmsh && \
cp -a ${CON_GEN_SRC}/fenics ../ && \
singularity build ../fenics/pre.sif pybind11.def && \
cd ../fenics && \
rm -rf ../pybind11 && \
singularity build ../fenics_v1_4.sif fenics.def && \
cd ../ && \
rm -rf ./fenics
