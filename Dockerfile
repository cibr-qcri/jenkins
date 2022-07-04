FROM jenkins/jenkins:lts

ARG SLACK_TOKEN
ARG GP_USER
ARG GP_PASSWORD
ARG ARANGO_USER
ARG ARANGO_PASSWORD
ARG SMTP_PASSWORD
ARG JWT_SECRET
ARG AMPLITUDE_PROD_API_KEY
ARG GITHUB_BOT_PASSWORD

USER root
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false -Dhudson.model.ParametersAction.keepUndefinedParameters=true
ENV CASC_JENKINS_CONFIG /var/jenkins_home/casc.yaml

COPY --chown=jenkins:jenkins configs/plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt
COPY configs/jenkins_casc.yaml /var/jenkins_home/casc.yaml

# see https://docs.docker.com/compose/install/
RUN curl -L \
    "https://github.com/docker/compose/releases/download/1.25.3/docker-compose-$(uname -s)-$(uname -m)" \
    -o /usr/local/bin/docker-compose \
    && chmod +x /usr/local/bin/docker-compose
USER 0

# Configurations related to Jenkins instance
ENV JENKINS_ADMIN_ID=admin \
    JENKINS_ADMIN_PASSWORD=admin \
    JENKINS_URL=http://localhost:8080/ \
    JENKINS_ADMIN_EMAIL_ADDRESS=admin@cibr.qcri.org \
    SLACK_TOKEN=$SLACK_TOKEN \
    GP_USER=$GP_USER \
    GP_PASSWORD=$GP_PASSWORD \
    ARANGO_USER=$ARANGO_USER \
    ARANGO_PASSWORD=$ARANGO_PASSWORD \
    SMTP_PASSWORD=$SMTP_PASSWORD \
    JWT_SECRET=$JWT_SECRET \
    AMPLITUDE_PROD_API_KEY=$AMPLITUDE_PROD_API_KEY \
    GITHUB_BOT_PASSWORD=$GITHUB_BOT_PASSWORD 