FROM rocker/r-base
MAINTAINER "The pbdR Core Team" RBigData@gmail.com

ENV PBDR_VERSION 1.0-1
ENV MAKE make -j 2

# set up system
RUN apt-get update      \
  && apt-get install -y \
    wget                \
    python              \
    ssh                 \
    libopenblas-dev     \
    libopenmpi-dev



# set up R
ENV COLOROUT_VERSION 1.2-0
RUN cd /tmp \
  && wget https://github.com/jalvesaq/colorout/archive/v${COLOROUT_VERSION}.tar.gz \
  && tar zxf v${COLOROUT_VERSION}.tar.gz \
  && R CMD INSTALL colorout-${COLOROUT_VERSION}/ \
  && rm v${COLOROUT_VERSION}.tar.gz \
  && rm -rf colorout-${COLOROUT_VERSION}/

RUN echo "options(repos=structure(c(CRAN='https://cran.rstudio.com/'))) ; \
  utils::rc.settings(ipck=TRUE);                                          \
  library(colorout);                                                      \
  " > /usr/lib/R/etc/Rprofile.site
RUN echo "alias R='R --no-save --quiet'" >> /etc/bash.bashrc

RUN r -e "install.packages(c('rlecuyer', 'remotes'), dependencies='Imports')"



# install pbdR
RUN wget https://pbdr.org/releases/pbdR_${PBDR_VERSION}.tar.gz
RUN tar zxf pbdR_${PBDR_VERSION}.tar.gz
RUN cd pbdR_${PBDR_VERSION} \
  && make COMM



# cleanup and create pbdR user
RUN rm -rf /tmp/*
RUN apt-get remove -y --purge python wget
RUN apt-get autoremove -y
RUN apt-get autoclean

ENV HOME /home/pbdR
RUN useradd --create-home --home-dir $HOME pbdR \
  && chown -R pbdR:pbdR $HOME

WORKDIR $HOME
USER pbdR

CMD ["bash"]
