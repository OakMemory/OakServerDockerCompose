FROM willfarrell/crontab

# This imagge file is based Alpine.

# Install Git
RUN apk add git

COPY config.json ${HOME_DIR}/
VOLUME [ "/data" ]