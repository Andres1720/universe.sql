codeally@f4e55ca629c2:~/project$ psql --usename=freecodecamp --dbname=postgres
/usr/lib/postgresql/12/bin/psql: unrecognized option '--usename=freecodecamp'
Try "psql --help" for more information.
codeally@f4e55ca629c2:~/project$ psql --username=freecodecamp --dbname=postgres
Border style is 2.
Pager usage is off.
psql (12.9 (Ubuntu 12.9-2.pgdg20.04+1))
Type "help" for help.

postgres=> \c universe
You are now connected to database "universe" as user "freecodecamp".
universe=> SELECT * FROM moon;
+---------+------+-----------+-------+-----+
| moon_id | name | planet_id | color | orb |
+---------+------+-----------+-------+-----+
+---------+------+-----------+-------+-----+
(0 rows)

universe=> INSERT INTO moon(name, color, orb, planet_id) VALUES('lii', 'black', 112, 1), ('kiki', 'white', 545, 2), ('bsbs', 'oran', 1254, 1), ('loooo', 'kdkkdk', 15545, 3);INSERT 0 4
universe=> INSERT INTO moon(name, color, orb, planet_id) VALUES('hshsh', 'gree', 15151, 5), ('sjjsj', 'blue', 45455, 6), ('mmkmdk', 'ref', 5457, 7), ('klllss', 'sksms', 514151, 8), ('ksksksm', 'fucc', 4414554, 9);
INSERT 0 5
universe=> INSERT INTO moon(name, color, orb, planet_id) VALUES('uuujj', 'eeedd', 121444, 4), ('skss', 'dghdgd', 454147, 5), ('sseerr', 'sasxx', 46846, 6), ('sdsxcd', 'dss', 1441, 7), ('dfssfg', 'dfdss', 41556, 8), ('dsscvds', 'ssadcx', 1454462, 9), ('hkkkfr', 'ddfd', 1697, 10), ('ssckmnv', 'daza', 49236, 11), ('saavg', 'sxsas', 16684, 12);
INSERT 0 9
universe=> SELECT * FROM moon;
+---------+---------+-----------+--------+---------+
| moon_id |  name   | planet_id | color  |   orb   |
+---------+---------+-----------+--------+---------+
|       1 | lii     |         1 | black  |     112 |
|       2 | kiki    |         2 | white  |     545 |
|       3 | bsbs    |         1 | oran   |    1254 |
|       4 | loooo   |         3 | kdkkdk |   15545 |
|       5 | hshsh   |         5 | gree   |   15151 |
|       6 | sjjsj   |         6 | blue   |   45455 |
|       7 | mmkmdk  |         7 | ref    |    5457 |
|       8 | klllss  |         8 | sksms  |  514151 |
|       9 | ksksksm |         9 | fucc   | 4414554 |
|      10 | uuujj   |         4 | eeedd  |  121444 |
|      11 | skss    |         5 | dghdgd |  454147 |
|      12 | sseerr  |         6 | sasxx  |   46846 |
|      13 | sdsxcd  |         7 | dss    |    1441 |
|      14 | dfssfg  |         8 | dfdss  |   41556 |
|      15 | dsscvds |         9 | ssadcx | 1454462 |
|      16 | hkkkfr  |        10 | ddfd   |    1697 |
|      17 | ssckmnv |        11 | daza   |   49236 |
|      18 | saavg   |        12 | sxsas  |   16684 |
+---------+---------+-----------+--------+---------+
(18 rows)

universe=> INSERT INTO moon(name, color, orb, planet_id) VALUES('ddvv', 'sbjmvc', 26984, 6), ('dsssdcs', 'dwewd', 1455, 12);
INSERT 0 2
universe=> ALTER TABLE moon ADD FOREIGN KEY(planet_id) REFERENCES moon(planet_id);
ERROR:  there is no unique constraint matching given keys for referenced table "moon"
universe=> ALTER TABLE moon ADD FOREIGN KEY(planet_id) REFERENCES planet(planet_id);
ALTER TABLE
universe=> DROP TABLE moon;
DROP TABLE
universe=> CREATE TABLE moon(moon_id SERIAL PRIMARY KEY, name VARCHAR(20) NOT NULL, dist INT NOT NULL, orb BOOLEAN UNIQUE, planet_id INT NOT NULL);
CREATE TABLE
universe=> \d moon
                                        Table "public.moon"
