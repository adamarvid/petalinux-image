# Buildroot CI Docker container
This container is used for CI testing for Buildroot
## Example how to run the container
``` 
make foo_defconfig
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
docker run -v ${SSH_AUTH_SOCK}:/tmp/ssh-agent -e SSH_AUTH_SOCK=/tmp/ssh-agent -v $PWD:/src buildroot-ci:latest
```
