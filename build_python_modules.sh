#!/bin/bash
set -e
source env_build.sh

export PETSC_DIR=${PREFIX}
export SLEPC_DIR=${PREFIX}

source ${VENV}/bin/activate

pip3 install ipython mpi4py h5py
pip3 install -v petsc4py==${PETSC4PY_VERSION}
pip3 install -v slepc4py==${SLEPC4PY_VERSION}

if [ "$continue_on_key" = true ]; then
    echo "Press any key to continue..."
    read -n 1
fi
