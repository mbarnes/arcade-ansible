#!/bin/bash

CHROOT_PATH=$(realpath ${1:-arcade_rootfs})

sudo ./safe-remove.yml -e cli_chroot_path=$CHROOT_PATH
