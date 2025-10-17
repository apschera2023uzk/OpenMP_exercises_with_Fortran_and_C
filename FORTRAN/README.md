1. Include the OpenMP module in f.90:
USE OMP_LIB

2. Identify the code section to parallelize and add OpenMP directives.
For a simple parallel block:

    !$OMP PARALLEL
        ! Parallel code here, e.g.:
        PRINT *, "Hello from process: ", OMP_GET_THREAD_NUM()
    !$OMP END PARALLEL

3. For advanced control, you can use OpenMP clauses like PRIVATE, SHARED,
REDUCTION, and more.
 
4. Set Number of Threads:
    export OMP_NUM_THREADS=4

(For permanent configuration, add to your .bashrc or .bash_profile)

5. Compile the Program:
    gfortran -fopenmp your_code.f90 -o your_program
with intel fortran:
    ifort -qopenmp your_code.f90 -o your_program

6. Run Your Program
./your_program
