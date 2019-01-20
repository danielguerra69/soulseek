FROM danielguerra/ubuntu-xrdp
MAINTAINER Daniel Guerra
RUN apt update && apt install -y vlc && \
  rm -rf /var/cache/apt /var/lib/apt/lists
RUN wget -qO- "https://www.dropbox.com/s/7qh902qv2sxyp6p/SoulseekQt-2016-1-17-64bit.tgz?dl=1" | tar xzvf - -C /usr/bin --transform='s/.*/soulseek/'
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
