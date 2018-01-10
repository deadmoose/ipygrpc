Example usage of ipygrpc based on https://github.com/grpc/grpc/

```
# Build a dockerized helloworld server
docker build -f Dockerfile.server -t helloworld_server .

# Build an ipygrpc client
docker build -t helloworld .

# Create a network to let them communicate
docker network create helloworld

# Start up the server
docker run -d --rm --name helloworld_server --net helloworld helloworld_server

# Run an interactive client and play
docker run -it --rm --net helloworld helloworld

# Run an example canned script
docker run -it --rm --net helloworld -v $(pwd):/work helloworld myscript.py

# Tear down the server & network when done
docker kill helloworld_server
docker network rm helloworld
```

Within the ipygrpc session you can, for example:

```
In [1]: stub.SayHello(helloworld_pb2.HelloRequest())
Out[1]: message: "Hello, !"

In [2]: stub.SayHello(helloworld_pb2.HelloRequest(name='foo'))
Out[2]: message: "Hello, foo!"

In [3]: exit
```
