#!/bin/bash

set -euo pipefail

chmod 400 ~/.ssh/id_*

ssh-add
