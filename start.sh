#!/bin/bash
set -e

if [ "$TESTING_ENV" = "development" ]
then
    echo "development"
    nodemon app.js
else
    echo $TESTING_ENV
    node app.js
fi