FROM rocker/r-base
MAINTAINER "The pbdR Core Team" RBigData@gmail.com

RUN apt-get update      \
  && apt-get install -y \
    wget                \
    python              \
    ssh                 \
    libopenblas-dev     \
    libopenmpi-dev      \
    libnetcdf-dev


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
RUN r -e "                                        \
  remotes::install_github('RBigData/pbdMPI')    ; \
  remotes::install_github('RBigData/pbdSLAP')   ; \
  remotes::install_github('RBigData/pbdBASE')   ; \
  remotes::install_github('RBigData/pbdDMAT')   ; \
  remotes::install_github('RBigData/pbdML')     ; \
  remotes::install_github('RBigData/pmclust')   ; \
  remotes::install_github('RBigData/pbdNCDF4')  ; \
  remotes::install_github('RBigData/pbdIO')     ; \
"



# build mpiP
ENV MPIP_VERSION 3.4.1
ENV MPIP_LIB_DIR /opt/mpiP
RUN cd /tmp                                                                    \
  && wget https://github.com/LLNL/mpiP/archive/${MPIP_VERSION}.tar.gz          \
  && tar zxf ${MPIP_VERSION}.tar.gz                                            \
  && cd mpiP-${MPIP_VERSION}                                                   \
  && sed -i -e 's/os[.]environ\["LOGNAME"\]/\"pbdR\"/' make-wrappers.py \
  && CC="mpicc -fPIC" ./configure --disable-libunwind --prefix=${MPIP_LIB_DIR} \
  && make                                                                      \
  && make install                                                              \
  && rm -rf mpiP-${MPIP_VERSION}/

# build pbdPROF and pbdPROF-enabled pbdMPI
ENV PROF_LIB_DIR /usr/local/pbd-prof
RUN mkdir ${PROF_LIB_DIR}

RUN r -e "                                                            \
  remotes::install_github('RBigData/pbdPROF',                         \
    lib='${PROF_LIB_DIR}',                                            \
    configure.args='--with-mpiP=\"${MPIP_LIB_DIR}/lib/libmpiP.a\"') ; \
  remotes::install_github('RBigData/pbdMPI',                          \
    configure.args='--enable-pbdPROF=yes',                            \
    lib='${PROF_LIB_DIR}')                                          ; \
"



# some quality of life stuff
RUN echo "alias R='R --no-save --quiet'" >> /etc/bash.bashrc
RUN echo "options(repos=structure(c(CRAN='https://cran.rstudio.com/'))) ; \
  utils::rc.settings(ipck=TRUE); \
  library(colorout); \
  " > /usr/lib/R/etc/Rprofile.site



# cleanup
RUN rm -rf /tmp/*
RUN apt-get remove -y --purge python wget
RUN apt-get autoremove -y
RUN apt-get autoclean



# default command
CMD ["bash"]
