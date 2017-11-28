#!/bin/bash
set -e

if [ "$TESTING_ENV" = "development" ]
then
    echo "development"
    nf start -p 4200
else
    echo $TESTING_ENV
    node app.js
fi