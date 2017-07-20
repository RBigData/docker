FROM rbigdata/pbdr-base
MAINTAINER "The pbdR Core Team" RBigData@gmail.com


# avoids a lock file error
RUN apt-get update || apt-get update
RUN apt-get install -y \
    libzmq3-dev \
    libsodium-dev



# some CRAN dependencies
RUN r -e "install.packages(c('getPass', 'png', 'sodium'), \
  repos='https://cran.rstudio.com/', dependencies='Imports')"



# install latest pbdR packages from github
RUN r -e "                                        \
  remotes::install_github('wrathematics/getip') ; \
  remotes::install_github('RBigData/pbdRPC')    ; \
  remotes::install_github('RBigData/pbdZMQ')    ; \
  remotes::install_github('RBigData/remoter')   ; \
  remotes::install_github('RBigData/pbdCS')     ; \
"



# create a user so we can launch MPI as not-root
ENV HOME /home/pbdR
RUN useradd --create-home --home-dir $HOME pbdR \
  && chown -R pbdR:pbdR $HOME

WORKDIR $HOME
USER pbdR



# spawn the servers
ENV PBD_RANKS 2
EXPOSE 55555
CMD ["r", "-e", "nranks=as.integer(Sys.getenv('PBD_RANKS')); pbdCS::pbdSpawn(nranks=nranks)"]
