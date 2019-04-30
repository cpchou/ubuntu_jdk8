FROM library/ubuntu:16.04
#
# Ubuntu 16.04.x with Oracle JDK 8
#


RUN locale-gen zh_TW.UTF-8

ENV LANG zh_TW.UTF-8
ENV LANGUAGE zh_TW.UTF-8
ENV LC_ALL zh_TW.UTF-8

RUN apt-get update
RUN apt install -y curl
RUN apt install -y wget
RUN apt install -y gzip

RUN cd /opt
RUN wget https://cpchou0701.diskstation.me/jdk/jdk-8u211-linux-x64.tar.gz
RUN gzip -d jdk-8u211-linux-x64.tar.gz
RUN tar xf jdk-8u211-linux-x64.tar
RUN ln -s  /opt/jdk1.8.0_211 /opt/jdk
RUN rm -f jdk-8u211-linux-x64.tar

ENV LANG zh_TW.UTF-8
ENV LANGUAGE zh_TW.UTF-8
ENV LC_ALL zh_TW.UTF-8
ENV JAVA_HOME /opt/jdk
ENV PATH $PATH:$JAVA_HOME
ENV PATH /opt/jdk/bin:${PATH}
