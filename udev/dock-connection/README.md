# dock-connection.sh

This script is triggered when a Lenovo USB-C dock audio device is connected and disconnected.

## What it does

Currently all it does is it stops and masks the `fprintd` service so that a fingerprint is not needed for authentication when connected to a (Lenovo) docking station.

## How to use

1. Create a new file: `/etc/udev/rules.d/80-local.rules` and copy the contents of [80-local.rules](../80-local.rules) to it.

2. Create the actual script: `/usr/local/bin/dock-connection.sh` and copy the contents of [dock-connection.sh](dock-connection.sh) to it.

3. Make the script executable and reload `udev`
    ```Bash
    sudo chmod +x /usr/local/bin/dock-connection.sh
    sudo udevadm control --reload
    ```

4. Connect a (Lenovo) dock and try it out, if it does not work, restart the laptop and try again. `udev` reload does not always work.

## Debugging

Logs can be found using:
```Bash
sudo journalctl -xef | grep -E 'dock|fprintd)'
```

## Sources
[This opensource.com article on udev](https://opensource.com/article/18/11/udev)

[This Stack Exchange thread in particular on how to disable fprintd](https://unix.stackexchange.com/questions/678609/how-to-disable-fingerprint-authentication-when-laptop-lid-is-closed)