# MapR Data Science Refinery - Customization
#
# VERSION 0.1 - for demo purposes only

# Create a new container based on the latest version of MapR Data Science Refinery
FROM maprtech/data-science-refinery

# Example for using a specific version of the MapR Data Science Refinery:
# FROM maprtech/data-science-refinery:v1.3_6.1.0_6.0.0_centos7

# Add additional components, for example:

# Flann and Gtk+
RUN yum install -y flann gtk+

# Python 3.7.0
RUN yum install -y gcc openssl-devel bzip2-devel  libffi-devel && \
    wget https://www.python.org/ftp/python/3.7.0/Python-3.7.0.tgz && \
    tar xzf Python-3.7.0.tgz && \
    ./Python-3.7.0/configure --enable-optimizations && \
    make altinstall

# Anaconda
RUN yum install -y bzip2 && \
    wget https://repo.continuum.io/archive/Anaconda3-5.3.0-Linux-x86_64.sh && \
    bash Anaconda3-5.3.0-Linux-x86_64.sh -b -p /opt/anaconda && \
    export PATH=/opt/anaconda/bin:$PATH
