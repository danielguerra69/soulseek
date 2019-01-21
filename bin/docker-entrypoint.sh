#!/bin/bash
echo soulseek | sudo -S chown -r soulseek:soulseek /home/soulseek
exec "$@"