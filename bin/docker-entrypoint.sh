#!/bin/bash
echo soulseek | sudo -S chown -R soulseek:soulseek /home/soulseek
echo soulseek | sudo -S chmod -R a+r /home/soulseek
exec "$@"