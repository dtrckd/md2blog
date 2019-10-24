@database

http://g2pc1.bu.edu/~qzpeng/manual/MySQL%20Commands.htm

show databases

    show databases;

with size:
```sql
SELECT
    table_schema AS 'DB Name',
    ROUND(SUM(data_length + index_length) / 1024 / 1024, 1) AS 'DB Size in MB'
FROM
    information_schema.tables
GROUP BY
    table_schema;
```

full user table

    select * from mysql.user;

show user and host only

    select host, user, password from mysql.user;

show field

    desc mysql.user;

create a database:

drop a database:

    DROP DATABASE nexctcloud;

create user:

    CREATE USER 'smith'@'localhost' IDENTIFIED by '';

change/set password:

    SET PASSWORD FOR 'smith'@'localhost' = PASSWORD('');

remove user:

    DROP USER 'simth'@'localhost';

grant permission:

    # Global
    GRANT SELECT ON *.* TO 'jerry'@'localhost' WITH GRANT OPTION;

    # Local
    GRANT SELECT,UPDATE,INSERT,DELETE ON dev2qa_example.* TO 'jerry'@'localhost';
    #or (to create database
    GRANT ALL PRIVILEGES  ON neocities.* TO 'smith'@'localhost';

encrypted password

    select host, user, password from mysql.user;

inline like command:

    mysql -u root -p -e 'show databases;'

