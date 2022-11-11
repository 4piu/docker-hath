# Hentai@Home on Docker

## Support platforms
* linux/amd64
* linux/arm64/v8
* linux/arm/v7
* linux/ppc64le

## Deploy

Replace `<HATH_PATH>` `<YOUR_CLIENT_ID>` `<YOUR_CLIENT_KEY>` `<PORT>` with your configurations.

### Run command below

```sh
#Pull image
sudo docker pull d0v0b/hentaiathome

#Run it
sudo docker run -d \
--name hath \
-p <PORT>:<PORT> \
-v <HATH_PATH>:/hath \
-e CLIENT_ID=<YOUR_CLIENT_ID> CLIENT_KEY=<YOUR_CLIENT_KEY> \
d0v0b/hentaiathome

# Or if you want to use host network stack
sudo docker run -d \
--name hath \
--net host \
-v <HATH_PATH>:/hath \
-e CLIENT_ID=<YOUR_CLIENT_ID> CLIENT_KEY=<YOUR_CLIENT_KEY> \
d0v0b/hentaiathome

# To use different cache and download path:
sudo docker run -d \
--name hath \
-p <PORT>:<PORT> \
-v <HATH_PATH>:/hath \
-v <HATH_CACHE_PATH>:/hath/cache \
-v <HATH_DOWNLOAD_PATH>:/hath/download \
-e CLIENT_ID=<YOUR_CLIENT_ID> CLIENT_KEY=<YOUR_CLIENT_KEY> \
d0v0b/hentaiathome
```

## Update

```sh
# Stop the container
sudo docker stop hath

# Delete the container
sudo docker rm hath

# Delete the old image
sudo docker rmi d0v0b/hentaiathome

# Pull the new image
sudo docker pull d0v0b/hentaiathome

# Run new container
sudo docker run -d \
--name hath \
-p <PORT>:<PORT> \
-v <HATH_PATH>:/hath \
d0v0b/hentaiathome

# Or if you want to use host network stack
sudo docker run -d \
--name hath \
--net host \
-v <HATH_PATH>:/hath \
d0v0b/hentaiathome
```

## Changelog
2020/10/06 Graceful shutdown  
2021/06/09 DockerHUB has stopped free plan from using Autobuild feature, until i found other ways to update image, there will not have any update.  
2021/07/01 Now using Github action to build image.  
2022/06/04 Use Eclipse temurin images.
