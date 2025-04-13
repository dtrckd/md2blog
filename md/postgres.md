
try `rainfrog` ;)

docker pull

    docker pull postgres
    mkdir -p $HOME/docker/volumes/postgres

docker run

    docker run --rm --name pg-docker -e POSTGRES_PASSWORD=docker -d -p 5432:5432 -v $HOME/docker/volumes/postgres:/var/lib/postgresql/data postgres


connect (host/port/user/database)

    psql -h postgres -p 5432 -U postgres -d postgres


Here's a compact table format for the `psql` commands, including additional commands for counting elements in a table and showing values for a specific ID or name.

| **Action**                           | **Command**                                                                 |
|--------------------------------------|-----------------------------------------------------------------------------|
| **Connect to a Database**            | `psql -h hostname -p port -U username -d dbname`                            |
| **Connect with URL**                 | `psql postgres://username:password@hostname:port/dbname`                    |
| **List All Databases**               | `\l`                                                                        |
| **Connect to a Specific Database**   | `\c dbname`                                                                 |
| **List All Tables**                  | `\dt`                                                                       |
| **List All Schemas**                 | `\dn`                                                                       |
| **List All Users/Roles**             | `\du`                                                                       |
| **List All Functions**               | `\df`                                                                       |
| **List All Extensions**              | `\dx`                                                                       |
| **Describe a Table**                 | `\d table_name`                                                             |
| **Execute a SQL Query**              | `SELECT * FROM table_name;`                                                 |
| **Insert Data**                      | `INSERT INTO table_name (column1, column2) VALUES (value1, value2);`        |
| **Update Data**                      | `UPDATE table_name SET column1 = value1 WHERE condition;`                   |
| **Delete Data**                      | `DELETE FROM table_name WHERE condition;`                                   |
| **Count Elements in a Table**        | `SELECT COUNT(*) FROM table_name;`                                          |
| **Show Value for Specific ID/Name**  | `SELECT * FROM table_name WHERE id = specific_id;`                          |
|                                      | `SELECT * FROM table_name WHERE name = 'specific_name';`                    |
| **Exit `psql`**                      | `\q`                                                                        |
| **Help on SQL Commands**             | `\h`                                                                        |
| **Help on `psql` Commands**          | `\?`                                                                        |
| **Show Current Connection Info**     | `\conninfo`                                                                 |
| **Toggle Timing of Queries**         | `\timing`                                                                   |
| **Set Output Format**                | `\a` (Unaligned), `\H` (HTML), `\t` (Tuples only), `\f` (Field separator)   |

This table provides a quick reference for using `psql` to interact with a PostgreSQL database, including basic navigation and data manipulation commands.
