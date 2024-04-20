# Laravel Docker Server

- Copy all files and folders to the root of your laravel project.
- If there is already a `.env` file: (if not ignore this step).
1. Replace the database configuration with:
```
DB_CONNECTION=mysql
DB_HOST=mariadb
DB_PORT=3306
DB_DATABASE=laravel
DB_USERNAME=root
DB_PASSWORD=root
```
2. Change `QUEUE_CONNECTION` to `database`
- Now run `docker-compose up -d` and let docker build the images and containers.
- Once containers up and ready go to (http://localhost).