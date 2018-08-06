FROM frolvlad/alpine-python3

RUN apk update && apk upgrade 

RUN apk add --no-cache crond su-exec

RUN pip install strava-backup

RUN adduser -D -g '' stravabackup
RUN mkdir -p /home/stravabackup/data && mkdir -p /home/stravabackup/.config
ADD secret_strava-backup_config /home/stravabackup/.config/strava-backup.conf
RUN chown -R stravabackup /home/stravabackup

RUN echo '*/15 * * * * strava-backup 2>&1' > /etc/crontabs/stravabackup
CMD ['crond', '-l 2', '-f']
