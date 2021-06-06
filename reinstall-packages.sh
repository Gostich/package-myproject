#!/bin/bash

# this allow to see the output of `pip install`

pip uninstall -y -r requirements.txt
pip install -r requirements.txt -vvv --no-binary :none: --exists-action w  --src /pip-src/
