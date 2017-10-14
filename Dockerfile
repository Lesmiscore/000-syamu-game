FROM ubuntu
MAINTAINER nao20010128nao

ADD server.groovy /root
EXPOSE 80
ENV LANG=en_US.UTF-8 LANGUAGE=en_US:en LC_ALL=en_US.UTF-8
CMD ["/root/.sdkman/candidates/groovy/current/bin/groovy","/root/server.groovy"]

RUN bash -c "\
    apt-get update && \
    apt-get install locales openjdk-8-jdk wget curl zip unzip sed -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    locale-gen --purge en_US.UTF-8 && \
    curl -s get.sdkman.io | bash && \
    source "$HOME/.sdkman/bin/sdkman-init.sh" && \
    sdk install groovy && \
    groovy -version \
"

#RUN bash -c "source $HOME/.sdkman/bin/sdkman-init.sh; which groovy"
