#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <omp.h>

void multiplicacion (double **m1,double **m2,double **resultado,int N){
	for (int i=0;i<N;i++){   
        for (int j=0;j<N;j++){ 
            double res0=0,res1=0,res2=0,res3=0;
            for (int k=0;k<N;k+=4){
                res0+=resultado[i][j]+m1[i][k]*m2[k][j];
                res1+=resultado[i][j]+m1[i][k+1]*m2[k+1][j];
                res2+=resultado[i][j]+m1[i][k+2]*m2[k+2][j];
                res3+=resultado[i][j]+m1[i][k+3]*m2[k+3][j];
            }
            resultado[i][j]=res0+res1+res2+res3;
        }
    }
}

int main(int argc, char ** argv){
    if (argc != 2){
        printf("Faltan las dimensiones de la matriz y vector\n");
        exit(1);
    }

    int i, j, k, contador, N = atoi(argv[1]);
    double **m1, **m2, **resultado, t_inicio, t_fin;

    m1 = (double **)malloc(N*sizeof(double *));

    for(i=0; i<N; i++){
        m1[i] = (double*)malloc(N*sizeof(double));
    }

    resultado = (double **)malloc(N*sizeof(double));

    for(i=0; i<N; i++){
        resultado[i] = (double*)malloc(N*sizeof(double));
    }

    m2 = (double **)malloc(N*sizeof(double *));

    for(i=0; i<N; i++){
        m2[i] = (double*)malloc(N*sizeof(double));
    }

    contador = 1;


    for(i=0; i<N; i++){
        for(j=0; j<N; j++){
            m1[i][j] = contador;
            contador++;
        }
    }

    contador = 1;

    for(i=0; i<N; i++){
        for(j=0; j<N; j++){
            m2[i][j] = contador;
            contador++;
        }
    }

    for(i=0; i<N; i++){
        for(j=0; j<N; j++){
            resultado[i][j] = 0;
        }
    }

    t_inicio = omp_get_wtime();

	multiplicacion(m1,m2,resultado,N);
     
    t_fin = omp_get_wtime();

    double tiempo = t_fin - t_inicio;
    
    printf("resultado[0][0]=%f",resultado[0][0]);
    printf("\nresultado[N-1][N-1]=%f\n",resultado[N-1][N-1]);

    printf("Tiempo: %f\n", tiempo);

    for(i=0; i<N; i++){
        free(m1[i]);
    }

    free(m1);

    for(i=0; i<N; i++){
        free(m2[i]);
    }

    free(m2);

    for(i=0; i<N; i++){
        free(resultado[i]);
    }

    free(resultado);
    

    return (0);
}
