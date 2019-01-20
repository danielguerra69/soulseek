### Soulseek vnc service for docker

![Soulseek-logo](http://www.slsknet.org/news/sites/default/files/slsk_bird.jpg)


## Usage

Start [Soulseek](http://www.slsknet.org/) vnc server,  /Users/Music your sharing music map & /Users/Downloads your download map.

```
$ docker run \
    --name=soulseek \
    -v /Users/Music:/home/soulseek
    -p 5900:5900 \
    -d \
    danielguerra/soulseek
```

NEW!

Or if you have enough resources use the new Remote Desktop version.
You can connect with a RDP client to port 3389. The xrdp provides sound
and you can play music with vlc.

* WARNING: use the --shm-size 1g or firefox will crash

```
$ docker run \
    --name=soulseek \
    -v /Users/Music:/home/soulseek \
    --shm-size 1g \
    -p 3389:3389 \
    -d \
    danielguerra/soulseek:xrdp
```


and check:
```
$ docker logs soulseek
```

After this use a vnc client to connect (dockerhost:5900)
Everything should start automaticly, Click Ok, next next finish yes.

If you copy music into /Users/Music/share you have to restart
the container to set the proper user-rights.

If not try the following:
In your vnc session right click your mouse then choose install soulseek.
Click Ok, next next finish yes.
Right click again and choose start soulseek.
Login with your soulseek account.

If you want to install more packages you can right click in the vnc screen
and choose xterm. The password is `soulseek`

```
sudo apt-get update
sudo apt-get chrome
```
