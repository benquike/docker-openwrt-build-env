FROM debian:bullseye

ARG USER
ARG USER_ID
ARG GROUP_ID

RUN apt-get update &&\
    apt-get install -y \
        sudo time git-core subversion build-essential g++ bash make \
        libssl-dev patch libncurses-dev zlib1g-dev gawk \
        flex gettext wget unzip xz-utils cmake \
        python3 python3-distutils-extra python3-setuptools swig rsync curl \
        libsnmp-dev liblzma-dev libpam0g-dev cpio rsync gcc-multilib zsh \
	clang gcc-multilib g++-multilib

RUN    apt-get install -y software-properties-common lsb-release vim
RUN    apt-get clean


RUN groupadd -f -g ${GROUP_ID} ${USER} && \
    useradd -u ${USER_ID} -g ${GROUP_ID} -ms /usr/bin/zsh ${USER} && \
    usermod -aG sudo ${USER} && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers

USER ${USER}
WORKDIR /home/${USER}
