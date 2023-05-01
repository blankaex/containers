FROM archlinux

ARG QBITTORRENT_PORT

RUN pacman -Syu --noconfirm \
    qbittorrent-nox

EXPOSE ${QBITTORRENT_PORT}

CMD qbittorrent-nox \
        --profile=/home/blankaex/.config
