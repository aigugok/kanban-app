### Kanban backend1234567

Spring Boot app
To start application you have to set connection properties for PostgreSQL
- DB_SERVER=your_server_host
- POSTGRES_DB=your_db_name
- POSTGRES_USER=your_db_user
- POSTGRES_PASSWORD=your_db_user_passwd


--------------------
docker network create kanban
docker run --network kanban -v postgres_volume:/var/lib/postgresql/data --name db -e POSTGRES_USER=kanban -e POSTGRES_PASSWORD=kanban -e POSTGRES_DB=kanban -d -p 5432:5432 postgres:14-alpine
docker run --network kanban -d --name backend -p 8080:8080 kanban-app
docker run -d --network kanban --name frontend -p 4200:80 kanban-ui
