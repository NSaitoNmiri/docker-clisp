FROM ubuntu:xenial
MAINTAINER Naoki Saito <saito.naoki@nmiri.city.nagoya.jp>
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get upgrade -y \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y subversion git wget curl sudo vim man
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y emacs cl-swank slime sbcl

#
# create a user (UserID: ${USER} or "developer")
#
ARG USER
ENV user=${USER:-"developer"}
RUN adduser --gecos ",,," --disabled-password $user \
    && passwd -d $user \
    && usermod -G sudo $user

###
### run custom scripts
###
USER root
WORKDIR /tmp
ADD ./scripts/root ./scripts
RUN chmod -R +x scripts \
    && ./scripts/setup_root.sh
WORKDIR /home/$user
ADD ./scripts/user ./scripts
RUN chown -R $user:$user ./scripts
USER $user
RUN chmod -R +x ./scripts \
    && ./scripts/setup_user.sh
