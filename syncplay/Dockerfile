FROM archlinux

ARG SYNCPLAY_PASSWORD
ARG SYNCPLAY_PORT
ARG SYNCPLAY_SALT

RUN pacman -Syu --noconfirm \
    git \
    make \
    python \
    python-twisted \
    python-certifi \
    python-pyopenssl \
    python-service-identity \
    python-idna

RUN git clone https://github.com/Syncplay/syncplay.git syncplay

WORKDIR syncplay

COPY syncplay/motd motd

RUN make install-server VLC_SUPPORT=false

EXPOSE ${SYNCPLAY_PORT}

ENV SYNCPLAY_PASSWORD=${SYNCPLAY_PASSWORD}
ENV SYNCPLAY_PORT=${SYNCPLAY_PORT}
ENV SYNCPLAY_SALT=${SYNCPLAY_SALT}

CMD syncplay-server \
        --tls /etc/letsencrypt/live/blankaex.reisen \
        --password $SYNCPLAY_PASSWORD \
        --port $SYNCPLAY_PORT \
        --salt $SYNCPLAY_SALT \
        --motd-file motd
