#!/bin/bash
cd Pax-Academia
git fetch
git pull
source venv/bin/activate
python3.11 main.py