# pbdr-base

Docker configuration for the base pbdR system. This includes the computation packages (pbdMPI, pbdDMAT, ...) but not client/server related ones (pbdZMQ, remoter, ...).



# Setting Up the Container

Run:

```bash
sudo docker pull rbigdata/pbdr-base
sudo docker run -i -t rbigdata/pbdr-base
```

Alternatively, if you prefer/need to to work with the docker file directly:

1. Copy `Dockerfile` to your machine.
2. cd to the dir containing `Dockerfile`
3. `sudo docker build -t pbdr-base .`
4. `sudo docker run -i -t pbdr-base`



# Contact

If something goes wrong, please open an issue on the [github repository](https://github.com/RBigData/pbdr-base).
