# Open VPN Pfsense Telegraf Metrics

<img src="https://i.imgur.com/QkrLt8J.png" width="150"> <img src="https://i.imgur.com/BwKT4Rl.png" width="50"> <img src="https://i.imgur.com/LBFSXIz.png" width="150">

The script is based on community work from:

https://forum.netgate.com/topic/151351/email-notification-openvpn-client-connect-common-name/78

## REQUIREMENTS

Pfsense

Telegraf package

Open VPN

## IMPLEMENTATION

In your Open VPN server custom options, you will need to add the following line: 

`client-disconnect /root/disconnect.sh`

Place the `disconnect.sh` script to `/root`.

Make the script executable (`chmod 555 disconnect.sh`).

Copy the contents of `disconnect.sh` in this repository to your new file.

In the Telegraf Additional Configuration box, add the contents of `telegraf.conf`.

Data should now be present to pull from InfluxDB.
