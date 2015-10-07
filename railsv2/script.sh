export APP_PWD=password

db() {
  docker run -P -e POSTGRES_USER=app_user -e POSTGRES_PASSWORD=$APP_PWD -d  --name app_db -t jeff/postgres:9.4
}
app(){
  docker run -p 3000:3000 --link app_db:postgres --name app jeff/app
}

action=$1

${action}
