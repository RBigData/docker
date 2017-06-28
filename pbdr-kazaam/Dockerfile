FROM rocker/r-base
MAINTAINER "The pbdR Core Team" RBigData@gmail.com

RUN apt-get update      \
  && apt-get install -y \
    wget                \
    python              \
    ssh                 \
    libopenblas-dev     \
    libopenmpi-dev


# some CRAN dependencies
RUN apt-get install -y \
  r-cran-curl

RUN r -e "install.packages(c('rlecuyer', 'remotes', 'data.table'), \
  repos='https://cran.rstudio.com/', dependencies='Imports')"

ENV COLOROUT_VERSION 1.1-2
RUN cd /tmp \
  && wget https://github.com/jalvesaq/colorout/releases/download/v1.2-2/colorout_1.1-2.tar.gz \
  && tar zxf colorout_1.1-2.tar.gz \
  && R CMD INSTALL colorout/ \
  && rm colorout_1.1-2.tar.gz \
  && rm -rf colorout/



# install latest pbdR packages from github
RUN r -e "                                      \
  remotes::install_github('RBigData/pbdMPI')  ; \
  remotes::install_github('RBigData/kazaam')  ; \
  remotes::install_github('RBigData/pbdIO')   ; \
"



# some quality of life stuff
RUN echo "alias R='R --no-save --quiet'" >> /etc/bash.bashrc
RUN echo "options(repos=structure(c(CRAN='https://cran.rstudio.com/'))) ; \
  utils::rc.settings(ipck=TRUE);                                          \
  library(colorout);                                                      \
  " > /usr/lib/R/etc/Rprofile.site



# use openblas
RUN update-alternatives --set libblas.so.3 /usr/lib/openblas-base/libblas.so.3



# cleanup
RUN rm -rf /tmp/*
RUN apt-get remove -y --purge python wget
RUN apt-get autoremove -y
RUN apt-get autoclean



# create an R user
ENV HOME /home/pbdR
RUN useradd --create-home --home-dir $HOME pbdR \
  && chown -R pbdR:pbdR $HOME

WORKDIR $HOME
USER pbdR



# default command
CMD ["bash"]
