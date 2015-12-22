#### Soulseek vnc service for docker

### Image Size

* [![Latest](https://badge.imagelayers.io/danielguerra/soulseek.svg)](https://imagelayers.io/?images=danielguerra/soulseek:latest 'latest') danielguerra/soulseek

### Usage

Start soulseek vnc server,  /Users/Music your sharing music map & /Users/Downloads your download map.

```bash
docker run --name=soulseek -v /Users/Music/:/home/soulseek/Music -v /Users/Downloads:/home/soulseek/Soulseek\ Downloads -p 5900:5900 -d danielguerra/soulseek
```
& check
```bash
docker logs soulseek
```
After this use a vnc client to connect (dockerhost:5900)
login with your soulseek account
