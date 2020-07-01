#!/bin/bash

# exit on error
set -e

# FENICS version
# export FENICS_VERSION="2019.1.0.post0"
export FENICS_VERSION="master"

# TAG that specifies the name of the build directories and the virtualenv
DATE=`date +%F`
# DATE=2020-06-30
export TAG="${FENICS_VERSION}-${DATE}"

export BUILD_THREADS=4
export PREFIX=${HOME}/dev/fenics-${TAG}
export BUILD_DIR=${HOME}/dev/build/fenics-${TAG}
mkdir -p ${PREFIX}

export VENV=${PREFIX}/venv

# set this to true in order to wait after each module
export continue_on_key=false

echo "Installing FEniCS to ${PREFIX}"

./setup_virtualenv.sh  # if not, make sure virtualenv fenics-${tag} exists!!
./build_petsc.sh
./build_slepc.sh
./build_python_modules.sh
./build_fenics_pymodules.sh  # ffc fiat ufl uflacs instant
./build_dolfin.sh
./build_mshr.sh
./setup_fenics_env.sh

# run with $ ./build_all.sh |& tee -a build.log
