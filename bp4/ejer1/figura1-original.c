#include <stdio.h>
#include <stdlib.h>
#include <omp.h>
#include <time.h>

struct {
	int a;
	int b;
}s[5000];

void multiplicacion (double *R){
	double X1, X2;

	for (int ii=0;ii<40000;ii++) {
		X1=0; X2=0; 
		for(int i=0; i<5000;i++) X1+=2*s[i].a+ii;
		for(int i=0; i<5000;i++) X2+=3*s[i].b-ii;

		if (X1<X2) R[ii]=X1; else R[ii]=X2;
	}
}

int main()
{
	int N=40000;
	double *R, t_inicio, t_fin;

	R = (double*)malloc(N*sizeof(double));

	for(int i=0; i<5000; i++){
		s[i].a = i;
		s[i].b = i;
	}

	t_inicio = omp_get_wtime();

	multiplicacion(R);

	t_fin = omp_get_wtime();

    double tiempo = t_fin - t_inicio;
	
	printf("R[0]=%f",R[0]);
    printf("\nR[N-1]=%f\n",R[N-1]);
	printf("Tiempo: %f\n", tiempo);

	return (0);
}
