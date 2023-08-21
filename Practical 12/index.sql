CREATE TABLE marks (Прізвище TEXT, Оцінка INTEGER, Предмет TEXT);

INSERT INTO marks VALUES('Іванов', 5, 'Фізика');
INSERT INTO marks VALUES('Петров', 5, 'Фізика');
INSERT INTO marks VALUES('Сидоров', 3, 'Фізика');
INSERT INTO marks VALUES('Іванов', 4, 'Математика');
INSERT INTO marks VALUES('Петров', 3, 'Математика');
INSERT INTO marks VALUES('Сидоров', 4, 'Історія');

SELECT * FROM marks;

SELECT Прізвище FROM marks WHERE Оцінка = 5;

SELECT Прізвище FROM marks WHERE Оцінка > 3 GROUP BY Прізвище;

SELECT Прізвище, avg(Оцінка) AS Середня FROM marks GROUP BY Прізвище;

SELECT Предмет, avg(Оцінка) AS Середня FROM marks GROUP BY Предмет

SELECT Прізвище, Оцінка FROM marks WHERE Предмет = "Фізика" AND NOT EXISTS(SELECT * FROM marks WHERE Прізвище = "Іванов" AND Оцінка <=3);

SELECT avg(Оцінка) AS Успішність FROM marks;

SELECT Прізвище FROM marks GROUP BY Прізвище HAVING AVG(Оцінка) = (SELECT avg(Оцінка) FROM marks);
