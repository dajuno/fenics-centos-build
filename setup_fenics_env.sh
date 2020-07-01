#!/bin/bash
source env_build.sh

echo "
# adapted for HFI work station
module load mpi/openmpi-x86_64

source ${PREFIX}/venv/bin/activate" >> ${PREFIX}/share/dolfin/dolfin.conf

echo "
Load FEniCS ${TAG} environment with 
    source ${PREFIX}/share/dolfin/dolfin.conf"
