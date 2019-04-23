#/bin/bash
# 1. download the rhel iso file in the current dir
# 2. run this script in the current dir. you will get src/ dir which contains all the related code comes with the release
mkdir -p iso_src
mkdir -p src
mount MLNX_OFED_LINUX*iso iso_src
cp iso_src/src/MLNX_OFED_SRC*tgz ./src
umount iso_src
rm -rf iso_src
cd src
tar xf MLNX_OFED_SRC*tgz; rm *MLNX_OFED_SRC*tgz -f
for frpm in `ls MLNX_OFED_SRC*/SRPMS/*rpm`
do
   rpm2cpio $frpm | cpio -div
done
rm *spec -f
for fgz in `ls *gz`
do
   tar xf $fgz
   rm -f $fgz
done
for fbz2 in `ls *bz2`
do
   tar xf $fbz2
   rm -f $fbz2
done
