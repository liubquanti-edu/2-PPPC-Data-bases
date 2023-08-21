CREATE TABLE Керівники (Код INTEGER PRIMARY KEY, Прізвище TEXT, Адреса TEXT);

INSERT INTO Керівники VALUES (1, 'Дичук', 'Кастело Бранко');
INSERT INTO Керівники VALUES (2, 'Токар', 'Вроцлав');
INSERT INTO Керівники VALUES (3, 'Любчекно', 'Стокгольм');
INSERT INTO Керівники VALUES (4, 'Гриненко', 'Мюнхен');
INSERT INTO Керівники VALUES (4, 'Чечель', 'Прага');

SELECT * FROM Керівники;

CREATE TABLE Міста (Код INTEGER PRIMARY KEY, Назва TEXT, Країна TEXT);

INSERT INTO Міста VALUES (1, 'Київ', 'Україна');
INSERT INTO Міста VALUES (2, 'Сеул', 'Південна Корея');
INSERT INTO Міста VALUES (3, 'Магдалинівка', 'Україна');
INSERT INTO Міста VALUES (4, 'Мюнхен', 'Німеччина');
INSERT INTO Міста VALUES (5, 'Вашингтон', 'Сполучені Штати Америки');
INSERT INTO Міста VALUES (6, 'Стокгольм', 'Швеція');
INSERT INTO Міста VALUES (7, 'Гельсінки', 'Фінляндія');
INSERT INTO Міста VALUES (8, 'Канберра', 'Австралія');

SELECT * FROM Міста;

CREATE TABLE Маршрути (Код INTEGER PRIMARY KEY, Назва TEXT, Тривалість INTEGER, Вартість INTEGER);

INSERT INTO Маршрути VALUES (1, 'Зимовий', 24, 3100);
INSERT INTO Маршрути VALUES (2, 'Весняний', 60, 5400);
INSERT INTO Маршрути VALUES (3, 'Літній', 78, 7500);
INSERT INTO Маршрути VALUES (4, 'Осінній', 46, 4700);

SELECT * FROM Маршрути;

CREATE TABLE Зміст (Маршрут REFERENCES Маршрути (Код), Міста REFERENCES Міста (Код));

INSERT INTO Зміст VALUES (1, 3);
INSERT INTO Зміст VALUES (2, 7);
INSERT INTO Зміст VALUES (4, 3);
INSERT INTO Зміст VALUES (3, 8);
INSERT INTO Зміст VALUES (6, 9);
INSERT INTO Зміст VALUES (7, 9);
INSERT INTO Зміст VALUES (8, 7);
INSERT INTO Зміст VALUES (4, 8);
INSERT INTO Зміст VALUES (3, 9);

SELECT * FROM Зміст;

CREATE TABLE Група (Код INTEGER PRIMARY KEY, Керівники REFERENCES Керівники (Код), Маршрути REFERENCES Маршрути (Код), Дата DATE); 

INSERT INTO Група VALUES (1, 3, 4, '2023-10-19');
INSERT INTO Група VALUES (2, 2, 2, '2023-05-23');
INSERT INTO Група VALUES (3, 4, 3, '2013-06-27');
INSERT INTO Група VALUES (4, 2, 3, '2023-07-19');
INSERT INTO Група VALUES (5, 3, 4, '2023-09-16');
INSERT INTO Група VALUES (6, 2, 1, '2023-09-16');

SELECT * FROM Група;


SELECT Назва
FROM Маршрути
WHERE Вартість < (SELECT Вартість FROM Маршрути WHERE Назва = 'Осінній');

SELECT *
FROM Група
WHERE Дата BETWEEN '2023-09-15' AND '2023-10-20';

SELECT Маршрути.Назва
FROM Маршрути
JOIN Зміст ON Маршрути.Код = Зміст.Маршрут
JOIN Міста ON Зміст.Міста = Міста.Код
WHERE Міста.Назва = 'Магдалинівка';

SELECT Прізвище
FROM Керівники
WHERE Код NOT IN (SELECT DISTINCT Керівники FROM Група);

SELECT Прізвище
FROM Керівники
WHERE Код IN (SELECT Керівники FROM Група GROUP BY Керівники HAVING COUNT(DISTINCT Маршрути) = (SELECT COUNT(*) FROM Маршрути));

SELECT *
FROM Група
WHERE Дата IN (SELECT Дата FROM Група GROUP BY Дата HAVING COUNT(*) > 1);
