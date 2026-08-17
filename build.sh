#! /bin/bash
set -ex

cd `dirname $0`

uv pip install --index-url=https://mirrors.ivolces.com/pypi/simple \
    --extra-index-url=https://pypi.org/simple \
    -r requirements.txt --target ./site-packages