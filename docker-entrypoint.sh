#!/usr/bin/env bash
set -eu

exec java -Djava.library.path=. -Xmx256m -jar DynamoDBLocal.jar "$@"
