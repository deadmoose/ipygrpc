#!/bin/bash

/build_bindings.sh > /tmp/proto_build.log 2>&1

if [[ $# -eq 0 ]]; then
    # No args passed in, so let's just auto-import all the protos
    echo "import os, sys, grpc" >> /ipython_init.py
    ls /protos/*.py | sed 's/^\/protos\/\(.*\).py/import \1/' >> /ipython_init.py
    PYTHONPATH=/protos python -mIPython -i /ipython_init.py
else
    PYTHONPATH=/protos python $@
fi
