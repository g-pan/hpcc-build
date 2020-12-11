DEBIAN_FRONTEND=noninteractive
UCF_FORCE_CONFFNEW=true
export UCF_FORCE_CONFFNEW DEBIAN_FRONTEND

sudo  rm -rf /var/lib/apt/lists/*
sudo apt-get clean
sudo apt-get update

echo "Installing HPCC build prerequisites"
sudo apt-get install -y unzip
sudo apt-get install -y \
                 g++                   \
                 gcc                   \
                 curl                  \
                 libfreetype6-dev      \
                 zip                   \
                 make                  \
                 --fix-missing         
sudo apt-get install -y \
                 git                   \
                 build-essential       \
                 binutils-dev          \
                 libldap2-dev          \
                 libcppunit-dev        \
                 libicu-dev            \
                 libxslt1-dev          \
                 zlib1g-dev            \
                 --fix-missing   

sudo apt-get install -y \
                 libboost-regex-dev    \
                 libarchive-dev        \
                 libv8-dev             \
                 openjdk-8-jdk         \
                 libapr1-dev           \
                 libaprutil1-dev       \
                 libiberty-dev         \
                 libhiredis-dev        \
                 libtbb-dev            \
                 libxalan-c-dev        \
                 libnuma-dev           \
                 libevent-dev          \
                 libsqlite3-dev        \
                 libmemcached-dev      \
                 libboost-thread-dev   \
                 libboost-filesystem-dev \
                 libmysqlclient-dev    \
                 --fix-missing       

sudo apt-get install -y \
                 libtool               \
                 autotools-dev         \
                 automake              \
                 m4                    \
                 fop                   \
                 xsltproc              \
                 libsaxonb-java        \
                 libatlas-base-dev     \
                 libbsd-dev     \
                 tree           \
                --fix-missing     

#libssl-dev            \
sudo dpkg-reconfigure libc6 && \
export DEBIAN_FRONTEND=noninteractive && \
sudo -E apt-get -q --option "Dpkg::Options::=--force-confold" --assume-yes install libssl-dev

sudo apt-get install -y python2.7-dev --fix-missing
sudo apt-get install -y python3-dev --fix-missing
sudo apt-get install -y libgtk2.0-dev --fix-missing
sudo apt-get install -y libcurl4-gnutls-dev --fix-missing
sudo apt-get install -y bison --fix-missing
sudo apt-get install -y flex --fix-missing

echo "Installing Nodejs"
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs

echo "Installing R"
sudo apt-get install -y r-base r-cran-rcpp
export RInside_package=RInside_0.2.14.tar.gz
wget https://cran.r-project.org/src/contrib/Archive/RInside/${RInside_package}
sudo R CMD INSTALL ${RInside_package}
rm -rf ${RInside_package}

echo "Get expected CMake"
export cmake_version=3.13.1
export cmake_name=cmake-${cmake_version}-Linux-x86_64
wget https://github.com/Kitware/CMake/releases/download/v${cmake_version}/${cmake_name}.tar.gz
tar -zxf ${cmake_name}.tar.gz
rm -rf ${cmake_name}.tar.gz
#cd ${cmake_name}
#./bootstrap
#make && sudo make install
#cd ..
sudo cp -r ${cmake_name}/* /usr/local/
rm -rf ${cmake_name}

