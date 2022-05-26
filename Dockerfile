# Pull base image
FROM centos:6

LABEL org.opencontainers.image.source https://github.com/castisdev/docker-centos6

RUN sed -i -e 's/^mirrorlist/#mirrorlist/g' -e 's/^#baseurl=http:\/\/mirror.centos.org\/centos\/$releasever\//baseurl=http:\/\/vault.centos.org\/6.10\//g' /etc/yum.repos.d/CentOS-Base.repo

# Install EPEL repo
RUN yum install -y epel-release; yum -y clean all

RUN yum -y install http://opensource.wandisco.com/centos/6/git/x86_64/wandisco-git-release-6-1.noarch.rpm; yum -y clean all

# Install
RUN yum install -y \
  sudo \
  wget \
  gcc \
  gcc-c++ \
  make \
  unzip \
  openssl-devel \
  git \
  subversion \
  tar \
  boost-devel \
  boost-static \
  glibc-devel \
  libuuid-devel \
  gdb \
  valgrind \
  mysql-devel \
  postgresql93-devel \
  curl-devel \
  xz \
  file \
  vim-enhanced \
  unixODBC-devel \
  mysql-connector-odbc \
  sysstat \
  yum-utils \
  gperftools-devel \
  golang \
  ccache \
  libunwind-devel \
  patch \
  && yum -y clean all

# Install Intel TBB
RUN yum-config-manager -y --add-repo https://yum.repos.intel.com/tbb/setup/intel-tbb.repo \
  && yum install -y tbb-devel \
  && yum -y clean all

ADD install_devtoolset9.sh /script/
RUN /script/install_devtoolset9.sh
SHELL [ "scl", "enable", "devtoolset-9" ]

ADD install_cmake3232.sh /script/
RUN /script/install_cmake3232.sh

ADD install_libbacktrace.sh /script/
RUN /script/install_libbacktrace.sh

ADD install_boost179.sh /script/
RUN /script/install_boost179.sh
ENV Boost_DIR /usr/local/boost_1_79_0

ADD install_cryptopp860.sh /script/
RUN /script/install_cryptopp860.sh

ADD install_googletest1110.sh /script/
RUN /script/install_googletest1110.sh

ADD install_openssl102u.sh /script/
RUN /script/install_openssl102u.sh

ADD install_python2718.sh /script/
RUN /script/install_python2718.sh

ADD install_python3913.el6.sh /script/
RUN /script/install_python3913.el6.sh

ADD install_cpptools.sh /script/
RUN /script/install_cpptools.sh

ADD install_cppcheck28.sh /script/
RUN /script/install_cppcheck28.sh

ADD install_zsh59.el6.sh /script/
RUN /script/install_zsh59.el6.sh

ADD install_ninja1110.sh /script/
RUN /script/install_ninja1110.sh

ADD install_ffmpeg501.el6.sh /script/
RUN /script/install_ffmpeg501.el6.sh

ADD install_golang1182.sh /script/
RUN /script/install_golang1182.sh

ADD install_libwebp122.sh /script/
RUN /script/install_libwebp122.sh

ADD install_wrk420.sh /script/
RUN /script/install_wrk420.sh

ADD install_protobuf210.sh /script/
RUN /script/install_protobuf210.sh

# set timezone
RUN ln -snf /usr/share/zoneinfo/Asia/Seoul /etc/localtime

# ctail
RUN wget -O - https://raw.githubusercontent.com/castisdev/ctail/master/install.sh --no-check-certificate | bash

# Add root files
ADD .bashrc /root/.bashrc

# Set environment variables
ENV HOME /root
ENV PATH="${PATH}:${HOME}/go/bin:/usr/local/go/bin"

# Define default command
CMD ["scl", "enable", "devtoolset-9", "zsh"]
