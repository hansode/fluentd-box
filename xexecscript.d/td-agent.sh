#!/bin/bash
#
# requires:
#  bash
#
set -e

declare chroot_dir=$1

cat <<'EOS' > $1/etc/yum.repos.d/td.repo
[treasuredata]
name=TreasureData
baseurl=http://packages.treasure-data.com/redhat/$basearch
gpgcheck=0
EOS

chroot $1 $SHELL <<'EOS'
  yum repolist
  yum install -y td-agent
EOS
