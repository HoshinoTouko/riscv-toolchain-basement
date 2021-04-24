FROM debian:buster

ENV DEBIAN_FRONTEND noninteractive
ENV ORB_PORT=10000
ENV TANGO_HOST=127.0.0.1:${ORB_PORT}
ENV HOME=/workshop

RUN set -ex

RUN apt update
RUN apt install -y sudo git
RUN apt install -y tango-common
RUN apt install -y autoconf automake autotools-dev curl libmpc-dev libmpfr-dev libgmp-dev gawk build-essential bison flex texinfo gperf libtool patchutils bc zlib1g-dev libexpat-dev
RUN apt install -y autoconf automake autotools-dev curl libmpc-dev libmpfr-dev libgmp-dev libusb-1.0-0-dev gawk build-essential bison flex texinfo gperf libtool patchutils bc zlib1g-dev device-tree-compiler pkg-config libexpat-dev

# dirs
RUN mkdir $HOME
RUN mkdir $HOME/riscv
RUN mkdir $HOME/source
WORKDIR $HOME/source

RUN git clone --recursive https://github.com/riscv/riscv-gnu-toolchain.git
RUN git clone --recursive https://github.com/riscv/riscv-tools

CMD [ "bash" ]
