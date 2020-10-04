#include <stdio.h>
#include <stdlib.h>
#include <omp.h>
#include <time.h>

void daxpy(double a, double *y, double *x){
	for (int i=1;i<=100000000;i++) y[i]= a*x[i] + y[i];
}

int main(){
	double a = 100, *y, *x, t_inicio, t_fin;

	y = (double*)malloc(100000000*sizeof(double));
	x = (double*)malloc(100000000*sizeof(double));

	for (int i=0; i<100000000; i++){
		y[i] = i;
		x[i] = i;
	}

	t_inicio = omp_get_wtime();

	daxpy(a,y,x);

	t_fin = omp_get_wtime();

	double tiempo = t_fin - t_inicio;

	printf("y[0]=%f",y[0]);
    printf("\ny[N-1]=%f\n",y[100000000-1]);

    printf("Tiempo: %f\n", tiempo);

	return (0);
}
