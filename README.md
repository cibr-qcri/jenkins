# jenkins

All CI/CD pipelines for CIBR

## Prerequisites

Install Docker engine in the host machine. Please refer this [documentatio](https://docs.docker.com/engine/install/) further information

## Starting

```zsh
SLACK_TOKEN="<REPLACE>" GP_USER="<REPLACE>" GP_PASSWORD="<REPLACE>" ARANGO_USER="<REPLACE>" ARANGO_PASSWORD="<REPLACE>" SMTP_PASSWORD="<REPLACE>" JWT_SECRET="<REPLACE>" AMPLITUDE_PROD_API_KEY="<REPLACE>" docker-compose -f docker-compose.yml up --build --detach
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

<!-- publishers {
          slackNotifier {
             notifySuccess(true)
             notifyEveryFailure(true)
             teamDomain("cibr-qcri")
             room("#builds")
             username("Jenkins")
             tokenCredentialId("slack-token")
             includeCustomMessage(false)
             commitInfoChoice("NONE")
          }
        } -->
