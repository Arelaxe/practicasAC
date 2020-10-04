#!/bin/bash
export OMP_DYNAMIC=FALSE;

for ((i=1;i<=4;i=i+1))
do
    echo "tiempos $i hebras\n" >>tiempos.txt
    export OMP_NUM_THREADS=$i;
    
    echo "Tamaño 5000\n" >>tiempos.txt

	./pmv-OpenMP-a 5000 >> tiempos.txt
	
	./pmv-OpenMP-b 5000 >> tiempos.txt
	
	./pmv-OpenMP-reduction 5000 >> tiempos.txt
	
	echo "Tamaño 20000\n" >>tiempos.txt
	
	./pmv-OpenMP-a 20000 >> tiempos.txt
	
	./pmv-OpenMP-b 20000 >> tiempos.txt
	
	./pmv-OpenMP-reduction 20000 >> tiempos.txt

done
