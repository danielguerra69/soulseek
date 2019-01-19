#!/bin/bash
echo soulseek | sudo -S chown soulseek:soulseek /home/soulseek
exec "$@"