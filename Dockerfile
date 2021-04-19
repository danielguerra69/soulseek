FROM danielguerra/ubuntu-xrdp:20.04
MAINTAINER Daniel Guerra
RUN apt update && apt install -y vlc && \
  rm -rf /var/cache/apt /var/lib/apt/lists
# add soulseek
RUN wget -qO- "https://www.slsknet.org/SoulseekQt/Linux/SoulseekQt-2018-1-30-64bit-appimage.tgz" | tar xzvf - -C /usr/bin --transform='s/.*/soulseek/'
# Add german characters in terminal
RUN echo "set convert-meta off" >> /etc/inputrc
RUN addgroup soulseek
RUN useradd -m -s /bin/bash -g soulseek soulseek
RUN echo "soulseek:soulseek" | /usr/sbin/chpasswd
RUN echo "soulseek    ALL=(ALL) ALL" >> /etc/sudoers
ADD Desktop /home/soulseek
ADD bin /usr/bin
RUN chown soulseek:soulseek /usr/bin/soulseek* /home/soulseek
ENV DISPLAY :1
