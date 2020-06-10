#!/bin/bash

yum-config-manager --add-repo http://mirror.centos.org/centos-7/7/os/x86_64

yum-config-manager --add-repo http://dl.fedoraproject.org/pub/epel/7/x86_64

yum-config-manager --add-repo http://build.openhpc.community/OpenHPC:/1.3/CentOS_7
yum install http://build.openhpc.community/OpenHPC:/1.3/CentOS_7/x86_64/ohpc-release-1.3-1.el7.x86_64.rpm
