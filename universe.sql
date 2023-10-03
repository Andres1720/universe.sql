codeally@204f3594b6bf:~/project$ psql --username=freecodecamp --dbname=postgres
Border style is 2.
Pager usage is off.
psql (12.9 (Ubuntu 12.9-2.pgdg20.04+1))
Type "help" for help.

postgres=> \c universe
You are now connected to database "universe" as user "freecodecamp".
universe=> \d galaxy
                                       Table "public.galaxy"
+--------------+-----------------------+-----------+----------+------------------------------------+
|    Column    |         Type          | Collation | Nullable |              Default               |
+--------------+-----------------------+-----------+----------+------------------------------------+
| name         | character varying(10) |           |          |                                    |
| character_id | character varying(10) |           |          |                                    |
| id           | integer               |           | not null | nextval('galaxy_id_seq'::regclass) |
| galaxy_id    | character varying(20) |           | not null |                                    |
| distancia    | integer               |           |          |                                    |
| index        | integer               |           |          |                                    |
+--------------+-----------------------+-----------+----------+------------------------------------+
Indexes:
    "galaxy_pkey" PRIMARY KEY, btree (galaxy_id)
    "galaxy_distancia_key" UNIQUE CONSTRAINT, btree (distancia)
    "galaxy_index_key" UNIQUE CONSTRAINT, btree (index)
Referenced by:
    TABLE "star" CONSTRAINT "fx_star_galaxy" FOREIGN KEY (galaxy_id) REFERENCES galaxy(index)
    TABLE "star" CONSTRAINT "star_galaxi_nun_fkey" FOREIGN KEY (galaxi_nun) REFERENCES galaxy(index)

universe=> INSERT INTO galaxy(galaxy_id, index) VALUES(1, 1);
ERROR:  duplicate key value violates unique constraint "galaxy_pkey"
DETAIL:  Key (galaxy_id)=(1) already exists.
universe=> INSERT INTO galaxy(galaxy_id, index) VALUES('375', 1);
INSERT 0 1
universe=> \d star
                                       Table "public.star"
+--------------+-----------------------+-----------+----------+----------------------------------+
|    Column    |         Type          | Collation | Nullable |             Default              |
+--------------+-----------------------+-----------+----------+----------------------------------+
| light        | boolean               |           |          |                                  |
| character_id | character varying(10) |           |          |                                  |
| name         | character varying(10) |           |          |                                  |
| id           | integer               |           | not null | nextval('star_id_seq'::regclass) |
| star_id      | integer               |           | not null |                                  |
| calor        | integer               |           |          |                                  |
| galaxy_id    | integer               |           |          |                                  |
| index        | integer               |           |          |                                  |
| galaxi_nun   | integer               |           |          |                                  |
+--------------+-----------------------+-----------+----------+----------------------------------+
Indexes:
    "star_pkey" PRIMARY KEY, btree (star_id)
    "star_calor_key" UNIQUE CONSTRAINT, btree (calor)
    "star_character_id_key" UNIQUE CONSTRAINT, btree (character_id)
    "star_id_key" UNIQUE CONSTRAINT, btree (id)
    "star_index_key" UNIQUE CONSTRAINT, btree (index)
Foreign-key constraints:
    "fx_moon_star" FOREIGN KEY (index) REFERENCES moon(index)
    "fx_star_galaxy" FOREIGN KEY (galaxy_id) REFERENCES galaxy(index)
    "star_galaxi_nun_fkey" FOREIGN KEY (galaxi_nun) REFERENCES galaxy(index)
Referenced by:
    TABLE "planet" CONSTRAINT "fx_planet_star" FOREIGN KEY (star_id) REFERENCES star(index)

universe=> \d star
                                       Table "public.star"
