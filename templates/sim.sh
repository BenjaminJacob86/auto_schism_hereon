#!/bin/bash

module load singularity

#CONTAINER_LOCATION="/gpfs/scratch/nct_306/schism_arg.sif"
#CONTAINER_ARGS="--bind /gpfs/scratch/nct_306/nct01095/BSideal:/rundir,/gpfs/scratch/nct_306/nct01095/BSideal/input:/input,/gpfs/scratch/nct_306/nct01095/BSideal/outputs:/output schism_arg.sif 4"
CONTAINER_LOCATION="/gpfs/scratch/nct_306/schism_arg.sif"
CONTAINER_ARGS_PRE="--bind /gpfs/scratch/nct_306/nct01095/BSideal:/rundir,/gpfs/scratch/nct_306/nct01095/BSideal/input:/input,/gpfs/scratch/nct_306/nct01095/BSideal/outputs:/output" # this is path bindings in our case
CONTAINER_ARGS_POST="4"   #this is the number of scribes

mpirun -np 8 singularity run \
  $"{CONTAINER_ARGS_PRE}"  \
  "${CONTAINER_LOCATION}" \
      ${CONTAINER_ARGS_POST}

echo "OK!"


