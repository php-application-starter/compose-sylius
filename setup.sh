# docker-compose  .env import Variable
if [ -f .env ]; then
    # Load Environment Variables
    export $(cat .env | grep -v '#' | awk '/=/ {print $1}')
    # For instance, will be example_kaggle_key
    echo $PROJECT_NAME
fi

FILE=sylius/public/index.php
SERVICE_NAME_PHP="php-fpm"
if [ -f "$FILE" ]; then
    echo "$FILE  Exits SYLIUS IS ALREADY INSTALLED"
else
     docker exec $PROJECT_NAME$PROJECT_SEPARATOR$SERVICE_NAME_PHP php -d memory_limit=-1  /usr/local/bin/composer create-project sylius/sylius-standard sylius
fi