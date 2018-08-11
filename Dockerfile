FROM frolvlad/alpine-python3

RUN apk update --no-cache && apk upgrade --no-cache \
    && apk add --no-cache su-exec \ 
    && pip install --upgrade pip && pip install strava-backup

RUN adduser -D -g '' stravabackup \
    && mkdir -p /home/stravabackup/data && mkdir -p /home/stravabackup/.config
ADD secret_strava-backup_config /home/stravabackup/.config/strava-backup.conf
RUN chown -R stravabackup /home/stravabackup

ADD stravabackup_crontab /etc/periodic/15min/stravabackup
RUN chmod a+x /etc/periodic/15min/stravabackup 

CMD ["/usr/sbin/crond","-f"]
