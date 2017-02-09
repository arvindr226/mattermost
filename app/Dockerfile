FROM ubuntu:14.04
MAINTAINER Arvind Rawat <arvindr226@gmail.com>

RUN apt-get update && apt-get -y install curl netcat git make 

RUN curl -s https://storage.googleapis.com/golang/go1.4.2.linux-amd64.tar.gz | tar -v -C /usr/local -xz

ENV GOPATH /go
ENV GOROOT /usr/local/go
ENV PATH /usr/local/go/bin:/go/bin:/usr/local/bin:$PATH

CMD ["bash"]

#RUN go
#RUN mkdir /go
#RUN curl https://storage.googleapis.com/golang/go1.7.4.src.tar.gz  | tar -xvz
#RUN export GOPATH=/go
#RUN export PATH=$PATH:$GOPATH/bin
#RUN ulimit -n 8096
RUN mkdir -p /mattermost

#RUN curl https://releases.mattermost.com/3.5.1/mattermost-team-3.5.1-linux-amd64.tar.gz | tar -xvz
#ENV REPO https://github.com/mattermost/platform.git
#RUN git clone $REPO 
#      cd platform 
#RUN rm /mattermost/config/config.json
#COPY config.template.json /root/

COPY docker-entry.sh /root/
RUN chmod +x /root/docker-entry.sh
ENTRYPOINT ["/root/docker-entry.sh"]

EXPOSE 80
