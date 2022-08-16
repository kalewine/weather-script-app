#!/bin/bash

echo "Welcome to the Weather Checker!"
read -p "Please type in a zipcode. " zipcode

url="http://api.weatherapi.com/v1/current.json?key=$KEY&q={$zipcode}&aqi=no"
response=$(curl --silent "${url}" | jq '.')

location=$(echo "${response}" | jq -r  '.location.name, .location.region')
condition=$(echo "${response}" | jq -r '.current.condition.text')
temp=$(echo "${response}" | jq ".current.temp_f")



echo -e "Currently, the weather for ${location} is ${condition} with a temperature of ${temp}\u00b0F."










