FROM archlinux

ARG QBITTORRENT_PORT

RUN pacman -Syu --noconfirm \
    qbittorrent-nox \
    python \
    git

RUN git clone -b latest-release https://github.com/VueTorrent/VueTorrent.git /config/VueTorrent

EXPOSE ${QBITTORRENT_PORT}

CMD qbittorrent-nox \
        --profile=/config
