#!/bin/bash
echo "Id. usuario del trabajo: $PBS_O_LOGNAME"
echo "Id. del trabajo: $PBS_JOBID"
echo "Nombre  del trabajo especificado por usuario: $PBS_JOBNAME"
echo "Nodo que ejecuta qsub: $PBS_O_HOST"
echo "Directorio en el que se ha ejecutado qsub: $PBS_O_WORKDIR"
echo "Cola: $PBS_QUEUE"
echo "Nodos asignados al trabajo:" 
cat $PBS_NODEFILE
export OMP_DYNAMIC=FALSE;

for ((i=1;i<=12;i=i+1))
do
    echo "tiempos $i hebras" 
    export OMP_NUM_THREADS=$i;
    
    echo "Tamaño 100" 

	~/bp3/ejer10/pmm-OpenMP 100
	
	echo "Tamaño 1200"
	
	~/bp3/ejer10/pmm-OpenMP 1200

done
