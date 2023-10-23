FROM ubuntu:22.04

# Adiciona usuários user1 e user2
RUN useradd -m -s /bin/bash user1 && \
    useradd -m -s /bin/bash user2

# Cria subpastas e arquivos para cada usuário
RUN mkdir -p /home/user1/pastausr1 && \
    mkdir -p /home/user2/pastausr2 && \
    echo "olá user1" > /home/user1/pastausr1/texto.txt && \
    echo "olá user2" > /home/user2/pastausr2/texto.txt && \
    chown user1:user1 /home/user1/pastausr1/texto.txt

# Configura sudo para permitir que user2 leia o arquivo de user1
RUN echo "user2 ALL=(user1) NOPASSWD: /bin/cat /home/user1/pastausr1/texto.txt" >> /etc/sudoers

CMD ["bash"]
