# ssh-tmux

This is what I use with my students for sharing my session to them
This creates a docker container running ssh exposed on port 443. 

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

to attach yourself to the session:

```
docker exec -it ssh_tmux /bin/bash
```

then: su student; and start tmux
