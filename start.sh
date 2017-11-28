#!/bin/bash
set -e

if [ "$TESTING_ENV" = "development" ]
then
    echo "development"
    nodemon app.js
    cd angular-src
    ng serve
else
    echo $TESTING_ENV
    node app.js
fi