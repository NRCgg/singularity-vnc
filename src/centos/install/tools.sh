#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install some common tools for further installation"
yum -y install epel-release 
# the metalink/mirrors seems to fail for me.  I just changed to baseurl
sed -i "s^metalink=https://mirrors.fedoraproject.org/metalink?repo=epel-7&arch=$basearch^baseurl=http://download.fedoraproject.org/pub/epel/7/$basearch^" /etc/yum.repos.d/epel.repo
yum -y update
yum -y install vim sudo wget which net-tools bzip2 numpy
yum clean all
