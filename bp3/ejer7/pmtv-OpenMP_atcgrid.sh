#!/bin/bash
echo "Id. usuario del trabajo: $PBS_O_LOGNAME"
echo "Id. del trabajo: $PBS_JOBID"
echo "Nombre  del trabajo especificado por usuario: $PBS_JOBNAME"
echo "Nodo que ejecuta qsub: $PBS_O_HOST"
echo "Directorio en el que se ha ejecutado qsub: $PBS_O_WORKDIR"
echo "Cola: $PBS_QUEUE"
echo "Nodos asignados al trabajo:" 
cat $PBS_NODEFILE
export OMP_NUM_THREADS=12;

export OMP_SCHEDULE="static";
~/bp3/ejer7/pmtv-OpenMP 15360

export OMP_SCHEDULE="static,1";
~/bp3/ejer7/pmtv-OpenMP 15360

export OMP_SCHEDULE="static,64";
~/bp3/ejer7/pmtv-OpenMP 15360

export OMP_SCHEDULE="dynamic";
~/bp3/ejer7/pmtv-OpenMP 15360

export OMP_SCHEDULE="dynamic,1";
~/bp3/ejer7/pmtv-OpenMP 15360

export OMP_SCHEDULE="dynamic,64";
~/bp3/ejer7/pmtv-OpenMP 15360

export OMP_SCHEDULE="guided";
~/bp3/ejer7/pmtv-OpenMP 15360

export OMP_SCHEDULE="guided,1";
~/bp3/ejer7/pmtv-OpenMP 15360

export OMP_SCHEDULE="guided,64";
~/bp3/ejer7/pmtv-OpenMP 15360
