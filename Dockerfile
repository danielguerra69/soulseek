FROM ubuntu:18.04
MAINTAINER Daniel Guerra
RUN apt-get -yy update \
&& apt-get -y install --no-install-recommends sudo wget libx11-6 libx11-xcb1 libfontconfig1 \
supervisor xvfb x11vnc software-properties-common openbox xterm \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/log/*
# add soulseek
RUN wget -qO- "https://www.dropbox.com/s/7qh902qv2sxyp6p/SoulseekQt-2016-1-17-64bit.tgz?dl=1" | tar xzvf - -C /usr/bin --transform='s/.*/soulseek/'
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
RUN chown soulseek:soulseek /usr/bin/soulseek*
RUN chown soulseek:soulseek /home/soulseek
ENV DISPLAY :1

USER soulseek
EXPOSE 5900
ENTRYPOINT ["/bin/docker-entrypoint.sh"]
CMD ["/bin/start"]
