#!bin/bash
rm -rf .git
eb init stage
eb setenv DATA_BASE_NAME=drupal
eb setenv USER_NAME=drupaluser
eb setenv PASSWORD=password
eb setenv HOST=mydrupal.clq9gjdsbzou.us-east-2.rds.amazonaws.com
eb setenv PORT=3306
NAME_IMAGE=test
REPO_DOCKER=krevetka

#sed -i "s/<DATA_BASE_NAME>/$DATA_BASE_NAME/" apache/www/html/sites/default/settings.php
#sed -i "s/<USER_NAME>/$USER_NAME/" apache/www/html/sites/default/settings.php
#sed -i "s/<PASSWORD>/$PASSWORD/" apache/www/html/sites/default/settings.php
#sed -i "s/<HOST>/$HOST/" apache/www/html/sites/default/settings.php
#sed -i "s/<PORT>/$PORT/" apache/www/html/sites/default/settings.php

docker build -t $NAME_IMAGE apache
docker tag $NAME_IMAGE $REPO_DOCKER/$NAME_IMAGE
docker push $REPO_DOCKER/$NAME_IMAGE

sed -i "s/<IMAGE_REPO>/$REPO_DOCKER\/$NAME_IMAGE/" Dockerrun.aws.json

