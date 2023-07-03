FROM spacegoing/rl_cuda:latest

# DDPO Goes Here:
# # Set the maintainer: spacegoing/cuda_rl:latest
# LABEL maintainer="spacegoing@July 2 2023"

# # Python packages
# RUN /bin/bash -c "source $HOME/mambaforge/etc/profile.d/conda.sh && \
#     mamba install -y gymnasium-all tianshou -c conda-forge"

# # Copy your script into the container
# # Add /usr/bin to PATH and create it if it doesn't exist
# RUN mkdir -p /root/bin && echo 'export PATH="$PATH:/root/bin"' >> ~/.bashrc

# docker build -t spacegoing/rl_cuda:latest .
# docker run --gpus all -it --rm -v $(pwd)/host/test:/root/myCodeLab/test spacegoing/rl_cuda:latest bash

WORKDIR /root/myCodeLab
