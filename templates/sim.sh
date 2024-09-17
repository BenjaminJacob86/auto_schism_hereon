#!/bin/bash

module load singularity

#CONTAINER_LOCATION="/gpfs/scratch/nct_306/schism_arg.sif"
#CONTAINER_ARGS="--bind /gpfs/scratch/nct_306/nct01095/BSideal:/rundir,/gpfs/scratch/nct_306/nct01095/BSideal/input:/input,/gpfs/scratch/nct_306/nct01095/BSideal/outputs:/output schism_arg.sif 4"
#CONTAINER_LOCATION="/gpfs/scratch/nct_306/schism_arg.sif"
#CONTAINER_ARGS_PRE="--bind /gpfs/scratch/nct_306/nct01095/BSideal:/rundir,/gpfs/scratch/nct_306/nct01095/BSideal/input:/input,/gpfs/scratch/nct_306/nct01095/BSideal/outputs:/output" # this is path bindings in our case
#:qCONTAINER_ARGS_POST="4"   #this is the number of scribes

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
 # "${CONTAINER_ARGS_PRE}"  \
 # "${CONTAINER_LOCATION}" \
 #     ${CONTAINER_ARGS_POST}
	  
# hard code test	  
#mpirun -np 8 singularity run --bind /gpfs/scratch/nct_306/nct01095/BSideal:/rundir,/gpfs/scratch/nct_306/nct01095/BSideal/input:/input,/gpfs/scratch/nct_306/nct01095/BSideal/outputs:/output schism_arg.sif 4

#alternative call

## Set container location and paths
#CONTAINER_LOCATION="/gpfs/scratch/nct_306/schism_arg.sif"
#CONTAINER_ARGS_PRE="--bind /gpfs/scratch/nct_306/nct01095/BSideal:/rundir,/gpfs/scratch/nct_306/nct01095/BSideal/input:/input,/gpfs/scratch/nct_306/nct01095/BSideal/outputs:/output"
#CONTAINER_ARGS_POST="/SCHISM/GBconfig/bin/pschism_PREC_EVAP_TVD-SB 4"
#
#
## Run the job
#mpirun -np 8 singularity -pwd /rundir exec ${CONTAINER_ARGS_PRE} ${CONTAINER_LOCATION} ${CONTAINER_ARGS_POST}	  
#
#echo "OK!"
#

# Set container location and paths
CONTAINER_LOCATION="/gpfs/scratch/nct_306/schism_arg.sif"
CONTAINER_ARGS_PRE="--bind /gpfs/scratch/nct_306/nct01095/BSideal:/rundir,/gpfs/scratch/nct_306/nct01095/BSideal/input:/input,/gpfs/scratch/nct_306/nct01095/BSideal/outputs:/output"
CONTAINER_ARGS_POST="/SCHISM/GBconfig/bin/pschism_PREC_EVAP_TVD-SB 4"


# Without the --pwd /rundir option, the container would execute in the default working directory set by Autosubmit, which is likely the experiment folder (e.g., a000, a001, etc.). Since your Singularity container expects to find certain files (like input files, namelists, etc.) in /rundir, it failed to locate them when running in the experiment folder.

# Workaround

# Run the job (add --pwd to ensure /rundir is set as the working directory)
mpirun -np 8 singularity exec --pwd /rundir ${CONTAINER_ARGS_PRE} ${CONTAINER_LOCATION} ${CONTAINER_ARGS_POST}