FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive

# 安裝 command line tool，當想到某些常用的工具時可以加進來
RUN apt update
RUN apt install -y sudo
RUN apt install -y gcc
RUN apt install -y g++
RUN apt install -y gdb
RUN apt install -y git
RUN apt install -y ruby-dev
RUN apt install -y vim-gtk3
RUN apt install -y fish
RUN apt install -y glibc-source
RUN apt install -y make
RUN apt install -y gawk
RUN apt install -y bison
RUN apt install -y libseccomp-dev
RUN apt install -y tmux
RUN apt install -y wget
RUN apt install -y curl
RUN apt install -y netcat
RUN apt install -y net-tools
RUN apt install -y python3-pip
RUN apt install -y php
RUN apt install -y nodejs
RUN apt install -y sqlmap
RUN apt install -y sagemath

# compile glibc-2.31, 這邊是 pwn 第三週上課內容提到的東西
#RUN cd /usr/src/glibc && \
#    tar xvf glibc-2.31.tar.xz && \
#    mkdir glibc_dbg && \
#    cd glibc_dbg && \
#    ../glibc-2.31/configure --prefix $PWD --enable-debug && \
#    make -j4

# install pwndbg
RUN git clone https://github.com/pwndbg/pwndbg ~/pwndbg && \
    cd ~/pwndbg && \
    ./setup.sh

# install pwngdb
RUN git clone https://github.com/scwuaptx/Pwngdb.git ~/Pwngdb && \
    cat ~/Pwngdb/.gdbinit >> ~/.gdbinit && \
    sed -i "s/source ~\/peda\/peda.py//g" ~/.gdbinit

# 安裝 python3 套件，當想到某些常用的套件時可以加進來
RUN pip3 install pwntools pycryptodome flask django

RUN gem install seccomp-tools one_gadget
RUN ln -s /usr/local/lib/python3.10/dist-packages/bin/ROPgadget /bin/ROPgadget
CMD ["/bin/fish"]