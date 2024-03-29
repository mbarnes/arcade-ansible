# Ansible Playbook for a MAME Arcade Cabinet
I own a cocktail-style arcade cabinet that runs a customized version of [MAME](https://www.mamedev.org/) on a [Raspberry Pi 4 Model B](https://www.raspberrypi.com/products/raspberry-pi-4-model-b/specifications/) computer.

The `init-arcade.yml` playbook aims to fully configure an SD card with a freshly imaged 32-bit [Raspberry Pi OS Lite](https://www.raspberrypi.com/software/) for use in my arcade cabinet.  The process includes creating a chroot environment to cross-compile custom software for the Raspberry Pi's ARM v8 CPU architecture.  The technique for doing so was heavily inspired by Midnight Yell's blog post "[Compiling MAME for the Raspberry Pi with QEMU](https://midnightyell.wordpress.com/2012/10/13/compiling-mame-for-the-raspberry-pi-with-qemu/)".

The playbook runs in three phases:
1. Prepare a local chroot environment
2. Build custom software for the Raspberry Pi's CPU architecture
3. Configure hosts in an inventory group named "`arcade_group`"
