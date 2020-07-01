#!/bin/bash

python3 -m venv $VENV --system-site-packages --clear


if [ "$continue_on_key" = true ]; then
    echo "Press any key to continue..."
    read -n 1
fi
