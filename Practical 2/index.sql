CREATE TABLE students(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, age INTEGER);

ALTER TABLE students RENAME TO stud;

ALTER TABLE stud ADD COLUMN age int;

INSERT INTO GROUPS(number, starosta) VALUES(201, 'Oleh');
INSERT INTO GROUPS(number, starosta) VALUES(202, 'Vasya');

SELECT * FROM GROUPS;

DROP TABLE students;

CREATE TABLE GROUPS(id integer PRIMARY KEY AUTOINCREMENT, number text, starosta text);

.tables

.schema GROUPS

CREATE TABLE passport(seria text, number text, who_gave text, PRIMARY KEY(seria, number));

INSERT INTO passport VALUES('EO', '123432', 'Mykolaiv');
INSERT INTO passport VALUES('EK', '123432', 'Odesa');
INSERT INTO passport VALUES('EK', '123432', 'Kiev');

ALTER TABLE students ADD COLUMN grop_id REFERENCES GROUPS(id);
.schema students
CREATE TABLE students(id integer PRIMARY KEY AUTOINCREMENT, name text, age integer, group_id REFERENCES GROUPS(id));

UPDATE students SET grop_id = 1 WHERE id = 1;
UPDATE students SET grop_id = 2 WHERE id = 2;

PRAGMA FOREIGN_keys = ON;
PRAGMA FOREIGN_keys;

CREATE TABLE students(
id integer PRIMARY KEY AUTOINCREMENT,
name TEXT,
group_id integer,
FOREIGN KEY(group_id) REFERENCES groups(id)
);

ALTER TABLE students ADD COLUMN age integer CHECK(age>0 and age<150);

INSERT INTO students(name, age, group_id)
VALUES('Vasya', 20, 1);
INSERT INTO students(name, age, group_id)
VALUES('Petya', 220, 1);
INSERT INTO students(name, age, group_id)
VALUES('Klya', -2, 2);

SELECT * FROM students;

CREATE INDEX stud_age on students(age);
CREATE UNIQUE INDEX stud_name on students(name);

SELECT * FROM sqlite_master WHERE type='index';

CREATE UNIQUE INDEX stud_name on students(group_id, name);

INSERT INTO students(name, age, group_id)
VALUES('Petya', 20, 1);

SELECT * FROM students;
