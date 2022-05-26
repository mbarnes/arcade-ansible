#!/bin/bash

IMAGE_FILE=$(realpath ${1:-$(ls *.img | tail -n 1)})
CHROOT_PATH=$(realpath ${2:-arcade_rootfs})

sudo ./init-arcade.yml -e cli_image_file=$IMAGE_FILE -e cli_chroot_path=$CHROOT_PATH
