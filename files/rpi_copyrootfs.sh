#!/bin/bash
#
# Copied with minor modifications from:
# https://midnightyell.wordpress.com/2012/10/13/compiling-mame-for-the-raspberry-pi-with-qemu/
#

PATH=/sbin:${PATH}

set -e

usage()
{
cat <<EOF

  `basename $0`:

     Make a Raspberry Pi SD card image

       -h    : This help message
       -d    : Destination directory
       -i    : The name of the image file ( `basename ${IMGFILE}` )
       -v    : Turn on verbose output

EOF
}

while getopts “hi:d:v” OPTION
do
     case $OPTION in
         h)
             HELP_OPT=1
             ;;
         i)
             IMAGEFILE_OPT=$OPTARG
             ;;
         d)
             DESTDIR_OPT=$OPTARG
             ;;
         v)
             VERBOSE=1
             ;;
         ?)
             usage
             exit
             ;;
     esac
done

IMGFILE=${IMAGEFILE_OPT:-2019-07-10-raspbian-buster-lite.img}
DESTDIR=${DESTDIR_OPT:-rootfs}

if [ ! -z "${HELP_OPT:-}" ] ; then
    usage
    exit
fi

if [[ ${EUID} != 0 && ${UID} != 0 ]] ; then
    echo "$0 must be run as root"
    usage
    exit -1
fi

BYTES_PER_SECTOR=`fdisk -lu ${IMGFILE} | grep ^Units | awk '{print $8}'`
LINUX_START_SECTOR=`fdisk -lu ${IMGFILE} | grep ^${IMGFILE}2 | awk '{print $2}'`
LINUX_OFFSET=`expr ${LINUX_START_SECTOR} \* ${BYTES_PER_SECTOR}`

if [ ! -z "${DESTDIR}" ] ; then
    if [ ! -d ${DESTDIR} ] ; then
        mkdir -p ${DESTDIR}
    fi
    LINUXMOUNT="__linuxmnt.$$"
    mkdir -p ${LINUXMOUNT}
    mount -o loop,offset=${LINUX_OFFSET} ${IMGFILE} ${LINUXMOUNT}
    cd ${LINUXMOUNT};
    tar cf - * | ( cd ${DESTDIR}; tar xvf - )
    cd -
    umount ${LINUXMOUNT}
    rm -rf ${LINUXMOUNT}
fi
