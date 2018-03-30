# ssh-tmux

This is what I use with my students for sharing my session to them
This creates a docker container running ssh exposed on port 443. 
Remember to stop the container, and change the settings to your needs
By default you can connect with:

```
username: student
password: student1
```
If you connect trough ssh and tmux is already running, you'll be automatically
attached to that session

# Usage
To build:
```
docker build -t=ssh_tmux . 
```

To run:
```
docker run -p 443:22 -d --name=ssh_tmux ssh_tmux
```

Then later you just start it with:
```
docker start ssh_tmux
```

To attach yourself to the session with write permissions:

```
docker exec -it ssh_tmux /bin/bash
```
then: su student; and start tmux.

If its already running and you want rw:
```
su student zsh -c "tmux a”
```
