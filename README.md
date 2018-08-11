# docker-strava-backup
> A dockerized version of [strava-backup](https://github.com/pR0Ps/strava-backup).  

This dockerized implementation of [strava-backup](https://github.com/pR0Ps/strava-backup) is based on [alpine-python3](https://hub.docker.com/r/frolvlad/alpine-python3) and checks every 15' for updated content on your [Strava](https://www.strava.com)-account.

## Preparation
- Go to https://www.strava.com/settings/api and create a token, this will 'only' give you a token with 'permissions: public'. 
- To create a token with extra permissions (ex. 'permissions: view_private,write') follow [this](https://yizeng.me/2017/01/11/get-a-strava-api-access-token-with-write-permission) procedure. 
- Populate the secret_strava-backup_config file accordingly.  

## Building & running the container 
```bash 
docker build -t docker-strava-backup .
docker run -v /path/where/to/save/your/docker-strava-backup-data:/home/stravabackup/data -it docker-strava-backup
```

## Running the container on Synology
- ToDo
