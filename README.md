# Petalinux CI Docker container
This container is used for CI testing for Petalinux 2018.2
## Example how to run the container
``` 
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
docker run -v ${SSH_AUTH_SOCK}:/tmp/ssh-agent -e SSH_AUTH_SOCK=/tmp/ssh-agent -v $PWD:/home/plnx/project s618:latest
```
