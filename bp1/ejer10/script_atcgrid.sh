#!/bin/bash
#Todos los scripts que se hagan para atcgrid deben incluir lo siguiente:
#Se asigna al trabajo el nombre SumaVectoresC_vlocales
#PBS -N SumaVectoresC_vlocales
#Se asigna al trabajo la cola ac
#PBS -q ac   
#Se imprime información del trabajo usando variables de entorno de PBS
echo "Id. usuario del trabajo: $PBS_O_LOGNAME"
echo "Id. del trabajo: $PBS_JOBID"
echo "Nombre  del trabajo especificado por usuario: $PBS_JOBNAME"
echo "Nodo que ejecuta qsub: $PBS_O_HOST"
echo "Directorio en el que se ha ejecutado qsub: $PBS_O_WORKDIR"
echo "Cola: $PBS_QUEUE"
echo "Nodos asignados al trabajo:" 
cat $PBS_NODEFILE
# FIN del trozo que deben incluir todos los scripts

#para N potencia de 2 desde 2^16 a 2^26
echo "Tiempos secuencial\n"

for ((N=16384;N<67108865;N=N*2))
do 
	~/bp1/ejer10/secuencial-solo_tiempos $N
done 

echo "Tiempos for\n"

for ((N=16384;N<67108865;N=N*2))
do 
	~/bp1/ejer10/for-solo_tiempos $N
done 

echo "Tiempos sections\n"

for ((N=16384;N<67108865;N=N*2))
do 
	~/bp1/ejer10/sections-solo_tiempos $N
done 
