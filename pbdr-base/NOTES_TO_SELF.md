debian/ubuntu scalapack is 10 years old, missing functions

```
cd slap && ./cleanup && cd .. && R CMD INSTALL slap --configure-vars="EXT_LDFLAGS='-lscalapack-openmpi -lblacs-openmpi -lblacsF77init-openmpi -lblacsCinit-openmpi -llapack -lblas'"

cd base && ./cleanup && cd .. && R CMD INSTALL base --configure-args="--enable-blacsexport=no"
```







cd pbdSLAP-master && ./cleanup && cd .. && R CMD INSTALL pbdSLAP-master --configure-vars="EXT_LDFLAGS='-lscalapack -llapack -lblas'"
