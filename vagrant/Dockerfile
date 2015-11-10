FROM ubuntu:trusty

RUN apt-key adv --keyserver pgp.mit.edu --recv-keys B97B0AFCAA1A47F044F244A07FCC7D46ACCC4CF8

ENV PG_MAJOR 9.4

ENV PG_VERSION 9.4+169.pgdg14.04+1

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
  && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
  
ENV LANG en_US.utf8

COPY setup /setup

RUN /setup/package_install.sh

RUN /setup/dbprep.sh

CMD ["bash"]