# Ansible Playbook for a MAME Arcade Cabinet
I own a cocktail-style arcade cabinet that runs a customized version of [MAME](https://www.mamedev.org/) on a [Raspberry Pi](https://www.raspberrypi.org/) computer.

The `init-arcade.yml` playbook aims to fully configure an SD card with a freshly installed [Raspbian](https://raspbian.org/) "Lite" operating system for use in my arcade cabinet.  The process includes creating a chroot environment to cross-compile custom software for the Raspberry Pi's ARMv7 CPU architecture.  The technique for doing so was heavily inspired by Midnight Yell's blog post "[Compiling MAME for the Raspberry Pi with QEMU](https://midnightyell.wordpress.com/2012/10/13/compiling-mame-for-the-raspberry-pi-with-qemu/)".

The playbook runs in three phases:
1. Prepare a local chroot environment
2. Build custom software for the ARMv7 CPU architecture
3. Configure hosts in an inventory group named "`arcade_group`"
