#!/bin/sh
#SBATCH -J ImmunoSEIRS               # Job name
#SBATCH -o saved_data/ImmunoSEIRS'$1'_'$RUN_NAME_ADD'_%j.out                # Name of stdout output file (%j expands to jobId)
#SBATCH -p nvdimm
#SBATCH -N 2                         # Total number of nodes requested
#SBATCH -n 32                          # Total number of mpi tasks requested
#SBATCH -t 09:00:00                   # Run time (hh:mm:ss)
#SBATCH -A A-ib1
#SBATCH --qos=vippj_p3000

module load intel/19.0.5
module load python3/3.7.0


module load launcher

export OMP_NUM_THREADS=12

export LAUNCHER_WORKDIR=/work2/08090/abouchni/frontera/seir-austin/seir_regression/ImmunoSEIRS/BA45
export LAUNCHER_JOB_FILE=myprogram
# module load Rstats # module R doesn't work well
${LAUNCHER_DIR}/paramrun