+--------------+-----------------------+-----------+----------+----------------------------------+
|    Column    |         Type          | Collation | Nullable |             Default              |
+--------------+-----------------------+-----------+----------+----------------------------------+
| light        | boolean               |           |          |                                  |
| character_id | character varying(10) |           |          |                                  |
| name         | character varying(10) |           |          |                                  |
| id           | integer               |           | not null | nextval('star_id_seq'::regclass) |
| star_id      | integer               |           | not null |                                  |
| calor        | integer               |           |          |                                  |
| galaxy_id    | integer               |           |          |                                  |
| index        | integer               |           |          |                                  |
| galaxi_nun   | integer               |           |          |                                  |
+--------------+-----------------------+-----------+----------+----------------------------------+
Indexes:
    "star_pkey" PRIMARY KEY, btree (star_id)
    "star_calor_key" UNIQUE CONSTRAINT, btree (calor)
    "star_character_id_key" UNIQUE CONSTRAINT, btree (character_id)
    "star_id_key" UNIQUE CONSTRAINT, btree (id)
    "star_index_key" UNIQUE CONSTRAINT, btree (index)
Foreign-key constraints:
    "fx_moon_star" FOREIGN KEY (index) REFERENCES moon(index)
    "fx_star_galaxy" FOREIGN KEY (galaxy_id) REFERENCES galaxy(index)
    "star_galaxi_nun_fkey" FOREIGN KEY (galaxi_nun) REFERENCES galaxy(index)
Referenced by:
    TABLE "planet" CONSTRAINT "fx_planet_star" FOREIGN KEY (star_id) REFERENCES star(index)

