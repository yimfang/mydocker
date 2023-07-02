#!/bin/bash

# # Generate SSH keys
# ssh-keygen -t rsa -b 4096 -N "" -f ~/.ssh/id_rsa
# cat ~/.ssh/id_rsa.pub

# Create Docker Compose related alias / shortcuts
echo -e "\n# >>> my alias starts from here <<<" >> ${HOME}/.bashrc
echo "alias drmiall=\"docker rmi \$(docker images -f \"dangling=true\" -q)\"" >> ${HOME}/.bashrc
echo 'alias drmall="docker rm -f $(docker ps -aq)"' >> ${HOME}/.bashrc
echo 'alias drmv="docker volume prune"' >> ${HOME}/.bashrc
echo 'dat() { docker exec -it "$1" bash; }' >> ${HOME}/.bashrc
echo 'alias dcu="docker compose up -d"' >> ${HOME}/.bashrc
echo 'alias dcd="docker compose down"' >> ${HOME}/.bashrc
echo 'alias dcrmv="docker compose down --volumes"' >> ${HOME}/.bashrc
echo 'alias dcps="docker compose ps"' >> ${HOME}/.bashrc
echo 'alias dclogs="docker compose logs"' >> ${HOME}/.bashrc
echo 'export LANG=en_US.UTF-8' >> ${HOME}/.bashrc
echo "# >>> my alias ends here <<<" >> ${HOME}/.bashrc


# Source the .bashrc to apply changes
source ${HOME}/.bashrc
