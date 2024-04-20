# Laravel Docker Server

Configuration steps:

1. Copy all files and folders to the root of your laravel project.
2. If there is already a `.env` file: (if not ignore this step).
   - Replace the database configuration with:
      ```DB_CONNECTION=mysql
      DB_HOST=mariadb
      DB_PORT=3306
      DB_DATABASE=laravel
      DB_USERNAME=root
      DB_PASSWORD=root``` 
    - Find `QUEUE_CONNECTION` and replace the value to `database`.
4. Now run `docker-compose up -d` and let docker build the images and containers.
5. Once containers up and ready go to http://localhost.
