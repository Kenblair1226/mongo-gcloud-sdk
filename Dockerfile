FROM mongo:latest

MAINTAINER Ken Chen<blair1226@gmail.com>

RUN mkdir /maintain && \
    apt-get update && \
    apt-get install -y --no-install-recommends python openssl openssh-client ca-certificates libc6 unzip wget

# google cloud sdk 
RUN wget https://dl.google.com/dl/cloudsdk/channels/rapid/google-cloud-sdk.zip && unzip google-cloud-sdk.zip && rm google-cloud-sdk.zip
RUN google-cloud-sdk/install.sh --usage-reporting=true --path-update=true --bash-completion=true --rc-path=/.bashrc

COPY . /maintain

# Finalize
RUN mkdir /.ssh
ENV PATH $PATH:/google-cloud-sdk/bin  

ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 27017
CMD ["mongod"]
