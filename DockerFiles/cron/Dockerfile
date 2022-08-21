FROM willfarrell/crontab

# This imagge file is based Alpine.

# Install Git
RUN apk add git
COPY autobackup.sh /usr/bin/autobackup.sh
COPY config.json ${HOME_DIR}/

RUN chmod 544 /usr/bin/autobackup.sh
VOLUME [ "/data" ]