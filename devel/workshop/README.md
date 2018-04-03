# pbdr-workshop

Docker configuration for use with pbdR workshops/tutorials.  This includes the pbdR compute system, as well as some useful additional packges like [randomForest](https://cran.r-project.org/web/packages/randomForest/index.html) and [mlbench](https://cran.r-project.org/web/packages/mlbench/index.html).



# Setting Up the Container

Run:

```bash
sudo docker run -i -t rbigdata/pbdr-workshop
```

Alternatively, if you prefer/need to to work with the docker file directly:

1. Copy `Dockerfile` to your machine.
2. cd to the dir containing `Dockerfile`
3. `sudo docker build -t pbdr-workshop .`
4. `sudo docker run -i -t pbdr-workshop`



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



# Contact

If something goes wrong, please open an issue on the [github repository](https://github.com/RBigData/docker).
