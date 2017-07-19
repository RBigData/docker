# pbdr-mpi

Docker configuration for the the [pbdMPI package](https://github.com/RBigData/pbdMPI).  It is meant to be a minimal and light weight container.  For a larger ecosystem of pbdR packages, see the [pbdr-compute](https://github.com/RBigData/docker/tree/master/pbdr-compute) container.



# Setting Up the Container

Run:

```bash
sudo docker pull rbigdata/pbdr-mpi
sudo docker run -i -t rbigdata/pbdr-mpi
```

Alternatively, if you prefer/need to to work with the docker file directly:

1. Copy `Dockerfile` to your machine.
2. cd to the dir containing `Dockerfile`
3. `sudo docker build -t pbdr-mpi .`
4. `sudo docker run -i -t pbdr-mpi`



# Contact

If something goes wrong, please open an issue on the [github repository](https://github.com/RBigData/docker).
