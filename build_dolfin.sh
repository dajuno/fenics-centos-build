#!/bin/bash
set -e

source env_build.sh

export PETSC_DIR=${PREFIX}
export SLEPC_DIR=${PREFIX}

echo "Downloading and building dolfin ${FENICS_VERSION}"

source $VENV/bin/activate

cd $BUILD_DIR && \
    git clone https://bitbucket.org/fenics-project/dolfin.git && \
    cd dolfin && \
    git checkout ${FENICS_VERSION} && \
    mkdir -p build && \
    cd build && \
    cmake .. \
        -DCMAKE_INSTALL_PREFIX=${PREFIX} \
        -DCMAKE_BUILD_TYPE="Release" \
    2>&1 | tee cmake.log && \
    make -j ${BUILD_THREADS} &&  make install && \
    cd $BUILD_DIR/dolfin/python && \
    DOLFIN_DIR=${PREFIX} pip3 -v install .


if [ "$continue_on_key" = true ]; then
    echo "Press any key to continue..."
    read -n 1
fi
