
#include <stdio.h>
#include <stdlib.h>
#include <time.h>


void matmult(int n, double** A, double* B, double* C) {
	for(int i = 0; i < n; i++) {
		for (int j = 0; j < n; j++) {
		 C[j] = A[i][j] * B[j];
		}
	}
}



int main(int argc, char *argv[]) 
{
    char *argumento = argv[1];
    int n = atoi(argumento);
    char *processador = "2.5 GHz Intel Core i5 7th Generation Dual-Core";

    FILE *out_file = fopen("results.csv", "w");
    fprintf(out_file, "N,CPU,t(s)\n");

    for (int dim = 10; dim <=n; dim+=10000 ){
        clock_t start, end;
        double cpu_time_used;

	double* a[dim];
	double * b = malloc(dim*sizeof(double));
	double * c = malloc(dim*sizeof(double)); 
	
        for(int i = 0; i<dim; i++) {//builder
        	a[i] = (double*)malloc(dim*sizeof(double));
        }
	
        
        for (int i=0; i<dim; i++){ 
        	for(int j = 0; j < dim; j ++) {
		    a[i][j] = rand(); //rand()
        	}

        }
        
	for (int j=0; j<dim; j++){ 
        	b[j] = rand();

        }

        start = clock();
        matmult(dim, a, b, c);
        end = clock();
        cpu_time_used = ((double) (end-start)) / CLOCKS_PER_SEC;
        fprintf(out_file, "%d,%s,%f\n", dim, processador, cpu_time_used);
    
        free(b);
        free(c);
    
    }

    fclose(out_file);
    return 0;
}
