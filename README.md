# pbdr-base

Docker configuration for the the [kazaam package](https://github.com/RBigData/kazaam) for distributed matrix computing with R.



# Setting Up the Container

Run:

```bash
sudo docker pull rbigdata/pbdr-kazaam
sudo docker run -i -t rbigdata/pbdr-kazaam
```

Alternatively, if you prefer/need to to work with the docker file directly:

1. Copy `Dockerfile` to your machine.
2. cd to the dir containing `Dockerfile`
3. `sudo docker build -t pbdr-kazaam .`
4. `sudo docker run -i -t pbdr-kazaam`



# Contact

If something goes wrong, please open an issue on the [github repository](https://github.com/RBigData/pbdr-base).
