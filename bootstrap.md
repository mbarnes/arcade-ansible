# How to Bootstrap an SD Card for Raspberry Pi

- Build and install `rpi-imager.deb` from source:
  https://github.com/raspberrypi/rpi-imager

- Start Raspberry Pi Imager
  - Choose Raspberry Pi OS (other) -> Raspberry Pi OS Lite (32-bit)
  - Choose SD Card device
  - Write

- Mount the `/boot` partition of the SD Card.

- Touch `/boot/ssh` (empty file)

- Create `/boot/wpa_supplicant.conf` and paste in:
  ```
  ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
  update_config=1
  country=US

  network={
   ssid="<Name of your wireless LAN>"
   psk="<Password for your wireless LAN>"
  }
  ```

  Hint: Use `wpa_passphrase` to generate an encoded psk.

- Insert SD Card in Rasperry Pi and boot to login prompt.
  - Filesystem will be resized to SD Card automatically.
  - Default user is "pi", password "raspberry"

- Run `sudo raspi-config` and set localization.
  - L1 Locale
  - L2 Timezone
  - L3 Keyboard

- From another machine, copy my SSH public key:
  ```
  $ ssh-copy-id pi@ARCADE_HOST
  ```

- Disable password authentication in `/etc/ssh/sshd_config`:
  ```
  PasswordAuthentication no
  ```


## Troubleshooting

### Wireless LAN

- Check connection: `ifconfig wlan0`
- Scan for networks: `sudo iwlist wlan0 scan`
- Reconfigure interface: `wpa_cli -i wlan0 reconfigure`

- Static IP configuration, in case of DHCP problems:
  Add to `/etc/dhcpcd.conf`:
  ```
  interface wlan0
  static ip_address=192.168.1.X/24
  static routers=192.168.1.1
  static domain_name_servers=192.168.1.1
  ```
