#!/bin/bash

yum-config-manager --add-repo http://mirror.centos.org/centos-7/7.7.1908/os/x86_64
yum install http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum install http://build.openhpc.community/OpenHPC:/1.3/CentOS_7/x86_64/ohpc-release-1.3-1.el7.x86_64.rpm
