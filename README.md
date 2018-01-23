## Dockerized Rails App with MariaDb for development enviroment ##
This is a full `Ruby On Rails` app development enviroment containing the following:
* Ruby 2.4.2
* Mariadb 10.3
* Ruby on rails 5.0.6

To get this project running you need to follow the next instructions(all instructions consider that you are using a linux distribution):

### 1. Requirements ###
You must have installed [docker](https://docs.docker.com/) and [docker-compose](https://docs.docker.com/compose/install/) on your machine.

### 2. Clone ##
```
git clone https://github.com/AlanGCruz/rails_5.0.6_dockerized.git \
  && cd rails_5.0.6_dockerized
```

### 3. Define the enviroment variables and start containers ###
We don't want to push our credentials to the repository so to prevent that you have to create a `.env` file wich docker will read when the `docker-compose` command is executed on the current working directory.For that you can make a copy of the `.env-sample` and assign value to the variables.
```
cp .env-sample .env
```
The `.env` file is declared on the `.gitignore`.

In this project we are using a custom user for the mariadb, that's the one that we are using on `config/database.yml` to configure the database credentials on rails.
To create a custom user you have to create a copy of the `db-sample.sql` file and put the user and pasword in its corresponding place(read the commentsi on the file).

```
cp db-sample.sql db.sql
```
For your new `db.sql` file you have to define the same user and password that you defined on the `.env` file. the `db.sql` file is also on `.gitignore`.
Then start the docker containers:
```
docker-compose up -d
```

### 4. Run rails db:setup ###
```
docker-compose exec app rails db:setup
```

### Add an alias to your shell ###
To make this easier you can add an alias to your `.bashrc` or `.zshrc` file. Example:
```
alias app="sudo docker-compose -f 'home/user/app/folder/docker-compose.yml'"
```
