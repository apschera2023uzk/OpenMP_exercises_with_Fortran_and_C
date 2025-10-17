#!/bin/bash

export OMP_NUM_THREADS=4
gfortran -fopenmp test_open_mp.f90 -o Fortran_open_mp_test
./Fortran_open_mp_test