universe=> INSERT INTO star(star_id, character_id, id, index) VALUES('50', '12'. '5', '10');
ERROR:  syntax error at or near "."
LINE 1: ...tar_id, character_id, id, index) VALUES('50', '12'. '5', '10...
                                                             ^
universe=> INSER INTO star(star_id, character_id, id, index) VALUES('50', '12', '14', '5');
ERROR:  syntax error at or near "INSER"
LINE 1: INSER INTO star(star_id, character_id, id, index) VALUES('50...
        ^
universe=> INSERT INTO star(star_id, character_id, id, index) VALUES('10', '12', '4', '6');
ERROR:  insert or update on table "star" violates foreign key constraint "fx_moon_star"
DETAIL:  Key (index)=(6) is not present in table "moon".
universe=> INSERT INTO star(star_id, character_id, id, index) VALUES('12', '14', '12', '3');
ERROR:  duplicate key value violates unique constraint "star_id_key"
DETAIL:  Key (id)=(12) already exists.
universe=> INSERT INTO star(star_id, character_id, id, index) VALUES('10', '5', '8', '3');
ERROR:  duplicate key value violates unique constraint "star_id_key"
DETAIL:  Key (id)=(8) already exists.
universe=> \d star
                                       Table "public.star"
+--------------+-----------------------+-----------+----------+----------------------------------+
|    Column    |         Type          | Collation | Nullable |             Default              |
+--------------+-----------------------+-----------+----------+----------------------------------+
| light        | boolean               |           |          |                                  |
| character_id | character varying(10) |           |          |                                  |
| name         | character varying(10) |           |          |                                  |
| id           | integer               |           | not null | nextval('star_id_seq'::regclass) |
| star_id      | integer               |           | not null |                                  |
| calor        | integer               |           |          |                                  |
| galaxy_id    | integer               |           |          |                                  |
| index        | integer               |           |          |                                  |
| galaxi_nun   | integer               |           |          |                                  |
+--------------+-----------------------+-----------+----------+----------------------------------+
Indexes:
    "star_pkey" PRIMARY KEY, btree (star_id)
    "star_calor_key" UNIQUE CONSTRAINT, btree (calor)
    "star_character_id_key" UNIQUE CONSTRAINT, btree (character_id)
    "star_id_key" UNIQUE CONSTRAINT, btree (id)
    "star_index_key" UNIQUE CONSTRAINT, btree (index)
Foreign-key constraints:
    "fx_moon_star" FOREIGN KEY (index) REFERENCES moon(index)
    "fx_star_galaxy" FOREIGN KEY (galaxy_id) REFERENCES galaxy(index)
    "star_galaxi_nun_fkey" FOREIGN KEY (galaxi_nun) REFERENCES galaxy(index)
Referenced by:
    TABLE "planet" CONSTRAINT "fx_planet_star" FOREIGN KEY (star_id) REFERENCES star(index)

universe=> SELECT * FROM star;
+-------+--------------+-------+----+---------+-------+-----------+-------+------------+
| light | character_id | name  | id | star_id | calor | galaxy_id | index | galaxi_nun |
+-------+--------------+-------+----+---------+-------+-----------+-------+------------+
|       |              | dd    |  7 |       1 |       |           |       |            |
|       |              | dd    |  8 |       2 |       |           |       |            |
|       |              | sss   |  9 |       3 |       |           |       |            |
|       |              | rrr   | 10 |       4 |       |           |       |            |
|       |              | sfgs  | 11 |       5 |       |           |       |            |
|       |              | ddddd | 12 |       6 |       |           |       |            |
+-------+--------------+-------+----+---------+-------+-----------+-------+------------+
(6 rows)

universe=> INSERT INTO star(character_id, galaxi_id, index) VALUES('12', '14', '3', '4');
ERROR:  column "galaxi_id" of relation "star" does not exist
LINE 1: INSERT INTO star(character_id, galaxi_id, index) VALUES('12'...
                                       ^
universe=> INSERT INTO star(character_id, galaxi_id, index) VALUES('3', '6', '3');
ERROR:  column "galaxi_id" of relation "star" does not exist
LINE 1: INSERT INTO star(character_id, galaxi_id, index) VALUES('3',...
                                       ^
universe=> SELECT * FROM star;
+-------+--------------+-------+----+---------+-------+-----------+-------+------------+
| light | character_id | name  | id | star_id | calor | galaxy_id | index | galaxi_nun |
+-------+--------------+-------+----+---------+-------+-----------+-------+------------+
|       |              | dd    |  7 |       1 |       |           |       |            |
|       |              | dd    |  8 |       2 |       |           |       |            |
|       |              | sss   |  9 |       3 |       |           |       |            |
|       |              | rrr   | 10 |       4 |       |           |       |            |
|       |              | sfgs  | 11 |       5 |       |           |       |            |
|       |              | ddddd | 12 |       6 |       |           |       |            |
+-------+--------------+-------+----+---------+-------+-----------+-------+------------+
(6 rows)

universe=> INSERT INTO star(galaxy_id, index, character_id) VALUES('1', '2', 1);
ERROR:  null value in column "star_id" violates not-null constraint
DETAIL:  Failing row contains (null, 1, null, 13, null, null, 1, 2, null).
universe=> UPDATE star SET index =index + 10;
UPDATE 6
universe=> SELECT * FROM star;
+-------+--------------+-------+----+---------+-------+-----------+-------+------------+
| light | character_id | name  | id | star_id | calor | galaxy_id | index | galaxi_nun |
+-------+--------------+-------+----+---------+-------+-----------+-------+------------+
|       |              | dd    |  7 |       1 |       |           |       |            |
|       |              | dd    |  8 |       2 |       |           |       |            |
|       |              | sss   |  9 |       3 |       |           |       |            |
|       |              | rrr   | 10 |       4 |       |           |       |            |
|       |              | sfgs  | 11 |       5 |       |           |       |            |
|       |              | ddddd | 12 |       6 |       |           |       |            |
+-------+--------------+-------+----+---------+-------+-----------+-------+------------+
(6 rows)

universe=> UPDATE star SET index = 10;
ERROR:  duplicate key value violates unique constraint "star_index_key"
DETAIL:  Key (index)=(10) already exists.
universe=> UPDATE satr SER index = 1;
ERROR:  syntax error at or near "index"
LINE 1: UPDATE satr SER index = 1;
                        ^
universe=> UPDATE star SER index = 1;
ERROR:  syntax error at or near "index"
LINE 1: UPDATE star SER index = 1;
                        ^
universe=> UPDATE star SET index=1;
ERROR:  duplicate key value violates unique constraint "star_index_key"
DETAIL:  Key (index)=(1) already exists.
universe=> UPDATE star SET INDEX=2;
ERROR:  duplicate key value violates unique constraint "star_index_key"
DETAIL:  Key (index)=(2) already exists.
universe=> UPDATE star SET index=10;
ERROR:  duplicate key value violates unique constraint "star_index_key"
DETAIL:  Key (index)=(10) already ex