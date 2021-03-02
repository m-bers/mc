#!/bin/bash

id=$(docker run -d --name="floodgate" -e PLUGINS='https://ci.opencollab.dev/job/GeyserMC/job/Floodgate/job/master/lastSuccessfulBuild/artifact/velocity/target/floodgate-velocity.jar' itzg/bungeecord)
mkdir secrets
docker cp floodgate:/server/plugins/floodgate/key.pem - > secrets/key.pem
docker cp floodgate:/server/plugins/floodgate/public-key.pem - > secrets/public-key.pem
docker cp floodgate:/server/plugins/floodgate/encrypted.txt - > secrets/encrypted.txt
docker rm -v $id
docker-compose up -d