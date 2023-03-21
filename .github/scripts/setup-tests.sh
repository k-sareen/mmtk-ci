#!/bin/bash

set -xe

. $(dirname "$0")/common.sh

# Download DaCapo
pip3 install gdown
mkdir -p $DACAPO_PATH
cd $DACAPO_PATH
gdown "https://drive.google.com/file/d/1j4bJkjxEZeUMSQY4JmQwaaQCo-lsQ3Gv/view?usp=share_link"
unzip dacapo-evaluation-git-04132797.zip

