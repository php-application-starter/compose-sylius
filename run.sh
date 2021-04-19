#!/bin/bash

# docker-compose  .env import Variable
if [ -f .env ]; then
    # Load Environment Variables
    export $(cat .env | grep -v '#' | awk '/=/ {print $1}')
    # For instance, will be example_kaggle_key
    echo $PROJECT_NAME
fi

echo "I WANT :"

echo "1 ===> composer install (dev env)"
echo "2 ===> Clean symfony cache"
echo "3 ===> production composition ? (comming soon)"

read response_env

if [ $response_env = 1 ]; then
   echo "Strating  docker-compose up for dev command=composer install";
   #&& php -d memory_limit=-1  /usr/local/bin/composer install
   docker-compose -f compose-dev.yml exec php-fpm  ls -l &&  bash cd sylius && ls -l
   echo "finish......";
fi

if [ $response_env = 2 ]; then
   echo "clean symfony cache => php bin/console cache:clear";
   docker-compose -f compose-dev.yml exec  php-fpm php -d memory_limit=-1  bin/console c:c
   echo "finish......";
   docker-compose -f compose-dev.yml  ps
fi

if [ $response_env = 2 ]; then
 echo 'comming soon...'
fi