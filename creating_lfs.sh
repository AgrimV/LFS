#!/bin/bash

mkdir -v $LFS/sources
chmod -v a+wt $LFS/sources

wget --input-file=wget-list --continue --directory-prefix=$LFS/sources

mkdir -pv $LFS/{bin,etc,lib,sbin,usr,var,tools}
case $(uname -m) in
  x86_64) mkdir -pv $LFS/lib64 ;;
esac

groupadd lfs
useradd -s /bin/bash -g lfs -m -k /dev/null lfs

echo "Password For LFS User"
passwd lfs

chown -v lfs $LFS/{usr,lib,var,etc,bin,sbin,tools}
case $(uname -m) in
  x86_64) chown -v lfs $LFS/lib64 ;;
esac
chown -v lfs $LFS/sources

su - lfs
