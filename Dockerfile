FROM ubuntu:14.04
MAINTAINER Daniel Guerra
RUN apt-get -yy update \
&& apt-get -yy install wget libx11-6 libx11-xcb1 libfontconfig1 supervisor xvfb x11vnc fluxbox \
&& cd /tmp \
&& wget http://www.soulseekqt.net/SoulseekQT/Linux/SoulseekQt-2015-6-25-64bit.tgz \
&& tar xvfz SoulseekQt-2015-6-25-64bit.tgz \
&& mv SoulseekQt-2015-6-25-64bit /usr/bin/SoulseekQt \
&& apt-get remove -y wget \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN addgroup soulseek
RUN useradd -m -g soulseek soulseek
EXPOSE 5900
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
