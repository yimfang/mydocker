FROM spacegoing/cudabase:latest

# Set the maintainer: spacegoing/cuda_rl:latest
LABEL maintainer="spacegoing@July 2 2023"

# Python packages
RUN /bin/bash -c "source $HOME/mambaforge/etc/profile.d/conda.sh && \
    mamba install -y tianshou -c conda-forge"

# Copy your script into the container
# Add /usr/bin to PATH and create it if it doesn't exist
RUN mkdir -p /root/bin && echo 'export PATH="$PATH:/root/bin"' >> ~/.bashrc

# bash init_container.sh when first login to container
COPY init_script.sh /root/myCodeLab/init_script.sh
RUN chmod +x /root/myCodeLab/init_script.sh

WORKDIR /root/myCodeLab
