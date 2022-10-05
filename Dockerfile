FROM ubuntu:20.04
ARG DEBIAN_FRONTEND=noninteractive
ARG userid
ARG groupid
ARG username

ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get install -y git gnupg sudo

RUN git clone https://github.com/DumprX/DumprX \
	&& cd DumprX \
	&& bash setup.sh

RUN groupadd -o -g $groupid $username \
 && useradd -m -u $userid -g $groupid $username \
 && echo $username >/root/username \
 && echo "export USER="$username >>/home/$username/.gitconfig

RUN DEBIAN_FRONTEND=noninteractive apt install tzdata

COPY gitconfig /home/$username/.gitconfig
RUN chown $userid:$groupid /home/$username/.gitconfig
ENV HOME=/home/$username
ENV USER=$username

RUN chown -R $userid:$groupid /DumprX

ENTRYPOINT chroot --userspec=$(cat /root/username):$(cat /root/username) / /bin/bash -i
