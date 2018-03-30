FROM ubuntu

# to build
# docker build -t=ssh_tmux .

# at first run:
# docker run -p 443:22 -d --name=ssh_tmux ssh_tmux

# later:
# docker start ssh_tmux

# to attach
# docker exec -it ssh_tmux /bin/bash
# then: su student
# and start tmux if its not started already

# username : student
# password : student1

RUN apt-get update && apt-get install -y vim man tmux zsh openssh-server locales
RUN useradd -m student; \
        chsh -s $(which zsh) student; \
        echo "student:student1" | chpasswd

COPY .zshrc /home/student/
COPY .tmux.conf /home/student/
COPY sshd_config /etc/ssh/sshd_config
COPY authorized_keys /home/student/.ssh/
COPY locale.gen /etc/locale.gen

RUN /usr/bin/ssh-keygen -A ;\
        chsh -s $(which zsh) student;\
        chown student:student /home/student -R ;\
        locale-gen; \
        mkdir -p /var/run/sshd

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
