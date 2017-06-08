FROM rocker/r-base
MAINTAINER "The pbdR Core Team" RBigData@gmail.com

RUN apt-get update \
  && apt-get install -y \
    libzmq3-dev \
    libsodium-dev



# some CRAN dependencies
RUN r -e "install.packages(c('getPass', 'png', 'sodium'), \
  repos='https://cran.rstudio.com/', dependencies='Imports')"



# install latest pbdR packages from github
RUN r -e "                                      \
  remotes::install_github('RBigData/pbdZMQ')  ; \
  remotes::install_github('RBigData/remoter') ; \
"



# open default remoter/cs port
EXPOSE 55555



# default command
CMD ["r", "-e", "remoter::server(password='pbd')"]
