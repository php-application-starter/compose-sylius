#!/bin/bash

echo "Choice the composition ?"

echo "1 ===> dev composition ?"
echo "2 ===> production composition ? (comming soon)"

read response_env

if [ $response_env = 1 ]; then
   echo "Strating  docker-compose up for dev $env";
   docker-compose -f compose-dev.yml up -d
   echo "finish docker-compose up for dev $env";
   docker-compose -f compose-dev.yml  ps
fi

if [ $response_env = 1 ]; then
 echo 'comming soon...'
fi


