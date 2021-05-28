#!/bin/bash

IMAGE_FILE=$(realpath $(ls *.img | tail --lines 1))
CHROOT_PATH=$(realpath rootfs)

sudo ./init-arcade.yml -e cli_image_file=$IMAGE_FILE -e cli_chroot_path=$CHROOT_PATH -e cli_skip_build=true
