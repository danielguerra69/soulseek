#### Soulseek vnc service for docker

### Image Size

* [![Latest](https://badge.imagelayers.io/danielguerra/soulseek.svg)](https://imagelayers.io/?images=danielguerra/soulseek:latest 'latest') danielguerra/soulseek

### Usage

Start soulseek vnc server,  /Users/Music your sharing music map & /Users/Downloads your download map.

```bash
docker run --name=soulseek -v /Users/Music/:/home/soulseek/Music -v /Users/Downloads:/home/soulseek/Downloads -p 5900:5900 -d danielguerra/soulseek
```
& check
```bash
docker logs soulseek
```
After this use a vnc client to connect (dockerhost:5900)
Everything should start automaticly, if not try the following:

In your vnc session right click your mouse then choose install soulseek.
Click next next finish yes.
Right click again and choose start soulseek.
Login with your soulseek account.

In case this doesn't work choose xterm form the menu and type
/bin/bash
export TERM=xterm
export DISPLAY=":1"
wine /bin/SoulseekQt-2015-6-12.exe
wine ~/.wine/drive_c/Program\ Files\ \(x86\)/SoulseekQt/SoulseekQt.exe
