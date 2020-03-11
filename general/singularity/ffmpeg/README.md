README to build ffmpeg container
1) Build container using from ubuntu/20/singularity/cuda_base
2) Update container from #1 using ubuntu/20/singularity/prep/prep.def
3) Update container from #2 using general/singularity/pbspro/pbspro.def
4) Update container from #3 using general/singularity/openmpi/ompi2_1_6.def
5) Update container from #4 using ubuntu/20/singularity/intel/prep/prep_mkl.def
6) Update container from #5 using ubuntu/20/singularity/intel/mkl/mkl.def
7) Update container from #6 using general/singularity/conda/miniconda3.def
8) Update container from #7 using general/singularity/boost/boost_1_73.def
9) Update container from #8 using general/singularity/nasm/nasm.def
10) Update container from #9 using ubuntu/20/singularity/ffmpeg/prep.def
11) Update container from #10 using general/singularity/ffmpeg/ffmpeg.def
