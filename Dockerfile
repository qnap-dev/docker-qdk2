FROM ubuntu:14.04
LABEL maintainer="edhongcy@gmail.com"

ARG QDK2_VER=0.24

# Install.
RUN apt-get update \
  && apt-get install -y software-properties-common \
  && add-apt-repository -y ppa:chris-lea/node.js \
  && apt-get update \
  && apt-get install -y build-essential unzip curl wget git realpath moreutils fakeroot pv python-support bsdmainutils curl python openssl\
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# Install qdk2
RUN \
  wget https://github.com/qnap-dev/qdk2/releases/download/v${QDK2_VER}/qdk2_${QDK2_VER}.trusty_amd64.deb \
  && dpkg -i qdk2_${QDK2_VER}.trusty_amd64.deb \
  && rm -f qdk2_${QDK2_VER}.trusty_amd64.deb

ADD app.sh /
ENTRYPOINT ["/app.sh"]
