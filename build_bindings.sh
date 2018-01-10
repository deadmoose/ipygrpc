#!/bin/bash

FLAG_FILE=/protos/.protos_built

if [[ ! -f "${FLAG_FILE}" ]]; then
  python -m grpc_tools.protoc -I/protos --python_out=/protos --grpc_python_out=/protos /protos/*.proto
  touch "${FLAG_FILE}"
fi
