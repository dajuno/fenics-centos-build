#!/bin/bash
set -e
source env_build.sh

source ${VENV}/bin/activate

if [[ $FENICS_VERSION == 2019.1.0.post0 ]]; then

    PYPI_FENICS_VERSION=">=2019.1.0"
    pip3 install fenics${PYPI_FENICS_VERSION}

elif [[ $FENICS_VERSION == "master" ]]; then

    for pkg in fiat dijitso ufl ffc; do
        cd $BUILD_DIR
        if [ -d $pkg ]; then
            cd $pkg
            git pull
        else
            git clone https://bitbucket.org/fenics-project/${pkg}.git && \
                cd $pkg && \
                git checkout $FENICS_VERSION
            fi

        pip3 install --no-deps --upgrade .

    done

else
    echo "unsupported FEniCS version \"${FENICS_VERSION}\" for fenics-python"
    exit 1
fi


if [ "$continue_on_key" = true ]; then
    echo "Press any key to continue..."
    read -n 1
fi
