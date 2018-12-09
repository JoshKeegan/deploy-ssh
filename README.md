# deploy-ssh
A docker image for automated deployments via `ssh`.  
Also adds `bash` for scripting and `curl` for quick post-deployment tests.

## Usage
Use like any other docker image. It's URL is `joshkeegan/deploy-ssh:latest`. See [Docker Hub](https://hub.docker.com/r/joshkeegan/deploy-ssh/tags/) for specific version tags.  

If connecting to a remote server over SSH (automated), pre-generate SSH keys and put the public one on the user & server you are connecting to.  
Then, when you use the image have it use the private key:
```bash
echo "$SSH_PRIVATE_KEY" > ~/.ssh/id_rsa
```
Keep your private keys secure!  
- Pass them through your build pipeline as secure variables.  
- Ensure they are not printed in logs.  
- If anyone else can access the containers, destroy them after use or remove keys from within the container once you are finished using it.

### Gitlab CI Example
See [PiSearch .gitlab-ci.yml](https://github.com/JoshKeegan/PiSearch/blob/master/.gitlab-ci.yml)

## Publishing
Note: only people authorised to publish to this repo on Docker Hub can publish the image.

 - Log in to Docker Hub (with `docker login`). 
 - Let `make` handle everything else:
```bash
make publish
```

## License
[MIT](LICENSE)