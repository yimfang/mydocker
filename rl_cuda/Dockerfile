FROM spacegoing/cudabase:latest

# Set the maintainer: spacegoing/cuda_rl:latest
LABEL maintainer="spacegoing@July 3 2023"

# Python packages
RUN /bin/bash -c "source $HOME/mambaforge/etc/profile.d/conda.sh && \
    mamba install -y tianshou -c conda-forge"

# Copy your script into the container
# Add /usr/bin to PATH and create it if it doesn't exist
RUN mkdir -p /root/bin && echo 'export PATH="$PATH:/root/bin"' >> ~/.bashrc

# bash init_container.sh when first login to container
COPY init_script_v1.sh /root/myCodeLab/init_script_v1.sh
RUN chmod +x /root/myCodeLab/init_script_v1.sh

# docker build -t spacegoing/rl_cuda:latest .
WORKDIR /root/myCodeLab
