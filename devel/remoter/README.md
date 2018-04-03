# pbdr-cs

Docker configuration for the remoter server. This includes the [pbdr-base](https://github.com/RBigData/docker/tree/master/pbdr-base) system.



# Setting Up the Container

Run:

```bash
sudo docker pull rbigdata/pbdr-remoter
sudo docker run -i -t -p 55555:55555 rbigdata/pbdr-remoter
```

Alternatively, if you prefer/need to to work with the docker file directly:

1. Copy `Dockerfile` to your machine.
2. cd to the dir containing `Dockerfile`
3. `sudo docker build -t pbdr-remoter .`
4. `sudo docker run -i -t -p 55555:55555 pbdr-remoter`



# Using the Container

You can connect to your container by running:

```r
remoter::client()
```

from R. The password is `pbd`.

You can exit from the R session at any time by entering `exit()`. If you wish to disconnect and also shut down the container, enter `exit(F)`.  For more information about the client/server system, see the [**remoter** package](https://github.com/RBigData/remoter).



# Contact

If something goes wrong, please open an issue on the [github repository](https://github.com/RBigData/docker).
