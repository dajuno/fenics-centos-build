#!/bin/bash
source env_build.sh

VERSION="3.13.2"

# export CXXFLAGS="${CXXFLAGS} -std=c++0x"

echo "Downloading and building PETSc ${VERSION}"

mkdir -p $BUILD_DIR/tar

# FROM https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=petsc-git
generic_flags="-fPIC -O3 -march=x86-64 -mtune=generic"
# generic_flags="-fPIC -fopenmp -O3 -march=amdfam10 -mtune=generic"

export COPTFLAGS="-O3"
export CXXOPTFLAGS="-O3"
export FOPTFLAGS="-O3"
export CPPFLAGS="$generic_flags"
export CFLAGS="$generic_flags"
export CXXFLAGS="$generic_flags"
export FFLAGS="$generic_flags"
export FCFLAGS="$generic_flags"
export F90FLAGS="$generic_flags"
export F77FLAGS="$generic_flags"

cd ${BUILD_DIR} && \
    wget --quiet --read-timeout=10 -nc -P tar/ http://ftp.mcs.anl.gov/pub/petsc/release-snapshots/petsc-lite-${VERSION}.tar.gz && \
    tar -xzf tar/petsc-lite-${VERSION}.tar.gz && \
    cd petsc-${VERSION} && \
    python2 ./configure \
            --COPTFLAGS="$COPTFLAGS" \
            --CXXOPTFLAGS="$CXXOPTFLAGS" \
            --CPPFLAGS="$CPPFLAGS" \
            --FOPTFLAGS="$FOPTFLAGS" \
            --CFLAGS="$CFLAGS" \
            --CXXFLAGS="$CXXFLAGS" \
            --FFLAGS="$FFLAGS" \
            --FCFLAGS="$FCFLAGS" \
            --F90FLAGS="$F90FLAGS" \
            --F77FLAGS="$F77FLAGS" \
            --with-fortran-bindings=no \
            --with-debugging=0 \
            --download-blacs \
            --download-hypre \
            --download-metis \
            --download-parmetis \
            --download-mumps \
            --download-ptscotch \
            --download-scalapack \
            --download-spai \
            --download-suitesparse \
            --download-superlu \
        --prefix=${PREFIX} && \
    make MAKE_NP=${BUILD_THREADS} && make install

if [ "$continue_on_key" = true ]; then
    echo "Press any key to continue..."
    read -n 1
fi

