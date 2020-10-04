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
		double tmp0=0, tmp1=0, tmp2=0, tmp3=0;
		for(int i=0; i<5000;i+=4){
			tmp0+=2*s[i].a+ii;
			tmp1+=2*s[i+1].a+ii;
			tmp2+=2*s[i+2].a+ii;
			tmp3+=2*s[i+3].a+ii;
		}
		X1 = tmp0+tmp1+tmp2+tmp3;
		tmp0=0, tmp1=0, tmp2=0, tmp3=0;
		for(int i=0; i<5000;i+=4){
			tmp0+=3*s[i].b-ii;
			tmp1+=3*s[i+1].b-ii;
			tmp2+=3*s[i+2].b-ii;
			tmp3+=3*s[i+3].b-ii;
		}
		X2=tmp0+tmp1+tmp2+tmp3;

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
