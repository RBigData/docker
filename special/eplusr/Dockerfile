FROM rocker/r-base
ENV MAKE make -j 2

RUN apt-get update && apt-get install -y \
    wget ssh libopenblas-dev libopenmpi-dev libudunits2-dev

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

RUN r -e "install.packages('remotes', dependencies='Imports')"
RUN r -e "install.packages('rlecuyer', dependencies='Imports')"
RUN r -e "                                        \
  remotes::install_github('RBigData/pbdMPI')    ; \
  remotes::install_github('RBigData/tasktools') ; \
"

RUN r -e "install.packages('eplusr')"

CMD ["bash"]

