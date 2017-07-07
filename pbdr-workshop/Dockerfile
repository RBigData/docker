FROM rbigdata/pbdr-base
MAINTAINER "The pbdR Core Team" RBigData@gmail.com


RUN apt-get update \
  && apt-get install -y \
    libzmq3-dev \
    libsodium-dev

RUN r -e "                                              \
  install.packages(c('rbenchmark', 'locfit', 'fda.usc', \
  'randomForest', 'mlbench', 'pbdZMQ'))               ; \
"

RUN r -e "                        \
  install.packages(c('inline')) ; \
"

RUN r -e "                                              \
  remotes::install_github('wrathematics/openblasctl') ; \
  remotes::install_github('RBigData/remoter')         ; \
  remotes::install_github('RBigData/pbdRPC')          ; \
"

# create an R user
ENV HOME /home/pbdR
RUN useradd --create-home --home-dir $HOME pbdR \
  && chown -R pbdR:pbdR $HOME

WORKDIR $HOME
USER pbdR



# default command
CMD ["bash"]
