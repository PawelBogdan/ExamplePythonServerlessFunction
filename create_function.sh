#!/usr/bin/env bash

if [ -z "$1" ]
    then
        echo "You need to provide one argument - some random uniqe value"

    else
        RESOURCE_GROUP=pawelbogdanresourceGroup$1
        STORAGE_NAME=pawelbogdanstorage$1
        APP_NAME=ExamplePythonServerlessFunction$1

        # Create a reource group
        az group create --name ${RESOURCE_GROUP} --location westeurope

        # Create an Azure Storage account
        az storage account create --name ${STORAGE_NAME} --location westeurope \
        --resource-group ${RESOURCE_GROUP} --sku Standard_LRS

        # Create a function app in Azure
        az functionapp create --resource-group ${RESOURCE_GROUP} --os-type Linux \
        --consumption-plan-location westeurope  --runtime python \
        --name ${APP_NAME} --storage-account  ${STORAGE_NAME}

        echo ${APP_NAME} > app_name.txt
fi