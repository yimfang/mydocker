#!/bin/bash

# Generate SSH keys
ssh-keygen -t rsa -b 4096 -N "" -f ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub

# Set a var to dir
ConfigDir=/root/myCodeLab/GitConfig

# Create several symlinks
ln -s ${ConfigDir}/tmux/.tmux.conf ${HOME}/.tmux.conf
ln -s ${ConfigDir}/.bin/tmux/tat ${HOME}/bin/tat
ln -s ${ConfigDir}/.bin/tmux/tkl ${HOME}/bin/tkl
ln -s ${ConfigDir}/.bin/tmux/tnew ${HOME}/bin/tnew
ln -s ${ConfigDir}/.bin/dev/pyservesg ${HOME}/bin/pyservesg
ln -s ${ConfigDir}/.bin/dev/scpray ${HOME}/bin/scpray
ln -s ${ConfigDir}/.bin/dev/sgpdb ${HOME}/bin/sgpdb
ln -s ${ConfigDir}/.bin/docker/dbash ${HOME}/bin/dbash
ln -s ${ConfigDir}/.bin/docker/drmrf ${HOME}/bin/drmrf
ln -s ${ConfigDir}/.bin/tmux/tsgs/tsg ${HOME}/bin/tsg

# Create Docker Compose related alias / shortcuts
echo "alias drmiall=\"docker rmi \$(docker images -f \"dangling=true\" -q)\"" >> ${HOME}/.bashrc
echo 'alias dcu="docker compose up -d"' >> ${HOME}/.bashrc
echo 'alias dcd="docker compose down"' >> ${HOME}/.bashrc
echo 'alias dcps="docker compose ps"' >> ${HOME}/.bashrc
echo 'alias dclogs="docker compose logs"' >> ${HOME}/.bashrc

# Source the .bashrc to apply changes
source ${HOME}/.bashrc
