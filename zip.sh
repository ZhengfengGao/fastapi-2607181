#! /bin/bash

set -ex

rm -f vefaas-native-python3.12-fastapi-default.zip
zip -r vefaas-native-python3.12-fastapi-default.zip . \
  -x "site-packages/*" \
  -x ".venv/*" \
  -x ".wheels/*" \
  -x "**/.DS_Store" \
  -x "**/__pycache__/*"
