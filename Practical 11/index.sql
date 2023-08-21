CREATE TABLE drivers (driver_id INTEGER PRIMARY KEY, name TEXT, passport INT, date DATE, adress TEXT);

INSERT INTO drivers VALUES (1, 'Іванов', 378707816, '2005-01-07', 'Полтава');
INSERT INTO drivers VALUES (2, 'Клунник', 967528283, '2005-05-02', 'Полтава');
INSERT INTO drivers VALUES (3, 'Іванов', 861056992, '2006-01-01', 'Полтава');
INSERT INTO drivers VALUES (4, 'Чечель', 757782854, '2006-06-09', 'Полтава');
INSERT INTO drivers VALUES (5, 'Іванов', 452756781, '2006-08-24', 'Полтава');
INSERT INTO drivers VALUES (6, 'Любченко', 592159753, '2006-11-13', 'Полтава');
INSERT INTO drivers VALUES (7, 'Пятуха', 844897920, '2006-12-23', 'Полтава');


CREATE TABLE trucks (truck_id INTEGER PRIMARY KEY, mark TEXT, date DATE, number INTEGER, color TEXT);

INSERT INTO trucks VALUES (1, 'MAN', '2000-01-03', 3287, 'Жовтий');
INSERT INTO trucks VALUES (2, 'MAN', '2001-02-10', 9712, 'Червоний');
INSERT INTO trucks VALUES (3, 'MAN', '2001-09-16', 7713, 'зелений');
INSERT INTO trucks VALUES (4, 'Iveco', '2001-10-14', 3706, 'Чорний');
INSERT INTO trucks VALUES (5, 'Scania', '2001-10-15', 5630, 'Пурпуровий');
INSERT INTO trucks VALUES (6, 'Scania', '2003-03-10', 6777, 'Синій');
INSERT INTO trucks VALUES (7, 'Mercedes', '2003-03-11', 6478, 'Помаранчевий');


CREATE TABLE delivery (driver_id REFERENCES drivers (driver_id), truck_id REFERENCES trucks (truck_id), date DATE PRIMARY KEY, cargo TEXT, amount INTEGER, distance INTEGER);

INSERT INTO delivery VALUES (1, 1, '2023-02-01', 'Сухе молоко', 267, 2056);
INSERT INTO delivery VALUES (2, 2, '2023-03-10', 'Мультиметри', 155, 1442);
INSERT INTO delivery VALUES (3, 3, '2023-03-14', 'Залізо', 1313, 194);
INSERT INTO delivery VALUES (4, 4, '2023-03-23', 'Пластик', 1393, 1911);
INSERT INTO delivery VALUES (5, 5, '2023-04-20', 'Сіно', 681, 1728);
INSERT INTO delivery VALUES (6, 6, '2023-04-26', 'Консерви', 1250, 401);
INSERT INTO delivery VALUES (7, 7, '2023-04-27', 'Темне пиво', 872, 1282);


SELECT * FROM drivers;
SELECT * FROM trucks;
SELECT * FROM delivery;

SELECT * FROM delivery WHERE driver_id IN (SELECT driver_id FROM drivers WHERE name = 'Іванов');

SELECT DISTINCT date FROM delivery WHERE truck_id IN (SELECT truck_id FROM trucks WHERE mark = 'MAN');

SELECT mark, COUNT(*) AS count FROM trucks GROUP BY mark;
