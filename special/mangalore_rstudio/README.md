sudo docker build -t workshop_rstudio .

Now cd to the workshop directory and:
sudo docker run -v ${PWD}:/home/rstudio/workshop -p 8787:8787 -e PASSWORD=workshop -ti workshop_rstudio

For Rstudio Server, open in your browser: http://localhost:8787
username: rstudio
password: rstudio

Some useful docker commands:
docker --help
docker image ls -a
docker image rm <imagetag>
docker image prune
docker container prune
