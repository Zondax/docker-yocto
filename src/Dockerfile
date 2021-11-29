#*******************************************************************************
#    (c) 2020 Zondax GmbH
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.
#*******************************************************************************
FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get -y install curl python-is-python3 locales sudo zsh gdisk

RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8
ENV LANG en_US.UTF-8

# Fix locale issues
RUN apt-get update && \
    apt-get -y install gawk wget git diffstat unzip texinfo gcc build-essential chrpath socat cpio python3 python3-pip python3-pexpect xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev pylint3 xterm python3-subunit mesa-common-dev zstd liblz4-tool lbzip2

RUN curl https://storage.googleapis.com/git-repo-downloads/repo > /usr/bin/repo && chmod a+x /usr/bin/repo

ADD install_user.sh /tmp/install_user.sh
ADD install_rust.sh /tmp/install_rust.sh

###################
RUN adduser --disabled-password --gecos "" -u 1000 zondax
RUN echo "zondax ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

RUN adduser --disabled-password --gecos "" -u 1001 zondax_circle
RUN echo "zondax_circle ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# RUN adduser --disabled-password --gecos "" -u 501 zondax_mac
# RUN echo "zondax_mac ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

WORKDIR /home/zondax
USER zondax
RUN /tmp/install_user.sh

WORKDIR /home/zondax_circle
USER zondax_circle
RUN /tmp/install_user.sh

# WORKDIR /home/zondax_mac
# USER zondax_mac
# RUN /tmp/install_user.sh

###################

# Toaster dependencies
EXPOSE 8000

ADD entrypoint.sh /tmp/entrypoint.sh
ENTRYPOINT ["/tmp/entrypoint.sh"]
