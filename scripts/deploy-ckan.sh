#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace
# set -eox pipefail #safety for script

echo "========================================================================================="

apt-get -qq update

wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh;

bash miniconda.sh -b -p $HOME/miniconda
export PATH="$HOME/miniconda/bin:$PATH"
hash -r

conda config --set always_yes yes --set changeps1 no
conda update -q conda
conda info -a

export PYTHON_VERSION="3.7"  
echo $PYTHON_VERSION

conda env create -n ~venv-ckan python=$PYTHON_VERSION  -f conda_environment.yml
source activate ~venv-ckan

apt-get -qq update
docker-compose --version

git clone https://github.com/okfn/docker-ckan
cd docker-ckan

cp .env.example .env

#docker without sudo
usermod -aG docker $USER

#Change the storage directory ownership from root to ckan
echo "RUN mkdir -p /var/lib/ckan/storage/uploads" | sudo tee -a ckan/Dockerfile.dev
echo "RUN chown -R ckan:ckan /var/lib/ckan/storage" | sudo tee -a ckan/Dockerfile.dev
cat ckan/Dockerfile.dev

docker-compose -f docker-compose.dev.yml up --build &
jobs -l 
sleep 15

docker-compose -f docker-compose.dev.yml ps # Lists containers.
sleep 10

docker-compose images #List images used by the created containers
docker-compose logs

# netstat -tunlp | grep 5000
# curl http://localhost:5000

conda deactivate
echo "========================================================================================="
