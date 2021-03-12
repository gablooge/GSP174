#!/bin/bash
gcloud auth revoke --all

while [[ -z "$(gcloud config get-value core/account)" ]]; 
do echo "waiting login" && sleep 2; 
done

while [[ -z "$(gcloud config get-value project)" ]]; 
do echo "waiting project" && sleep 2; 
done

open "http://console.actions.google.com/"

gcloud alpha dialogflow agent import  --source="dialogflow-sillyNameMaker.zip" --replace-all

cd function

gcloud beta functions deploy silly-name-maker --runtime nodejs12 --trigger-http --allow-unauthenticated