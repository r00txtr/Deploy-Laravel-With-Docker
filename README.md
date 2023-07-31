# Deploy-Laravel-With-Docker

# Installation
## Build the Jenkins BlueOcean Docker Image
```
docker build -t img-perpus-username .
```
## Docker-compose up
```
docker-compose up -d
```
## Setting database configuration in .env
``` 
docker exec -it "nama-container" bash
```

## Run Command
```
php artisan migrate
```
## Also Run Command 
```
php artisan db:seed
```
