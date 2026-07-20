# ssh-tmux

This is what I use with my students for sharing my session with them.
It creates a Docker container running SSH, exposed on port 443.

Remember to stop the container and change the settings to fit your needs.

By default you can connect with:

```
username: student
password: student1
```

If you connect through SSH and tmux is already running, you'll be automatically attached to that session.

## Usage

Build the image:

```
docker build -t=ssh_tmux .
```

Run it (first time):

```
docker run -p 443:22 -d --name=ssh_tmux ssh_tmux
```

Later, just start it with:

```
docker start ssh_tmux
```

To attach yourself to the session with write permissions:

```
docker exec -it ssh_tmux /bin/bash
```

Then: `su student`, and start tmux.

If it's already running and you want read/write access:

```
su student zsh -c "tmux a"
```

As a student, use the `connect as student.lnk` file (just right-click and edit the IP).
