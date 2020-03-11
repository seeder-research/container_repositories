#
#  This file is part of MUMPS 5.3.1, released
#  on Fri Apr 10 13:52:30 UTC 2020
#
# These settings for a PC under Debian/linux with standard packages :
# metis (parmetis), scotch (ptscotch), openmpi, gfortran

# packages installation: 
# apt-get install libmetis-dev libparmetis-dev libscotch-dev libptscotch-dev libatlas-base-dev openmpi-bin libopenmpi-dev liblapack-dev

# Begin orderings
LSCOTCHDIR = $(SCOTCH_ROOT)/lib
ISCOTCH   = -I$(SCOTCH_ROOT)/include

LSCOTCH   = -L$(LSCOTCHDIR) -lptesmumps -lptscotch -lptscotcherr
#LSCOTCH   = -L$(LSCOTCHDIR) -lesmumps -lscotch -lscotcherr

LPORDDIR = $(topdir)/PORD/lib/
IPORD    = -I$(topdir)/PORD/include/
LPORD    = -L$(LPORDDIR) -lpord

LMETISDIR = $(PARMETIS_ROOT)
IMETIS    = -I$(PARMETIC_ROOT)/include
#IMETIS    = -I/usr/include/metis

LMETIS    = -L$(LMETISDIR) -lparmetis -lmetis
#LMETIS    = -L$(LMETISDIR) -lmetis

# Corresponding variables reused later
#ORDERINGSF = -Dmetis -Dpord -Dparmetis -Dscotch -Dptscotch
ORDERINGSF = -Dmetis -Dpord -Dscotch
ORDERINGSC  = $(ORDERINGSF)

LORDERINGS = $(LMETIS) $(LPORD) $(LSCOTCH)
IORDERINGSF = $(ISCOTCH)
IORDERINGSC = $(IMETIS) $(IPORD) $(ISCOTCH)
# End orderings
################################################################################

PLAT    =
LIBEXT  = .a
OUTC    = -o 
OUTF    = -o 
RM = /bin/rm -f
CC = mpicc
FC = mpif90
FL = mpif90
AR = ar vr 
RANLIB = ranlib
LAPACK = -L$(MKLROOT)/lib/intel64 -lmkl_rt
SCALAP  = -L$(MKLROOT)/lib/intel64 -lmkl_scalapack_lp64.so -lmkl_blacs_openmpi_lp64 -lmkl_intel_lp64 -lmkl_gnu_thread -lmkl_core

INCPAR = # not needed with mpif90/mpicc:  -I/usr/include/openmpi

LIBPAR = $(SCALAP) $(LAPACK) # not needed with mpif90/mpicc: -lmpi_mpifh -lmpi

INCSEQ = -I$(topdir)/libseq
LIBSEQ  = $(LAPACK) -L$(topdir)/libseq -lmpiseq

LIBBLAS = $(LAPACK)
LIBOTHERS = -lpthread -ldl -lm

#Preprocessor defs for calling Fortran from C (-DAdd_ or -DAdd__ or -DUPPER)
CDEFS   = -DAdd_

#Begin Optimized options
OPTF    = -O -fopenmp -fPIC
OPTL    = -O -fopenmp -fPIC
OPTC    = -O -fopenmp -fPIC
#End Optimized options
 
INCS = $(INCPAR)
LIBS = $(LIBPAR)
LIBSEQNEEDED =
