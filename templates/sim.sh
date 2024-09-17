#!/bin/bash

module load singularity

#CONTAINER_LOCATION="/gpfs/scratch/nct_306/schism_arg.sif"
#CONTAINER_ARGS="--bind /gpfs/scratch/nct_306/nct01095/BSideal:/rundir,/gpfs/scratch/nct_306/nct01095/BSideal/input:/input,/gpfs/scratch/nct_306/nct01095/BSideal/outputs:/output schism_arg.sif 4"
CONTAINER_LOCATION="/gpfs/scratch/nct_306/schism_arg.sif"
CONTAINER_ARGS_PRE="--bind /gpfs/scratch/nct_306/nct01095/BSideal:/rundir,/gpfs/scratch/nct_306/nct01095/BSideal/input:/input,/gpfs/scratch/nct_306/nct01095/BSideal/outputs:/output" # this is path bindings in our case
CONTAINER_ARGS_POST="4"   #this is the number of scribes

#I get error message via auto submit:
#
#mpirun -np 8 singularity run \
#  "${CONTAINER_ARGS_PRE}"  \
#  "${CONTAINER_LOCATION}" \
#      ${CONTAINER_ARGS_POST}
#+ mpirun -np 8 singularity run '--bind /gpfs/scratch/nct_306/nct01095/BSideal:/rundir,/gpfs/scratch/nct_306/nct01095/BSideal/input:/input,/gpfs/scratch/nct_306/nct01095/BSideal/outputs:/output' /gpfs/scratch/nct_306/schism_arg.sif 4
#Error for command "run": unknown flag: --bind /gpfs/scratch/nct_306/nct01095/BSideal:/rundir,/gpfs/scratch/nct_306/nct01095/BSideal/input:/input,/gpfs/scratch/nct_306/nct01095/BSideal/outputs:/output
#

# therefore I try hard coded command

#mpirun -np 8 singularity run \
  "${CONTAINER_ARGS_PRE}"  \
  "${CONTAINER_LOCATION}" \
      ${CONTAINER_ARGS_POST}
	  
# hard code test	  
mpirun -np 8 singularity run --bind /gpfs/scratch/nct_306/nct01095/BSideal:/rundir,/gpfs/scratch/nct_306/nct01095/BSideal/input:/input,/gpfs/scratch/nct_306/nct01095/BSideal/outputs:/output schism_arg.sif 4
	  

echo "OK!"


