#include <stdio.h>
#include <omp.h>

int main() {

    #pragma omp parallel
    {
        int id = omp_get_thread_num();
        int num_threads = omp_get_num_threads();
        printf("Hello from thread %d out of %d\n", id, num_threads);
    }

}
