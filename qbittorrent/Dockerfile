FROM archlinux

ARG UID
ARG GID
ARG USER
ARG QBITTORRENT_PORT

RUN pacman -Syu --noconfirm \
    qbittorrent-nox \
    python \
    git

RUN groupadd -g ${GID} ${USER} && \
    useradd -m -u ${UID} -g ${USER} ${USER}

RUN git clone -b latest-release https://github.com/VueTorrent/VueTorrent.git /config/VueTorrent

EXPOSE ${QBITTORRENT_PORT}

CMD ["qbittorrent-nox", "--profile=/config"]
