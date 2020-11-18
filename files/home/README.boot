This system is configured to automatically start the AttractMode
graphical menu system on bootup as follows:

/etc/systemd/system/getty@tty1.service.d/attract.conf

  SystemD runs this configuration file when starting TTY1.
  It simply invokes /usr/local/bin/attract as user 'pi' to
  start the menu system.

  (Note: the empty ExecStart= resets the command list since
  the service is configured to restart on failure.)
