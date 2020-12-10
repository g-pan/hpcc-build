#! /bin/bash

BUILDDIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

github_branch=master
[ -n ${INPUT_GITHUB_BRANCH} ] && github_branch=${INPUT_GITHUB_BRANCH}

github_user=hpcc-systems
[ -n ${INPUT_GITHUB_USER} ] && github_user=${INPUT_GITHUB_USER}

git clone https://github.com/${github_user}/HPCC-Platform
cd HPCC-Platform
git fetch origin && \
    git checkout ${github_branch} && \
    git submodule update --init --recursive

cd ../ &&  mkdir -p build  && cd build

cmake -G "Unix Makefiles" -D CMAKE_BUILD_TYPE=Release -DMAKE_DOCS_ONLY=ON \
  -DUSE_NATIVE_LIBRARIES=ON  -DDOCS_AUTO=ON -DDOC_LANGS=ALL ../HPCC-Platform

make -j4


