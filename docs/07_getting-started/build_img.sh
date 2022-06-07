#!/bin/bash
# Build a linux image with petalinux 2020.2 for FRED-based designs

############################################################
# Check petalinux version                                  #
############################################################
peta_ver=$PETALINUX_VER
if [[ "$peta_ver" != "2020.2" ]]
then
    echo
    echo "WARNINIG: Expecting petalinux 2020.2. The process is not tested with other versions..."
    echo
fi

############################################################
# Help                                                     #
############################################################
Help()
{
   echo "Build a linux image with petalinux 2020.2 for FRED-based designs."
   echo
   echo "Syntax: ./build_img.sh [-h|p|b|c|r|d]"
   echo "options:"
   echo "h     Print this Help."
   echo "p     Petalinux project name. Mandatory."
   echo "b     The BSP file related to the target board and the expected petalinux version. Mandatory."
   echo "c     Petalinux configuration file. Mandatory."
   echo "r     A directory with Petalinux downloads and sstate-cache directory. Optional."
   echo "d     Path of the fred.tar.gz file with a pre-built DART design. Optional."
   echo
}

if [[ ${#} -eq 0 ]]; then
   Help
fi

# variables with input argments
proj_name=""
bsp_file=""
defconf_file=""
sstate_dir=""
dart_prj=""

############################################################
# Process the input options. Add options as needed.        #
############################################################
# Get the options
while getopts ":hp:b:c:r:d:" option; do
   case $option in
      h) # display Help
         Help
         exit;;
      p) # Enter the petalinux project name
         proj_name=$OPTARG;;
      b) # The BSP file related to the target board
         bsp_file=$OPTARG;;
      c) # petalinux configuration file
         defconf_file=$OPTARG;;
      r) # petalinux directory with downloads and sstate-cache dir
         sstate_dir=$OPTARG;;
      d) # dart project in the format fred.tar.gz
         dart_prj=$OPTARG;;
     \?) # Invalid option
         echo "ERROR: Invalid option: -${OPTARG}."
         exit;;
   esac
done

# check for the 3 mandatory arguments
if [[ $proj_name == "" ]]
then
   echo "ERROR: -p argument is mandatory"
   echo
   Help
   exit
fi

if [[ "$bsp_file" == "" ]]
then
   echo "ERROR: -b argument is manatory"
   echo
   Help
   exit
fi

if [[ "$defconf_file" == "" ]]
then
   echo "ERROR: -c arguments is mandatory"
   echo
   Help
   exit
fi

# create the petalinux project
petalinux-create -t project -s $bsp_file -n $proj_name
# when a fred.tar.gz file is placed in the root of a petalinux project, it is
# extracted and placed in /opt/fredsys in the Linux images
if [[ "$dart_prj" != "" ]]
then
    cp $dart_prj $proj_name
fi
cd $proj_name
mkdir -p components/ext_source
cd components/ext_source
git clone https://github.com/fred-framework/meta-fred.git
git clone https://github.com/fred-framework/meta-retis.git
cd ../..
cp $defconf_file project-spec/configs/config
petalinux-config --silentconfig
# If downloads and sstate-cache is generated previously, it is possible to reuse them
# and save time in the next Linux image generation
# If you have built this image more than once, you could reuse the packages downloaded
# and compiled previouly, reducing the time to build the image.
# However, if this is the first time you run this script, then dont specify the 4th parameter
if [[ -d $sstate_dir/downloads ]] && [[ -d $sstate_dir/sstate-cache ]]
then
    cd build/
    ln -s $sstate_dir/downloads .
    ln -s $sstate_dir/sstate-cache .
    cd ..
fi
petalinux-build -c retis-dev-image
cd images/linux
petalinux-package --boot --force --fsbl zynqmp_fsbl.elf --fpga system.bit --pmufw pmufw.elf --atf bl31.elf --u-boot u-boot.elf
