FROM ubuntu:14.04
MAINTAINER Daniel Guerra
RUN dpkg --add-architecture i386
RUN apt-get -yy update \
&& apt-get -y install --no-install-recommends wget libx11-6 libx11-xcb1 libfontconfig1 supervisor xvfb x11vnc software-properties-common openbox xterm git-core\
&& add-apt-repository ppa:wine/wine-builds \
&& apt-get -yy update \
&& apt-get -y install winehq-devel \
&& cd /bin \
&& wget http://www.slsknet.org/SoulseekQT/Windows/SoulseekQt-2015-6-12.exe \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


RUN addgroup soulseek
RUN useradd -m -g soulseek soulseek
WORKDIR /home/soulseek
RUN git clone --recursive https://github.com/kanaka/noVNC.git
RUN chown -R soulseek:soulseek noVNC
EXPOSE 5900 6080
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD menu.xml /etc/xdg/openbox/menu.xml
ADD install /usr/bin/soulseek_install
ADD soulseek /usr/bin/soulseek
RUN chown soulseek:soulseek /usr/bin/soulseek*
ADD winetricks /home/soulseek/winetricks
RUN chown soulseek:soulseek /home/soulseek/winetricks
ADD start /bin/start
CMD ["/bin/start"]
