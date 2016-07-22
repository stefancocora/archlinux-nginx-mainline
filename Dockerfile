FROM finalduty/archlinux:weekly

MAINTAINER stefan.cocora@gmail.com

RUN cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup \
    && sed -i 's/^#Server/Server/' /etc/pacman.d/mirrorlist.backup \
    && rankmirrors -v -n 4 /etc/pacman.d/mirrorlist.backup > /etc/pacman.d/mirrorlist

RUN pacman -Syu --noconfirm --force nginx-mainline

COPY bin/run.sh /run.sh

ENTRYPOINT ["/run.sh"]
