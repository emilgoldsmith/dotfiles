#!/bin/bash

set -euo pipefail

chmod 400 ~/.ssh/id_rsa*

ssh-add
