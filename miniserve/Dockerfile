FROM archlinux

ARG MINISERVE_PORT

RUN pacman -Syu --noconfirm \
    miniserve

EXPOSE ${MINISERVE_PORT}

ENV MINISERVE_PORT=${MINISERVE_PORT}
ENV MINISERVE_AUTH_FILE=/etc/miniserve/auth
ENV MINISERVE_COLOR_SCHEME=archlinux

CMD miniserve \
        /var/local/miniserve
