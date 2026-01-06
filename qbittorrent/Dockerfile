FROM archlinux

ARG QBITTORRENT_PORT

RUN pacman -Syu --noconfirm \
    qbittorrent-nox

RUN useradd blankaex

EXPOSE ${QBITTORRENT_PORT}

CMD qbittorrent-nox \
        --profile=/home/blankaex/.config
