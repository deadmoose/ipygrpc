import grpc
import helloworld_pb2_grpc


def create_greeter_stub(target='helloworld_server:50051'):
    """Creates a Greeter stub connecting to the given target

    Args:
        target: The host/port of the remote server

    Returns:
        A GreeterStub.
        """
    return helloworld_pb2_grpc.GreeterStub(grpc.insecure_channel(target))


stub = create_greeter_stub()
