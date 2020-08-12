FROM maven:3.6-jdk-11-slim

LABEL "name"="Maven CLI Action with JDK 11"
LABEL "maintainer"="Guillermo Narvaez"
LABEL "version"="1.1.0"

LABEL "com.github.actions.name"="GitHub Action for Maven & JDK 11"
LABEL "com.github.actions.description"="Provide maven cli for JDK 11 projects."
LABEL "com.github.actions.icon"="package"
LABEL "com.github.actions.color"="green"
COPY LICENSE README.md /

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
