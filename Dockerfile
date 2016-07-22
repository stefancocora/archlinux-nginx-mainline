FROM finalduty/archlinux:weekly

MAINTAINER stefan.cocora@gmail.com

RUN pacman -Syu --noconfirm --force nginx-mainline

COPY bin/run.sh /run.sh

ENTRYPOINT ["/run.sh"]
