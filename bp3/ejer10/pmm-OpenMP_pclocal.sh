#!/bin/bash
for ((i=1;i<=4;i=i+1))
do
    echo "tiempos $i hebras" 
    export OMP_NUM_THREADS=$i;
    
    echo "Tamaño 100" 

	./pmm-OpenMP 100
	
	echo "Tamaño 1200"
	
	./pmm-OpenMP 1200

done
