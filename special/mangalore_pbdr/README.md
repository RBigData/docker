sudo docker build -t workshop_pbdr .

Now cd to the workshop directory and:
sudo docker run -v ${PWD}:/home/pbdR/workshop -p 8787:8787 -i -t workshop_pbdr

For Rstudio Server, open in your browser: http://localhost:8787
username: rstudio
password: rstudio

Some useful docker commands:
docker --help
docker image ls -a
docker image rm <imagetag>
docker image prune
docker container prune
