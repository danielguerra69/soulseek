#!/bin/bash
echo soulseek | sudo -S chown -r soulseek:soulseek /home/soulseek
echo soulseek | sudo -S chmod -r a+r /home/soulseek
exec "$@"