+-----------+-----------------------+-----------+----------+---------------------------------------+
|  Column   |         Type          | Collation | Nullable |                Default                |
+-----------+-----------------------+-----------+----------+---------------------------------------+
| moon_id   | integer               |           | not null | nextval('moon_moon_id_seq'::regclass) |
| name      | character varying(20) |           | not null |                                       |
| dist      | integer               |           | not null |                                       |
| orb       | boolean               |           |          |                                       |
| planet_id | integer               |           | not null |                                       |
+-----------+-----------------------+-----------+----------+---------------------------------------+
Indexes:
    "moon_pkey" PRIMARY KEY, btree (moon_id)
    "moon_orb_key" UNIQUE CONSTRAINT, btree (orb)

universe=> INSERT INTO moon(name, dist, orb, planet_id) VALUES('lum', 15150, 'true', 1), ('op', 74, 'true', 2), ('ty', 12, 'true', 3), ('re', 45, 'false', 4), ('tr', 14, 'false', 5), ('res', 121, 'true', 6), ('ddd', 1456, 'false', 7), ('rfff', 89, 'true', 8), ('rrf', 99, 'true', 9), ('eeed', 75, 'true', 10);
ERROR:  duplicate key value violates unique constraint "moon_orb_key"
DETAIL:  Key (orb)=(t) already exists.
universe=> \d comet
                          Table "public.comet"
+-------------+-----------------------+-----------+----------+---------+
|   Column    |         Type          | Collation | Nullable | Default |
+-------------+-----------------------+-----------+----------+---------+
| name        | character varying(10) |           |          |         |
| charater_id | character varying(30) |           |          |         |
| comet_id    | integer               |           |          |         |
| diametro    | integer               |           | not null |         |
| peso        | integer               |           | not null |         |
| textura     | numeric               |           |          |         |
+-------------+-----------------------+-----------+----------+---------+
Indexes:
    "comet_comet_id_key" UNIQUE CONSTRAINT, btree (comet_id)

universe=> DROP TABLE comet;
DROP TABLE
universe=> CREATE TABLE satelite(satelite_id SERIAL PRIMARY KEY, name VARCHAR(20) NOT NULL, count INT UNIQUE, real BOOLEAN, vel INT NOT NULL);
CREATE TABLE
universe=> ALTER TABLE moon ALTER COLUMN orb TYPE INT;
ERROR:  column "orb" cannot be cast automatically to type integer
HINT:  You might need to specify "USING orb::integer".
universe=> SELECT * FROM moon;
+---------+------+------+-----+-----------+
| moon_id | name | dist | orb | planet_id |
+---------+------+------+-----+-----------+
+---------+------+------+-----+-----------+
(0 rows)

universe=> ALTER TABLE moon DROP COLUMN orb;
ALTER TABLE
universe=> ALTER TABLE moon ADD COLUMN orb INT UNIQUE;
ALTER TABLE
universe=> \d moon;
                                        Table "public.moon"
+-----------+-----------------------+-----------+----------+---------------------------------------+
|  Column   |         Type          | Collation | Nullable |                Default                |
+-----------+-----------------------+-----------+----------+---------------------------------------+
| moon_id   | integer               |           | not null | nextval('moon_moon_id_seq'::regclass) |
| name      | character varying(20) |           | not null |                                       |
| dist      | integer               |           | not null |                                       |
| planet_id | integer               |           | not null |                                       |
| orb       | integer               |           |          |                                       |
+-----------+-----------------------+-----------+----------+---------------------------------------+
Indexes:
    "moon_pkey" PRIMARY KEY, btree (moon_id)
    "moon_orb_key" UNIQUE CONSTRAINT, btree (orb)

