FEniCS build scripts
====================

Build PETSc, SLEPc, DOLFIN/FENICS, mshr within a Python virtualenv, using system dependencies for OpenMPI, BLAS, LAPACK, HDF5, etc.

Instructions
------------

+ INSTALLATION
  
  Configure and run :code:`build_all.sh` 

  code:: 

    ./build_all.sh |& tee build.log

+ USAGE
  
  * Load the environment (modules, environment variables, python venv) with:

    code::

      source $PREFIX/share/dolfin/dolfin.conf

    where :code:`$PREFIX` is as specified in :code:`build_all.sh`.

  * Run the Poisson example to test the installation:

    code::

        python3 test_poisson.py

    and in parallel:

    code::

        mpirun -n 4 python3 test_poisson.py
