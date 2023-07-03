# Use the nvidia cuda12.2.0 base image with Ubuntu 20.04
FROM nvidia/cuda:12.2.0-devel-ubuntu20.04

# Set the maintainer: spacegoing/cudabase:latest
LABEL maintainer="spacegoing@July 2 2023"

# Update and upgrade Ubuntu packages
RUN apt-get update && apt-get upgrade -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    git \
    tmux \
    vim-tiny \
    python3-pip \
    wget \
    software-properties-common \
    openssh-server

# Emacs: add PPA for Emacs 28 and install
RUN add-apt-repository ppa:kelleyk/emacs && apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends emacs28
# Clone spacemacs config
RUN git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d && \
    mkdir /root/myCodeLab && \
    mkdir /root/myCodeLab/GitConfig && \
    git clone https://github.com/spacegoing/GitConfig.git /root/myCodeLab/GitConfig && \
    ln -s /root/myCodeLab/GitConfig/spacemacs ${HOME}/.spacemacs.d && \
    rm /root/myCodeLab/GitConfig/spacemacs/init.el && \
    ln -s /root/myCodeLab/GitConfig/spacemacs/.spacemacs.clean /root/myCodeLab/GitConfig/spacemacs/init.el
# Run Spacemacs in daemon mode and then kill it. This will cause it to install layers.
RUN emacs --daemon && emacsclient -e '(kill-emacs)'
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends ispell
# For emacs 28.2, fix org mode errors
RUN cd ~/.emacs.d; rm -rf elpa/develop/org-9* && \
    emacs --daemon && emacsclient -e '(kill-emacs)' && \
    echo "export TERM=xterm-256color" >> ~/.bashrc

# Install Mambaforge
RUN wget -q https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-Linux-x86_64.sh && \
    chmod +x Mambaforge-Linux-x86_64.sh && \
    ./Mambaforge-Linux-x86_64.sh -b -p $HOME/mambaforge && \
    rm Mambaforge-Linux-x86_64.sh
# Set path to conda
ENV PATH /root/mambaforge/bin:$PATH

# Python Env Commands: ray + pytorch1.13
# pytorch 1.13: https://pytorch.org/get-started/previous-versions/
# https://github.com/pytorch/pytorch/wiki/PyTorch-Versions
RUN /bin/bash -c "source $HOME/mambaforge/etc/profile.d/conda.sh && mamba install -y tensorboard"
RUN /bin/bash -c "source $HOME/mambaforge/etc/profile.d/conda.sh && mamba install -y pytorch==1.13.1 torchvision==0.14.1 torchaudio==0.13.1 pytorch-cuda=11.7 -c pytorch -c nvidia"

# # Setting Properties
# Configure Git
RUN git config --global user.name "spacegoing" && \
    git config --global user.email "spacegoing@gmail.com"

# Config Spacemacs: LSP
RUN /bin/bash -c "source $HOME/mambaforge/etc/profile.d/conda.sh && pip install Ipython python-lsp-server[all] importmagic epc"

# Initialize mamba in your shell.
RUN /bin/bash -c "source $HOME/mambaforge/etc/profile.d/conda.sh && mamba init"

# Clean up
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# docker build -t spacegoing/cudabase:latest .
# docker run --gpus all --shm-size=10.24gb -it --rm -v $(pwd)/test:/root/myCodeLab/test spacegoing/cudabase:latest bash
# Set the working directory
WORKDIR /root/myCodeLab
