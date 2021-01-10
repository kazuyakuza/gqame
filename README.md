##gQame

1. follow tutorial
https://medium.com/@phatdev/build-a-real-time-chat-application-with-websocket-socket-io-redis-and-docker-in-nestjs-499c2513c18

2. install VMBox where install an ubuntu server distro

3. new VM on VMBox and install ubuntu server distro
https://hibbard.eu/install-ubuntu-virtual-box/

need a linux server to run redis and/or docker

it's possible to run redis/docker on windows with WSL
(depends on installed windows version)
https://redislabs.com/blog/redis-on-windows-10/

4. Install Docker Engine on Ubuntu
https://docs.docker.com/engine/install/ubuntu/

5. Install docker-compose

```
sudo apt-get remove docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
```

6. Run next cmds

```
sudo chmod -R 755 /var/www
sudo chown -R $USER:$USER /var/www/gqame/
sudo usermod -a -G docker <username>
```

Then logout & login and check `groups` cmd return contains `docker` group

used links:

1. https://docs.nestjs.com/
2. https://redis.io/download
3. https://www.docker.com/get-started
4. https://forums.docker.com/t/command-not-found-when-i-try-to-run-docker-compose/97183/4
