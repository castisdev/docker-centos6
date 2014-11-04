# Pull base image
FROM centos:centos6

# Install EPEL repo
RUN rpm -ivh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm

# Install
RUN \
  yum install -y sudo wget gcc gcc-c++ make unzip openssl openssl-devel tar;\
  yum install -y git cppcheck;\
  yum install -y tar libuuid-devel;\
  yum -y clean all

ADD ./install_cmake30.sh /script/
RUN /script/install_cmake30.sh

ADD ./install_devtoolset2.sh /script/
RUN /script/install_devtoolset2.sh

ADD ./install_boost156.sh /script/
RUN /script/install_boost156.sh

ENV PATH /opt/rh/devtoolset-2/root/usr/bin/:$PATH
ENV BOOST_ROOT /usr/local/boost156

ADD ./install_cryptopp.sh /script/
RUN /script/install_cryptopp.sh

ADD ./install_gmock170.sh /script/
RUN /script/install_gmock170.sh

ADD ./install_cpptools.sh /script/
RUN /script/install_cpptools.sh

# Add root files
ADD ./.bashrc /root/.bashrc

# Set environment variables
ENV HOME /root

# Define default command
CMD ["bash"]

