#!/bin/bash
set -ex

yum install -y "http://yum.enterprisedb.com/edbrepos/edb-repo-latest.noarch.rpm"
yum update -y

#install RPM
rpm -Uvh edb-repo-9.6-x.noarch.rpm

#enable repositories
sed '/\[edbas96\]/,/enabled=0/ { s/enabled=0/enabled=1/ }' edb.repo
sed '/\[edbas96\]/,/\<username\>/ { s/\<username\>/%edbuser%/ }' edb.repo
sed '/\[edbas96\]/,/\<password\>/ { s/\<password\>/%edbpwd%/ }' edb.repo
sed '/\[edbas96\]/,/gpgcheck=1/ { s/gpgcheck=1/gpgcheck=0/ }' edb.repo

#enterprisedb-tools edits
sed '/\[enterprisedb-tools\]/,/enabled=0/ { s/enabled=0/enabled=1/ }' edb.repo
sed '/\[enterprisedb-tools\]/,/\<username\>/ { s/\<username\>/%edbuser%/ }' edb.repo
sed '/\[enterprisedb-tools\]/,/\<password\>/ { s/\<password\>/%edbpwd%/ }' edb.repo
sed '/\[enterprisedb-tools\]/,/gpgcheck=1/ { s/gpgcheck=1/gpgcheck=0/ }' edb.repo

#enterprisedb-dependencies edits
sed '/\[enterprisedb-dependencies\]/,/enabled=0/ { s/enabled=0/enabled=1/ }' edb.repo
sed '/\[enterprisedb-dependencies\]/,/\<username\>/ { s/\<username\>/%edbuser%/ }' edb.repo
sed '/\[enterprisedb-dependencies\]/,/\<password\>/ { s/\<password\>/%edbpwd%/ }' edb.repo
sed '/\[enterprisedb-dependencies\]/,/gpgcheck=1/ { s/gpgcheck=1/gpgcheck=0/ }' edb.repo

yum install -y edb-as96


