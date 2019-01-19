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
