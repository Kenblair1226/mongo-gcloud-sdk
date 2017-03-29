FROM mongo:latest

MAINTAINER Ken Chen<blair1226@gmail.com>

RUN mkdir /db_utils && \
    apt-get update && \
    apt-get install -y --no-install-recommends python openssl openssh-client ca-certificates libc6 unzip wget cron

# google cloud sdk 
RUN wget https://dl.google.com/dl/cloudsdk/channels/rapid/google-cloud-sdk.zip && unzip google-cloud-sdk.zip && rm google-cloud-sdk.zip
RUN google-cloud-sdk/install.sh --usage-reporting=true --path-update=true --bash-completion=true --rc-path=/.bashrc

COPY . /db_utils

# Finalize
RUN mkdir /.ssh
ENV PATH $PATH:/google-cloud-sdk/bin  

CMD /db_utils/start.sh
