#!/bin/bash

CHROOT_PATH=$(realpath rootfs)

sudo ./safe-remove.yml -e cli_chroot_path=$CHROOT_PATH
