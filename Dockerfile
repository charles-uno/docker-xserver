
FROM ubuntu:18.04

RUN apt-get update

RUN apt-get install -y firefox

RUN apt-get install -qqy x11-apps


# Replace 1000 with your user / group id
RUN export uid=1000 gid=1000

RUN mkdir -p /home/developer /etc/sudoers.d

RUN echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd
RUN echo "developer:x:${uid}:" >> /etc/group
RUN echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer
RUN chmod 0440 /etc/sudoers.d/developer
RUN chown ${uid}:${gid} -R /home/developer

USER developer
ENV HOME /home/developer
CMD /usr/bin/firefox
