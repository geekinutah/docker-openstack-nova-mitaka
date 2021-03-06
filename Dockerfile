FROM ubuntu:latest
MAINTAINER Mike Wilson <geekinutah@gmail.com>

ENV TERM=xterm-256color

RUN apt-get -q update >/dev/null \
  && apt-get install -y python python-dev curl build-essential git \
  && git clone --branch 13.1.2 https://github.com/openstack/nova.git \
  && curl https://bootstrap.pypa.io/get-pip.py | python \
  && pip install nova/ \

  # Cleanup
  && apt-get clean autoclean \
  && apt-get autoremove --yes \
  && rm -rf /var/lib/{apt,dpkg,cache,log}/ 

ENTRYPOINT ["/usr/bin/true"]
