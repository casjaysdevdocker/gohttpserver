## 👋 Welcome to gohttpserver 🚀  

gohttpserver README  
  
  
## Install my system scripts  

```shell
 sudo bash -c "$(curl -q -LSsf "https://github.com/systemmgr/installer/raw/main/install.sh")"
 sudo systemmgr --config && sudo systemmgr install scripts  
```
  
## Automatic install/update  
  
```shell
dockermgr update gohttpserver
```
  
## Install and run container
  
```shell
dockerHome="/var/lib/srv/$USER/docker/casjaysdevdocker/gohttpserver/gohttpserver/latest/rootfs"
mkdir -p "/var/lib/srv/$USER/docker/gohttpserver/rootfs"
git clone "https://github.com/dockermgr/gohttpserver" "$HOME/.local/share/CasjaysDev/dockermgr/gohttpserver"
cp -Rfva "$HOME/.local/share/CasjaysDev/dockermgr/gohttpserver/rootfs/." "$dockerHome/"
docker run -d \
--restart always \
--privileged \
--name casjaysdevdocker-gohttpserver-latest \
--hostname gohttpserver \
-e TZ=${TIMEZONE:-America/New_York} \
-v "$dockerHome/data:/data:z" \
-v "$dockerHome/config:/config:z" \
-p 80:80 \
casjaysdevdocker/gohttpserver:latest
```
  
## via docker-compose  
  
```yaml
version: "2"
services:
  ProjectName:
    image: casjaysdevdocker/gohttpserver
    container_name: casjaysdevdocker-gohttpserver
    environment:
      - TZ=America/New_York
      - HOSTNAME=gohttpserver
    volumes:
      - "/var/lib/srv/$USER/docker/casjaysdevdocker/gohttpserver/gohttpserver/latest/rootfs/data:/data:z"
      - "/var/lib/srv/$USER/docker/casjaysdevdocker/gohttpserver/gohttpserver/latest/rootfs/config:/config:z"
    ports:
      - 80:80
    restart: always
```
  
## Get source files  
  
```shell
dockermgr download src casjaysdevdocker/gohttpserver
```
  
OR
  
```shell
git clone "https://github.com/casjaysdevdocker/gohttpserver" "$HOME/Projects/github/casjaysdevdocker/gohttpserver"
```
  
## Build container  
  
```shell
cd "$HOME/Projects/github/casjaysdevdocker/gohttpserver"
buildx 
```
  
## Authors  
  
🤖 casjay: [Github](https://github.com/casjay) 🤖  
⛵ casjaysdevdocker: [Github](https://github.com/casjaysdevdocker) [Docker](https://hub.docker.com/u/casjaysdevdocker) ⛵  
