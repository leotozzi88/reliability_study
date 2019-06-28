#!/bin/bash
#
#SBATCH --job-name=gmet
#
#SBATCH --ntasks=1
#SBATCH --mem=48GB
#SBATCH --mail-user=ltozzi@stanford.edu
#SBATCH --mail-type=ALL
#SBATCH --time=120:00:00
#SBATCH --qos=long 

export atlas=$1
export threshold=$2
export connmatsfolder=$3
export outputfolder=$4

ml matlab
matlab -nodisplay -nosplash -nodesktop -r "run('/home/users/ltozzi/compute_gmet_sherlock_matlab.m')"
