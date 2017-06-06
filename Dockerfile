FROM rbigdata/pbdr-base
MAINTAINER "The pbdR Core Team" RBigData@gmail.com



# create an R user
ENV HOME /home/pbdR
RUN useradd --create-home --home-dir $HOME pbdR \
  && chown -R pbdR:pbdR $HOME

WORKDIR $HOME
USER pbdR



# default command
CMD ["bash"]
