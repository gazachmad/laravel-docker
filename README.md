# Laravel Docker Server

Configuration steps:

1. Copy all files and folders to the root of your laravel project.
2. Open your `.env` file and follow these steps:
   - Replace the database configuration with:
     
      ```
      DB_CONNECTION=mysql
      DB_HOST=mariadb
      DB_PORT=3306
      DB_DATABASE=laravel
      DB_USERNAME=root
      DB_PASSWORD=root
      ``` 
   - Find `QUEUE_CONNECTION` and replace with:
     
      ```
      QUEUE_CONNECTION=database
      ```
3. Now run `docker-compose up -d` and let docker build the images and containers.
4. Once containers up and ready go to http://localhost.
