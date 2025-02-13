# CodeIgniter 4 Docker template

Clean CI4 framework with docker template.

### Stack
PHP 8.3 (CodeIgniter 4.6.0), PostgreSQL, Redis, nginx

### How to install
```bash
composer create-project m1n64/codeigniter4-docker-appstarter my-awesome-project
```
```bash
cp env .env
```
Then, config database name `POSTGRES_DB` in line 34 in `docker-compose.yml`, and `database.default.database` in `.env`.

Next, change `container_name` and Docker network name in `docker-compose.yml` as you wish.

```bash
docker-compose up -d
```
```bash
docker exec -it codeigniter_app chown -R www-data:www-data /var/www/writable
```
```bash
docker exec -it codeigniter_app chmod -R 775 /var/www/writable
```
Then, open [localhost:8080](http://localhost:8080) and make magic!

### How to use composer or CLI
CLI Spark:
```bash
docker compose exec -it codeigniter_app php spark db:table
```

Composer:
```bash
docker compose exec -it codeigniter_app composer -v
```
***

If you want MySQL - change PostgreSQL in container `db` to MySQL and config `database.default.DBDriver = 'MySQLi'` and `database.default.port = 3306` in `.env`. If you have an errors in build - fix packages in `Dockerfile`.

***

## Note!
**The solution is provided “as is” and the author bears no responsibility if something does not work. You have every right to make a fork and modify the code as you need!**

***

### Links
- [CodeIgniter4 Docs](https://codeigniter.com/)