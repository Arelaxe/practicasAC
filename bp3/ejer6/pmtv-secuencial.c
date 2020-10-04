#include <stdio.h>
#include <stdlib.h>
#include <omp.h>
#include <time.h>

int main(int argc, char ** argv){
    if (argc != 2){
        printf("Faltan las dimensiones de la matriz y vector\n");
        exit(1);
    }

    int i, j, contador, N = atoi(argv[1]);
    double **m, *v, *resultado, t_inicio, t_fin;

    m = (double **)malloc(N*sizeof(double *));

    for(i=0; i<N; i++){
        m[i] = (double*)malloc(N*sizeof(double));
    }

    resultado = (double *)malloc(N*sizeof(double));

    v = (double*)malloc(N*sizeof(double));

    contador = 1;

    // Matriz triangular inferior

    for(i=0; i<N; i++){
        for(j=0; j<N; j++){
            m[i][j] = contador;
            contador++;
        }
    }

    for(i=0; i<N; i++){
        for(j=i+1; j<N; j++){
            m[i][j] = 0;
        }
    }
    
    contador = 1;

    for(i=0; i<N; i++){
        v[i] = contador;
        contador++;
    }

    for(i=0; i<N; i++){
        resultado[i] = 0;
    }

    t_inicio = omp_get_wtime();

    for(i=0; i<N; i++){
        for(j=0; j<i+1; j++){
            resultado[i] += m[i][j]*v[j];
        }
    }

    t_fin = omp_get_wtime();

    double tiempo = t_fin - t_inicio;
    
    printf("resultado[0]=%f",resultado[0]);
    printf("\nresultado[N-1]=%f\n",resultado[N-1]);

    printf("Tiempo: %f\n", tiempo);

    free(v);

    for(i=0; i<N; i++){
        free(m[i]);
    }

    free(m);

    free(resultado);
    

    return (0);
}