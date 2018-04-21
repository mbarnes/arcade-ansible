This system is configured to automatically start the AttractMode
graphical menu system on bootup as follows:

/etc/systemd/system/getty@tty1.service.d/xinit.conf

  SystemD runs this configuration file when starting TTY1.
  It simply invokes xinit as user 'pi'.  (Note: the empty
  ExecStart= resets the command list since the service is
  configured to restart on failure.)

/home/pi/.xinitrc

  This shell script is processed by xinit as it starts.
  It simply invokes attract, thus starting the menu system.
