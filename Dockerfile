# AlpineLinux with a glibc-2.29-r0 and Oracle Java 8
FROM ubuntu:16.04

ENV JAVA_HOME=/usr/lib/jvm/java-8-oracle
ENV DEBIAN_FRONTEND noninteractive
ENV LANG=zh_TW.UTF-8
ENV LC_ALL=en_US.UTF-8
ENV LC_ALL =zh_TW.UTF-8
ENV LC_CTYPE="zh_TW.UTF-8"
ENV LC_NUMERIC="zh_TW.UTF-8"
ENV LC_TIME="zh_TW.UTF-8"
ENV NLS_LANG=.AL32UTF8


RUN apt-get update && \
  apt-get install -y --no-install-recommends locales && \
  locale-gen en_US.UTF-8 && \
  apt-get dist-upgrade -y && \
  apt-get --purge remove openjdk* && \
  echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections && \
  echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" > /etc/apt/sources.list.d/webupd8team-java-trusty.list && \
  apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886 && \
  apt-get update && \
  apt-get install -y --no-install-recommends oracle-java8-installer oracle-java8-set-default && \
  apt-get clean all




apk update
apk add curl

