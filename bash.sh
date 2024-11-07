#! /bin/bash

python3 -m venv .venv
source .venv/bin/activate
pip3 install -r requirements.txt
chmod 744 bash.sh
jupyter nbconvert --to notebook --execute data_preparation.ipynb --output data_preparation.ipynb