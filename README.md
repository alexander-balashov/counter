# Counter app
Web application

### Getting started:
1. Make sure that docker has been installed
2. Build docker image
```jshelllanguage
./build.sh
```
3. Start MySQL server in docker
```jshelllanguage
./start_db.sh
```
4. Start counter app in docker 
```jshelllanguage
./start_app.sh
```
5. Web app will be available on `localhost:8000`

### Environment variables
- ROOT_PASSWORD - root password to connect to database. By default: qwerty
- DB_USER - user name to connect to database. By default: admin
- DB_PASSWORD - user password to connect to database. By default: admin
- DB_HOST - database address. By default: 127.0.0.1

### Update application
1. Rebuild docker image 
```jshelllanguage
./build.sh
```
2. Stop docker container
```jshelllanguage
docker stop counter-app
docker rm counter-app
```
3. Start app
```jshelllanguage
./start_app.sh
```