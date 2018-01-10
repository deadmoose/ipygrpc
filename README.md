ipygrpc
=======

Base Docker image for conveniently building an [IPython](https://ipython.org) shell with bindings
for gRPC services.

Usage
=====

In the simplest state, create a dockerfile such as:

```
FROM deadmoose/ipygrpc

COPY *.proto /protos
```

Then build & run the container. It will automatically build gRPC bindings for all the proto files in
`/protos`, and drop you into an ipython shell with them already imported.

To speed things at runtime, you can compile the grpc bindings when building your container and set
the environment variable `BINDINGS_PREBUILT`; if that is present, the entrypoint script assumes
everything is ready to go and skips compilation:

```
RUN /build_bindings.sh
```

Doing extra at startup
======================

If there's extra work you'd like to have happen automatically when python starts (e.g. define
factories to build stubs),the entrypoint for the IPython session is `/ipython_init.py`. Simply add
whatever you'd like to that file, and the base image will append a few extra things to it to provide
convenient imports.

NOTE: The automatic imports of the proto bindings are _appended_ to the file, so anything done
inside a custom `ipython_init.py` needs to handle its own imports.

Running scripts
===============

While you can `docker run -it mycontainer` to get an interactive shell, it's also possible to use
it to execute other scripts; the container's WORKDIR is `/work`, and any arguments passed to
`docker run` are passed to python in the container.

Map a volume in and pass the argument:

`docker run -it -v $(pwd):/work mycontainer somescript.py`
