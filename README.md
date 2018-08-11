# docker-strava-backup
> A dockerized version of [strava-backup](https://github.com/pR0Ps/strava-backup).  

This dockerized implementation of [strava-backup](https://github.com/pR0Ps/strava-backup) is based on [Alpine Linux](https://hub.docker.com/r/_/alpine) and checks on a daily basis for updated content on your [Strava](https://www.strava.com)-account.

## Preparation
- Go to https://www.strava.com/settings/api and create a token, this will 'only' give you a token with 'permissions: public'. 
- To create a token with extra permissions (ex. 'permissions: view_private,write') follow [this](https://yizeng.me/2017/01/11/get-a-strava-api-access-token-with-write-permission) procedure. 
- Populate the secret_strava-backup_config file accordingly.  

## Building & running the container locally
```bash 
docker build -t docker-strava-backup .
docker run -v /path/where/to/save/your/docker-strava-backup-data:/home/stravabackup/data -it docker-strava-backup
```

## Running the container on AWS (incomplete)
### Creating an Amazon Elastic Container Registry (ECR)
- Log on to your AWS account and head over to the Elastic Container Service
- Create a new repository (ECR)
- Configure aws-cli access if you have not done this before -> 'aws configure', create your Access Keys in AWS/IAM
- Follow the instructions (View Push Commands) as provided by AWS/ECR to push from your build server to ECR
### Running the Container in Amazon Elastic Container Service (ECS) or AWS Fargate (ToDo)
- To store the data in a persistant way you'll need to leverage EFS or work with Elastic Volumes. 

## Running the container on Synology (ToDo)
