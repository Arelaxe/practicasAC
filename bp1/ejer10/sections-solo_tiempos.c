#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include <omp.h>

int main(int argc, char **argv){
    if(argc!=2){
        printf("Número de argumentos incorrecto\nUSO: <%s> <componentes del vector>\n",argv[0]);
        exit(-1);
    }

    unsigned int N = atoi(argv[1]);
    double *v1, *v2, *v3;
    double t_inicio, t_fin;

    v1 = (double*) malloc(N*sizeof(double));
    v2 = (double*) malloc(N*sizeof(double));
    v3 = (double*) malloc(N*sizeof(double));
    if ((v1 == NULL) || (v2 == NULL) || (v2 == NULL)) {	
        printf("No hay suficiente espacio para los vectores \n");
        exit(-2);
    }

    // Inicializar vectores
    #pragma omp parallel
	{
		#pragma omp sections
        {
            #pragma omp section
            {
                for(int i=0; i<N/4; i++){ 
                    v1[i] = N*0.1+i*0.1; 
                    v2[i] = N*0.1-i*0.1;
                } 
            }

            #pragma omp section
            {
                for(int i=N/4; i<N/2; i++){
                    v1[i] = N*0.1+i*0.1; 
                    v2[i] = N*0.1-i*0.1;
                }
            }

            #pragma omp section
            {
                for(int i=N/2; i<((3*N)/4); i++){
                    v1[i] = N*0.1+i*0.1; 
                    v2[i] = N*0.1-i*0.1;
                }
            }

            #pragma omp section
            {
                for(int i=((3*N)/4); i<N; i++){
                    v1[i] = N*0.1+i*0.1; 
                    v2[i] = N*0.1-i*0.1;
                }
            }
            
        }
        
    }
    
    t_inicio = omp_get_wtime();

    #pragma omp parallel
    {
		#pragma omp sections
        {
            #pragma omp section
            {
                for(int i=0; i<N/4; i++){ 
                    v3[i] = v1[i] + v2[i];
                } 
            }

            #pragma omp section
            {
                for(int i=N/4; i<N/2; i++){
                    v3[i] = v1[i] + v2[i];
                }
            }

            #pragma omp section
            {
                for(int i=N/2; i<((3*N)/4); i++){
                    v3[i] = v1[i] + v2[i];
                }
            }

            #pragma omp section
            {
                for(int i=((3*N)/4); i<N; i++){
                    v3[i] = v1[i] + v2[i];
                }
            }
        }
    }
    
    t_fin = omp_get_wtime();


    double tiempo = t_fin - t_inicio;

     printf("%f\n",tiempo);
} 
