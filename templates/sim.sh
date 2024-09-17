#!/bin/bash

module load singularity

CONTAINER_LOCATION="/gpfs/scratch/nct_306/schism_arg.sif"
CONTAINER_ARGS="--bind /gpfs/scratch/nct_306/nct01095/BSideal:/rundir,/gpfs/scratch/nct_306/nct01095/BSideal/input:/input,/gpfs/scratch/nct_306/nct01095/BSideal/outputs:/output schism_arg.sif 4"

mpirun -np 8 singularity run \
  "${CONTAINER_LOCATION}" \
      ${CONTAINER_ARGS}

echo "OK!"
