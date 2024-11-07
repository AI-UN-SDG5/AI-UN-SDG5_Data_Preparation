#! /bin/bash

python3 -m venv .my-venv
source .my-venv/bin/activate
pip3 install -r requirements.txt
chmod 744 bash.sh
jupyter notebook data_preparation.ipynb