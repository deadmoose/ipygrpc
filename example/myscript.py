# Example canned script to run with ipygrpc
#
# The automatic imports/ipython_init.py bits are NOT run when called when this is
# passed as an argument to the container, so we need to do everything ourselves

import grpc
from helloworld_pb2_grpc import GreeterStub
from helloworld_pb2 import HelloRequest

stub = GreeterStub(grpc.insecure_channel('helloworld_server:50051'))

for name in ['John', 'Paul', 'George', 'Ringo']:
    print('Server replied: "%s"' % stub.SayHello(
        HelloRequest(name=name)).message)
