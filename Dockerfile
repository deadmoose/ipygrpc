FROM grpc/python:1.4

RUN pip install --no-cache-dir ipython==5.5

RUN mkdir -p /protos /work
WORKDIR /work

COPY ["ipygrpc.sh", "build_bindings.sh", "/"]
RUN chmod +x /*.sh

ENTRYPOINT ["/ipygrpc.sh"]
