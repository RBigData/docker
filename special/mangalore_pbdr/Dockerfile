FROM rbigdata/mpi 
MAINTAINER "The pbdR Core Team" RBigData@gmail.com 

USER root
WORKDIR /packages
ADD . /packages
RUN R -e "source('packages_pbdR_install.R')"  

# A temporary fix for OpenMPI-Docker shared memory issue.
# See: https://github.com/open-mpi/ompi/issues/4948
# Disables shared memory advantage in MPI communications
RUN export OMPI_MCA_btl_vader_single_copy_mechanism="none"

WORKDIR /home/pbdR
USER pbdR
CMD ["bash"]
