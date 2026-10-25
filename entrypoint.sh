#!/bin/bash
set -e

MEMORY=$(grep '^memory:' /server/ermc-config.yml | awk '{print $2}' | tr -d '\r' | tr -d ' ')
MEMORY=${MEMORY:-1024}

JAR=$(grep '^jar:' /server/ermc-config.yml | awk '{print $2}' | tr -d '\r' | tr -d ' ')
JAR=${JAR:-server.jar}

JAVA_ARGS=$(grep '^java-args:' /server/ermc-config.yml | cut -d ':' -f2- | sed 's/^[[:space:]]*//' | tr -d '\r' | sed 's/^"//; s/"$//' || true)

echo "Starting ERMC Jar instance..."
echo "Using memory: ${MEMORY}MB"
echo "Using jar: ${JAR}"

if [ -n "$JAVA_ARGS" ]; then
    echo "Using Java arguments: ${JAVA_ARGS}"
fi

exec java -Xmx${MEMORY}M -Xms${MEMORY}M ${JAVA_ARGS} -jar ${JAR} nogui
