FROM ubuntu:xenial
MAINTAINER Naoki Saito <saito.naoki@nmiri.city.nagoya.jp>
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get upgrade -y \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y gcc-arm-none-eabi \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y subversion git g++ perl make \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y libboost-dev \
         libboost-regex-dev libboost-filesystem-dev libboost-system-dev libboost-program-options-dev \
         libxerces-c-dev \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y wget sudo ruby vim man

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
