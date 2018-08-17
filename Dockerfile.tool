FROM debian:stretch

VOLUME ["/work"]

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN set -eux \
    &&  apt-get update \
    &&  apt-get install -y linux-image-amd64 \
    &&  apt-get upgrade -y \
    &&  apt-get install -y \
              linux-headers-`uname -r` \
              dkms \
              apt-transport-https \
              ca-certificates \
              curl \
              dirmngr \
              debootstrap \
              gnupg2 \
              software-properties-common \
    &&  curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add - \
    # Verify that the key ID is 9DC8 5822 9FC7 DD38 854A E2D8 8D81 803C 0EBF CD88
    &&  apt-key fingerprint 0EBFCD88 \
    &&  echo "deb [arch=amd64] https://download.docker.com/linux/debian \
            $(lsb_release -cs) \
            stable" | tee /etc/apt/sources.list.d/docker.list \
    &&  apt-get update \
    &&  apt-get install -y docker-ce \
    &&  apt-get clean \
    &&  rm -rf /var/lib/apt/lists/*

SHELL ["/bin/sh", "-c"]

COPY init_tool.sh /root/init.sh

ENTRYPOINT ["sh", "/root/init.sh"]
CMD ["all"]
