# jenkins

All CI/CD pipelines for CIBR

## Prerequisites

Install Docker engine in the host machine. Please refer this [documentatio](https://docs.docker.com/engine/install/) further information

## Starting

```zsh
JENKINS_ADMIN_PASSWORD="<REPLACE>" GITHUB_BOT_PASSWORD="<REPLACE>" SLACK_TOKEN="<REPLACE>" GP_USER="<REPLACE>" GP_PASSWORD="<REPLACE>" ARANGO_USER="<REPLACE>" ARANGO_PASSWORD="<REPLACE>" SMTP_PASSWORD="<REPLACE>" JWT_SECRET="<REPLACE>" AMPLITUDE_PROD_API_KEY="<REPLACE>" docker-compose -f docker-compose.yml up --build --detach
```

## Stopping

```zsh
# In developement
# Add --volumes to remove named vols
docker-compose -f docker-compose.yml down

# In production
# Remove all images for a clean start
docker-compose -f docker-compose.yml down --rmi all
```