universe=> INSERT INTO moon(name, dist, orb, planet_id) VALUES('e', 10, 11, 1), ('rt', 12, 14, 2), ('yu', 14, 15, 3);
INSERT 0 3
universe=> INSERT INTO moon(name, dist, orb, planet_id) VALUES('op', 16, 17, 5), ('df', 18, 19, 4), ('gf', 19, 20, 6), ('kl', 21, 22, 1), ('lk', 23, 24, 7), ('ñz', 26, 27, 8);
INSERT 0 6
universe=> INSERT INTO moon(name, dist, orb, planet_id) VALUES('xc', 28, 29, 1), ('cv', 30, 32, 2), ('mn', 34, 35, 3), ('laamk', 36, 37, 4), ('kjhaa', 39, 40, 5), ('ddfg', 50, 51, 6), ('gkggfaag', 7894, 78965, 7), ('bnnnmh', 6322632, 522566, 8); 
INSERT 0 8
universe=> INSERT INTO moon(name, dist, orb, planet_id) VALUES('sffsf', 15154136, 451255, 9), ('dfsdjnjkk', 84523, 4222264, 10), ('sdadaacc', 255544784, 5522, 11);
INSERT 0 3
universe=> SELECT * FROM moon;
+---------+-----------+-----------+-----------+---------+
| moon_id |   name    |   dist    | planet_id |   orb   |
+---------+-----------+-----------+-----------+---------+
|       3 | e         |        10 |         1 |      11 |
|       4 | rt        |        12 |         2 |      14 |
|       5 | yu        |        14 |         3 |      15 |
|       6 | op        |        16 |         5 |      17 |
|       7 | df        |        18 |         4 |      19 |
|       8 | gf        |        19 |         6 |      20 |
|       9 | kl        |        21 |         1 |      22 |
|      10 | lk        |        23 |         7 |      24 |
|      11 | ñz        |        26 |         8 |      27 |
|      12 | xc        |        28 |         1 |      29 |
|      13 | cv        |        30 |         2 |      32 |
|      14 | mn        |        34 |         3 |      35 |
|      15 | laamk     |        36 |         4 |      37 |
|      16 | kjhaa     |        39 |         5 |      40 |
|      17 | ddfg      |        50 |         6 |      51 |
|      18 | gkggfaag  |      7894 |         7 |   78965 |
|      19 | bnnnmh    |   6322632 |         8 |  522566 |
|      20 | sffsf     |  15154136 |         9 |  451255 |
|      21 | dfsdjnjkk |     84523 |        10 | 4222264 |
|      22 | sdadaacc  | 255544784 |        11 |    5522 |
+---------+-----------+-----------+-----------+---------+
(20 rows)

universe=> ALTER TABLE moon ADD FOREIGN KEY(planet_id) REFERENCES planet(planet_id);
ALTER TABLE
universe=> INSERT INTO satelite(name, count, real, vel) VALUES('opaco', 16, 'true', 1566), ('redf', 19, 'false', 475), ('direct', 45, 'false', 16595);
INSERT 0
Instructions
For this project, you need to log in to PostgreSQL with psql to create your database. Do that by entering psql --username=freecodecamp --dbname=postgres in the terminal. Make all the tests below pass to complete the project. Be sure to get creative, and have fun!

Don't forget to connect to your database after you create it 😄

Here's some ideas for other column and table names: description, has_life, is_spherical, age_in_millions_of_years, planet_types, galaxy_types, distance_from_earth.

Notes:
If you leave your virtual machine, your database may not be saved. You can make a dump of it by entering pg_dump -cC --inserts -U freecodecamp universe > universe.sql in a bash terminal (not the psql one). It will save the commands to rebuild your database in universe.sql. The file will be located where the command was entered. If it's anything inside the project folder, the file will be saved in the VM. You can rebuild the database by entering psql -U postgres < universe.sql in a terminal where the .sql file is.

If you are saving your progress on freeCodeCamp.org, after getting all the tests to pass, follow the instructions above to save a dump of your database. Save the universe.sql file in a public repository and submit the URL to it on freeCodeCamp.org.

Complete the tasks below

You should create a database named universe

Be sure to connect to your database with \c universe. Then, you should add tables named galaxy, star, planet, and moon

Each table should have a primary key

Each primary key should automatically increment

Each table should have a name column

You should use the INT data type for at least two columns that are not a primary or foreign key

You should use the NUMERIC data type at least once

You should use the TEXT data type at least once

You should use the BOOLEAN data type on at least two columns

Each "star" should have a foreign key that references one of the rows in galaxy

Each "planet" should have a foreign key that references one of the rows in star

Each "moon" should have a foreign key that references one of the rows in planet

Your database should have at least five tables

Each table should have at least three rows

The galaxy and star tables should each have at least six rows

The planet table should have at least 12 rows

The moon table should have at least 20 rows

Each table should have at least three columns

The galaxy, star, planet, and moon tables should each have at least five columns

At least two columns per table should not accept NULL values

At least one column from each table should be required to be UNIQUE

All columns named name should be of type VARCHAR

Each primary key column should follow the naming convention table_name_id. For example, the moon table should have a primary key column named moon_id

Each foreign key column should have the same name as the column it is referencing

Congratulations on completing "Celestial Bodies Database"!
You've reached the end of the road...
To go down another path:

- open a new VSCode workspace
- relaunch the CodeRoad app
- select a new tutorial