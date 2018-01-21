# Hadoop

localhost:2222 - ssh

ssh-keygen -t rsa -b 4096 -C "dvillaj@gmail.com"

wget https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh

git config --global user.name "Daniel Villanueva"
git config --global user.email dvillaj@gmail.com

conda create -n py36 python=3.6

source activate py36
source deactivate