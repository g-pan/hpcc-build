#!/bin/bash

BINDIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
ROOTDIR=$( dirname "${BINDIR}")

# Detech Unix OS environment
distro=$(${BINDIR}/getpackagerevisionarch.sh | cut -d'_' -f 1)
echo "OS $distro"

# Setup base build environment
${ROOTDIR}/distros/${distro}.sh

# Setup plugin build environment

# Setup Document build environment

# Build
