#!/bin/bash

BINDIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
ROOTDIR=$( dirname "${BINDIR}")

# Detech Unix OS environment
distro=$(${BINDIR}/getpackagerevisionarch.sh | cut -d'_' -f 1)
echo "OS $distro"

# Setup base build environment
${ROOTDIR}/distros/${distro}.sh


# Build
#if [ -n ${INPUT_BUILD_CATEGORY} ]
#then
#  echo "Build $INPUT_BUILD_CATEGORY ..."
#  pushd ${ROOTDIR}/builds/${INPUT_BUILD_CATEGORY}
#  ./build.sh
#fi 