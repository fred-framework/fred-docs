#!/bin/sh

proj_name=$1
bsp_file=$2
defconf_file=$3

petalinux-create -t project -s $bsp_file -n $proj_name
cd $proj_name
mkdir -p components/ext_source
cd components/ext_source
git clone https://github.com/fred-framework/meta-fred.git
git clone https://github.com/fred-framework/meta-retis.git
cd ../..
cp $defconf_file project-spec/configs/config
petalinux-config --silentconfig 
cd build/
ln -s /ssd/work/petalinux/2020.2/shared/zynqmp/downloads .
ln -s /ssd/work/petalinux/2020.2/shared/zynqmp/sstate-cache .
cd ..
petalinux-build -c retis-dev-image
cd images/linux
petalinux-package --boot --force --fsbl zynqmp_fsbl.elf --fpga system.bit --pmufw pmufw.elf --atf bl31.elf --u-boot u-boot.elf
