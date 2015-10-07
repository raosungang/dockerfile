export APP_PWD=password

db1() {
  docker run -P -e POSTGRES_USER=app_user -e POSTGRES_PASSWORD=$APP_PWD -d  --name app_db1 -t jeff/postgres:9.4
}
app1(){
  docker run -p 3000:3000 --link app_db1:postgres --name app1 jeff/app
}

action=$1

${action}
