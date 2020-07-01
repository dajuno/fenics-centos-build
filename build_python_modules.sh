#!/bin/bash
source env_build.sh

export PETSC_DIR=${PREFIX}
export SLEPC_DIR=${PREFIX}

# MPI4PY_VERSION=3.0.3
PETSC4PY_VERSION=3.13.0 

source ${VENV}/bin/activate

pip3 install -I --no-cache-dir https://bitbucket.org/petsc/petsc4py/downloads/petsc4py-${PETSC4PY_VERSION}.tar.gz && \
pip3 install -I ruamel.yaml gitpython ipython mpi4py
# pip3 install -I --no-cache-dir https://bitbucket.org/slepc/slepc4py/downloads/slepc4py-${SLEPC4PY_VERSION}.tar.gz && \

if [ "$continue_on_key" = true ]; then
    echo "Press any key to continue..."
    read -n 1
fi
