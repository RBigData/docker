FROM rocker/r-base
MAINTAINER "The pbdR Core Team" RBigData@gmail.com

RUN apt-get update \
  && apt-get install -y \
    libzmq3-dev \
    libsodium-dev



# some CRAN dependencies
RUN apt-get install -y \
  r-cran-curl

RUN r -e "install.packages(                                   \
  c('remotes', 'getPass', 'png', 'sodium'),                   \
  repos='https://cran.rstudio.com/', dependencies='Imports')  \
"



# install latest pbdR packages from github
RUN r -e "                                      \
  remotes::install_github('RBigData/pbdZMQ')  ; \
  remotes::install_github('RBigData/remoter') ; \
"



# open default remoter port
EXPOSE 55555



# default command
CMD ["r", "-e", "remoter::server(password='pbd')"]
