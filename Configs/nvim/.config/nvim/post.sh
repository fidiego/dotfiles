#!/usr/bin/bash

set -e
set -o pipefail
set -u

echo "nvim +PackerSync"
nvim +PackerSync
