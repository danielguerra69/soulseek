FROM ubuntu:18.04
MAINTAINER Daniel Guerra
RUN apt-get -yy update \
&& apt-get -y install --no-install-recommends sudo wget libx11-6 libx11-xcb1 libfontconfig1 \
supervisor xvfb x11vnc software-properties-common openbox xterm \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/log/*

# add soulseek
RUN wget -qO- "https://www.slsknet.org/SoulseekQt/Linux/SoulseekQt-2018-1-30-64bit-appimage.tgz" | tar xzvf - -C /tmp --transform='s/.*/soulseek/'

WORKDIR /opt

RUN /tmp/soulseek --appimage-extract && mv squashfs-root soulseek && rm -rf /tmp/*

RUN chmod -R 777 soulseek

RUN ln -s /opt/soulseek/SoulseekQt /usr/bin/soulseek
# Add german characters in terminal
RUN echo "set convert-meta off" >> /etc/inputrc
RUN addgroup soulseek
RUN useradd -m -s /bin/bash -g soulseek soulseek
RUN echo "soulseek:soulseek" | /usr/sbin/chpasswd
RUN echo "soulseek    ALL=(ALL) ALL" >> /etc/sudoers
WORKDIR /home/soulseek
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD openbox /etc/xdg/openbox
ADD bin /bin
RUN chown soulseek:soulseek /home/soulseek
ENV DISPLAY :1

USER soulseek
EXPOSE 5900
ENTRYPOINT ["/bin/docker-entrypoint.sh"]
CMD ["/bin/start"]
