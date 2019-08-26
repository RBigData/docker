FROM rocker/tidyverse
MAINTAINER "The pbdR Core Team" RBigData@gmail.com 
ENV MAKE make -j 4 

RUN apt-get update && apt-get install -y \
	libopenblas-dev

RUN echo "options(repos=structure(c(CRAN='https://cran.rstudio.com/'))) ; \
  utils::rc.settings(ipck=TRUE);" > /usr/local/lib/R/etc/Rprofile.site

RUN r -e "install.packages('remotes')"
RUN r -e "remotes::install_github('wrathematics/openblasctl')"

WORKDIR /packages
ADD . /packages
RUN r -e "source('packages_rstudio_install.R')"  

CMD ["/init"]
