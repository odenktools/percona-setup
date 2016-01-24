#!/usr/bin/env bash
sudo apt-get update
sudo apt-key adv --keyserver keys.gnupg.net --recv-keys 1C4CBDCDCD2EFD2A
echo "deb http://repo.percona.com/apt `lsb_release -cs` main" >> /etc/apt/sources.list.d/percona.list
echo "deb-src http://repo.percona.com/apt `lsb_release -cs` main" >> /etc/apt/sources.list.d/percona.list
sudo apt-get update
sudo apt-get install -y percona-xtradb-cluster-55 percona-xtradb-cluster-client-5.5 percona-xtradb-cluster-galera-2.x percona-xtrabackup percona-toolkit
sudo mysql -e "CREATE FUNCTION fnv1a_64 RETURNS INTEGER SONAME 'libfnv1a_udf.so'"
sudo mysql -e "CREATE FUNCTION fnv_64 RETURNS INTEGER SONAME 'libfnv_udf.so'"
sudo mysql -e "CREATE FUNCTION murmur_hash RETURNS INTEGER SONAME 'libmurmur_udf.so'"

## https://www.percona.com/downloads/Percona-XtraDB-Cluster/Percona-XtraDB-Cluster-5.5.41-25.11/binary/debian/trusty/x86_64/Percona-XtraDB-Cluster-5.5.41-25.11-r853-trusty-x86_64-bundle.tar