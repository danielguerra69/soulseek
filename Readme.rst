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
Now you have to install soulseek, in your vnc session right
click your mouse then choose install soulseek.
Click next next finish yes.
Right click again and choose Soulseek.
Login with your soulseek account.
