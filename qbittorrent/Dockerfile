FROM archlinux

ARG QBITTORRENT_PORT
ARG BITTORRENT_PORT

RUN pacman -Syu --noconfirm \
    qbittorrent-nox

EXPOSE ${QBITTORRENT_PORT} ${BITTORRENT_PORT}

CMD qbittorrent-nox \
        --profile=/home/blankaex/.config
