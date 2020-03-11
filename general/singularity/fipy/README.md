README to build fipy container
1) Build container from ubuntu/18/singularity/cuda_base (cuda 10.0 and below)
2) Update container from #1 using ubuntu/18/singularity/prep/prep.def
3) Update container from #2 using general/singularity/pbspro/pbspro.def
4) Update container from #3 using general/singularity/openmpi/ompi3_1_5.def
5) Update container from #4 using ubuntu/18/singularity/intel/prep/prep_mkl.def
6) Update container from #5 using ubuntu/18/singularity/intel/mkl/mkl.def
7) Update container from #6 using general/singularity/hdf5/hdf5.def
8) Update container from #7 using general/singularity/pnetcdf/pnetcdf.def
9) Update container from #8 using general/singularity/netcdf/netcdf.def
10) Update container from #9 using general/singularity/metis/metis.def
11) Update container from #10 using general/singularity/conda/minicondaX.def
12) Update container from #11 using general/singularity/trilinos/prep_condaX.def
13) Update container from #12 using general/singularity/boost/boost_1_68_minicondaX.def
14) Update container from #13 using general/singularity/parmetis/parmetis.def
15) Update container from #14 using general/singularity/suitesparse/suitesparse.def
16) Update container from #15 using general/singularity/glpk/glpk.def
17) Update container from #16 using general/singularity/petsc/petsc.def
18) Update container from #17 using general/singularity/petsc4py/petsc4py.def
19) Update container from #18 using general/singularity/trilinos/build_fipy_trilinos.def
20) Update container from #19 using general/singularity/fltk/fltk.def
21) Update container from #20 using general/singularity/freetype/freetype.def
22) Update container from #21 using general/singularity/occt/occt.def
23) Update container from #22 using general/singularity/gmsh/gmsh.def
24) Update container from #23 using general/singularity/amgx/amgx.def
25) Update container from #24 using general/singularity/pyamgx/pyamgx.def
26) Update container from #25 using general/singularity/fipy/fipy.def
27) Update container from #26 using general/singularity/paraview/conda.def
