FROM willfarrell/crontab

# This imagge file is based Alpine.

# Install Git
RUN apk add git

COPY config.json ${HOME_DIR}/

COPY autobackup.sh /usr/bin/autobackup.sh
RUN chmod 544 /usr/bin/autobackup.sh

COPY autoclean.sh /usr/bin/autoclean.sh
RUN chmod 544 /usr/bin/autoclean.sh

ENV GIT_EMAIL=admin@admin.com
ENV GIT_NAME=Cron
VOLUME [ "/data" ]