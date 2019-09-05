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
RUN r -e "install.packages('pbdMPI', dependencies='Imports')"
RUN r -e "remotes::install_github('RBigData/tasktools')"

RUN r -e "install.packages('eplusr')"
RUN mkdir /opt/eplus
RUN mkdir -p /usr/local/EnergyPlus-9-1-0/PreProcess/IDFVersionUpdater/
RUN mkdir -p /opt/eplus/bin
RUN wget --directory-prefix=/opt/eplus https://github.com/NREL/EnergyPlus/releases/download/v91AndBugFix4/EnergyPlus-9.1.0-fafb9d5652-Linux-x86_64.sh
RUN mv /opt/eplus/EnergyPlus* /opt/eplus/EnergyPlus.sh
RUN chmod +x /opt/eplus/EnergyPlus.sh
RUN sh -c `/bin/echo -e "y\n/opt/eplus/\n/opt/eplus/bin" | /opt/eplus/EnergyPlus.sh`; \
  exit 0
RUN rm -rf /opt/eplus/*.sh

RUN echo "library(eplusr) ; \
  eplusr::use_eplus('/opt/eplus/')" > /usr/lib/R/etc/Rprofile.site

CMD ["bash"]
