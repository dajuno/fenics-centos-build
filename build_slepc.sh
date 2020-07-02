#!/bin/bash
set -e

source env_build.sh

echo "Downloading and building SLEPc ${SLEPC_VERSION}"

mkdir -p $BUILD_DIR/tar

cd ${BUILD_DIR} && \
   wget --quiet --read-timeout=10 -nc http://slepc.upv.es/download/distrib/slepc-${SLEPC_VERSION}.tar.gz -O tar/slepc-${SLEPC_VERSION}.tar.gz && \
   tar -xzf tar/slepc-${SLEPC_VERSION}.tar.gz && \
   cd slepc-${SLEPC_VERSION} && \
   ./configure --prefix=${PREFIX} && \
   make SLEPC_DIR=$PWD PETSC_DIR=${PREFIX} MAKE_NP=${BUILD_THREADS} && \
   make SLEPC_DIR=${BUILD_DIR}/slepc-${SLEPC_VERSION} PETSC_DIR=${PREFIX} install


if [ "$continue_on_key" = true ]; then
    echo "Press any key to continue..."
    read -n 1
fi


