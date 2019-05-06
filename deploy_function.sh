#!/usr/bin/env bash

if [ ! -f app_name.txt ]
    then
        echo "You need to run create_function.sh script first"
    else
        APP_NAME=`cat app_name.txt`
        func azure functionapp publish ${APP_NAME} --build-native-deps
fi