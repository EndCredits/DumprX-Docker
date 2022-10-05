## DumprX with Docker

Run dumprX with docker

Great thanks to DumprX developers

[DumprX](https://github.com/DumprX/DumprX)

### Get Started

1. Clone this repo
```
git clone https://github.com/EndCredits/DumprX-Docker -b main 
cd DumprX-Docker
```

2. Copy your git configs
```
cp ~/.gitconfig gitconfig
```

3. Build docker image
```
docker build --build-arg userid=$(id -u) --build-arg groupid=$(id -g) --build-arg username=$(id -un) -t dumprx-docker .
```

If you are using proxies like v2raya. You maybe need run your docker in the host mode.
```
docker build --build-arg userid=$(id -u) --build-arg groupid=$(id -g) --build-arg username=$(id -un) --network=host -t dumprx-docker .
```

4. Set your dumping directory
```
export DUMPRX_WORKING=<Where your flashable file placed>
```

5. Run DumprX
```
docker run -it --rm -v $DUMPRX_WORKING:/DumprX/input dumprx-docker
```

If you are using proxies like v2raya. You maybe need run your docker network under the host mode
```
docker run -it --rm -v $DUMPRX_WORKING:/DumprX/input --net=host dumprx-docker
```

Your stock ROM ( or ROM to be dumped ) should can be found in ```/DumprX/input```



