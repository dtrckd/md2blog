@database


full user table

    select * from mysql.user;

show user and host only

    select host, user, password from mysql.user;

show field

    desc mysql.user;

encrypted password

    select host, user, password from mysql.user;

show databases

    show databases;

inline like command:
    mysql -u root -p -e 'show databases;'

drop a database

    DROP DATABASE nexctcloud;

