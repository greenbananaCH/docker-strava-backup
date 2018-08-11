FROM alpine:latest

# Run `docker build --no-cache .` to update dependencies
RUN apk update --no-cache \
	&& apk add --no-cache python3 su-exec \
	&& python3 -m ensurepip \
	&& rm -r /usr/lib/python*/ensurepip \
	&& pip3 install --upgrade pip setuptools strava-backup \
	&& if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi \
	&& if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi \
	&& rm -r /root/.cache
	
RUN adduser -D -g '' stravabackup \
    && mkdir -p /home/stravabackup/data /home/stravabackup/.config
ADD secret_strava-backup_config /home/stravabackup/.config/strava-backup.conf
RUN chown -R stravabackup /home/stravabackup

ADD stravabackup_crontab /etc/periodic/daily/stravabackup
RUN chmod a+x /etc/periodic/daily/stravabackup

CMD ["/usr/sbin/crond","-f"]
