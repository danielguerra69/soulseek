FROM danielguerra/ubuntu-xrdp:20.04
MAINTAINER Daniel Guerra

RUN wget -qO- "https://www.slsknet.org/SoulseekQt/Linux/SoulseekQt-2018-1-30-64bit-appimage.tgz" | tar xzvf - -C /tmp --transform='s/.*/soulseek/'

WORKDIR /opt

RUN /tmp/soulseek --appimage-extract && mv squashfs-root soulseek && rm -rf /tmp/*

RUN chmod -R 777 soulseek

WORKDIR /opt/soulseek

RUN wget -q https://upload.wikimedia.org/wikipedia/commons/8/83/Soulseek-png-3.png

RUN ln -s /opt/soulseek/SoulseekQt /usr/bin/soulseek

ADD etc /etc

ADD etc/skel/Desktop/Soulseek.desktop /usr/share/applications/Soulseek.desktop
