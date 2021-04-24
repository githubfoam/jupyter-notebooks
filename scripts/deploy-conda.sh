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

conda env create -n ~venv-basic-anomaly-detection python=$PYTHON_VERSION  -f conda_environment.yml
source activate ~venv-basic-anomaly-detection

py.test

deactivate
echo "========================================================================================="
