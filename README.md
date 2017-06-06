# pbdr-compute

Docker configuration for the pbdR compute system. This includes the computation packages (pbdMPI, pbdDMAT, ...) but not client/server related ones (pbdZMQ, remoter, ...). For the latter, see [pbdr-cs](https://github.com/RBigData/pbdr-cs), which is a strict superset of pbdr-compute.



# Setting Up the Container

Run:

```bash
sudo docker pull rbigdata/pbdr-compute
sudo docker run -i -t rbigdata/pbdr-compute
```

Alternatively, if you prefer/need to to work with the docker file directly:

1. Copy `Dockerfile` to your machine.
2. cd to the dir containing `Dockerfile`
3. `sudo docker build -t pbdr-compute .`
4. `sudo docker run -i -t pbdr-compute`



# Using the Container

## Basics
Create your pbdR script as usual and run it via mpirun.  Take this simple "hello world" for example:

```r
suppressPackageStartupMessages(library(pbdMPI))

comm.print(
  paste("Hello from rank", comm.rank(), "of", comm.size()),
  all.rank=TRUE
)

finalize()
```

Then run the script via:

```bash
mpirun -np 2 r myscript.r
```

If for some reason you prefer `Rscript` to `r` ([littler](http://dirk.eddelbuettel.com/code/littler.html)), you can instead run:

```bash
mpirun -np 2 Rscript myscript.r
```

## MPI Profiling with pbdPROF
To use MPI packages with profiling, replace your `library(pbdMPI)` call (or add if absent) with:

```r
library(pbdMPI, lib.loc="/usr/local/pbd-prof")
```



# Contact

If something goes wrong, please open an issue on the [github repository](https://github.com/RBigData/pbdr-compute).
