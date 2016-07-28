# Summary

A simple Dockerfile and docker-compose for local Rails app development. Assumes you are using Postgres. By default it will use:

* Ruby 2.3
* PostgreSQL 9.5

But if you look in the `Dockerfile` and `docker-compose.yml` file you can see where you can change this.

## Usage

Assuming you have this in the root of your Rails app, and you have a `database.yml` file that has:

```
development:
  ...
  host: db
  username: postgres
  password:
```

You should be able to run:

```
$ docker-compose up
```

You should then be able to run things like:

```
$ docker-compose run web bundle exec rake db:schema:load
```

and any other commands you need and see you site at `http://localhost:3000`




