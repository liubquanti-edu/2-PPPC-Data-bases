CREATE TABLE S(Snum integer PRIMARY KEY, Sname text, City text, Age integer, Comm integer);

INSERT INTO S(Snum, Sname, City, Age, Comm) VALUES(101, 'Петро', 'Харків', 28, 0.12);
INSERT INTO S(Snum, Sname, City, Age, Comm) VALUES(102, 'Сашко', 'Київ', 24, 0.13);
INSERT INTO S(Snum, Sname, City, Age, Comm) VALUES(104, 'Михайло', 'Харків', 20, 0.11);
INSERT INTO S(Snum, Sname, City, Age, Comm) VALUES(107, 'Роман', 'Миколаїв', 25, 0.15);
INSERT INTO S(Snum, Sname, City, Age, Comm) VALUES(103, 'Андрій', 'Київ', 25, 0.1);
INSERT INTO S(Snum, Sname, City, Age, Comm) VALUES(108, 'Михайло', 'Харків', 22, 0.14);
INSERT INTO S(Snum, Sname, City, Age, Comm) VALUES(109, 'Сашко', 'Бабаї', 20, 0.14);
INSERT INTO S(Snum, Sname, City, Age, Comm) VALUES(111, 'Сергій', 'Київ', 20, 0.10);
INSERT INTO S(Snum, Sname, City, Age, Comm) VALUES(112, 'Андрій', 'Магдалинівка', 25, 0.11);
INSERT INTO S(Snum, Sname, City, Age, Comm) VALUES(114, 'Олег', 'Полтава', 16, 0.2);

SELECT * FROM S;



CREATE TABLE C(Cnum integer PRIMARY KEY, Cname text, City text, Rating integer, Snum integer, foreign key (Snum) references S(Snum));

INSERT INTO C(Cnum, Cname, City, Rating, Snum) VALUES(201, 'Наталя', 'Харків', 100, 101);
INSERT INTO C(Cnum, Cname, City, Rating, Snum) VALUES(202, 'Георгій', 'Осло', 200, 108);
INSERT INTO C(Cnum, Cname, City, Rating, Snum) VALUES(203, 'Роман', 'Париж', 150, 111);
INSERT INTO C(Cnum, Cname, City, Rating, Snum) VALUES(204, 'Роман', 'Харків', 200, 102);
INSERT INTO C(Cnum, Cname, City, Rating, Snum) VALUES(206, 'Михайло', 'Київ', 250, 101);
INSERT INTO C(Cnum, Cname, City, Rating, Snum) VALUES(207, 'Клим', 'Харків', 200, 103);
INSERT INTO C(Cnum, Cname, City, Rating, Snum) VALUES(208, 'Сашко', 'Рим', 300, 103);
INSERT INTO C(Cnum, Cname, City, Rating, Snum) VALUES(211, 'Петро', 'Київ', 300, 101);
INSERT INTO C(Cnum, Cname, City, Rating, Snum) VALUES(212, 'Іван', 'Харків', 200, 109);
INSERT INTO C(Cnum, Cname, City, Rating, Snum) VALUES(214, 'Олег', 'Полтава', 300, 114);

SELECT * FROM C;



CREATE TABLE O(Onum integer PRIMARY KEY, Odate date, Cnum integer, Summa integer, foreign key (Cnum) references C(Cnum));

INSERT INTO O(Onum, Odate, Cnum, Summa) VALUES(501, '11.03.22', 201, 300.00);
INSERT INTO O(Onum, Odate, Cnum, Summa) VALUES(502, '11.03.22', 206, 1200.00);
INSERT INTO O(Onum, Odate, Cnum, Summa) VALUES(503, '11.03.22', 207, 25.50);
INSERT INTO O(Onum, Odate, Cnum, Summa) VALUES(504, '12.03.22', 204, 550.00);
INSERT INTO O(Onum, Odate, Cnum, Summa) VALUES(505, '12.03.22', 203, 56.50);
INSERT INTO O(Onum, Odate, Cnum, Summa) VALUES(506, '14.03.22', 202, 600.00);
INSERT INTO O(Onum, Odate, Cnum, Summa) VALUES(507, '14.03.22', 201, 3500.00);
INSERT INTO O(Onum, Odate, Cnum, Summa) VALUES(508, '14.03.22', 207, 23.50);
INSERT INTO O(Onum, Odate, Cnum, Summa) VALUES(509, '14.03.22', 207, 24.00);
INSERT INTO O(Onum, Odate, Cnum, Summa) VALUES(510, '15.03.22', 204, 68.25);
INSERT INTO O(Onum, Odate, Cnum, Summa) VALUES(511, '15.03.22', 212, 995.00);

SELECT * FROM O;



SELECT SUM (Summa) As Allsum FROM O;

SELECT City, AVG(Comm) FROM S GROUP BY City;

SELECT MIN (Sname) FROM S;

SELECT * FROM C WHERE Rating>
(SELECT MAX(Rating) FROM C WHERE City="Харків")

SELECT * FROM O WHERE Summa>
(SELECT MIN(Summa) FROM O WHERE Cnum="201")

SELECT * FROM C WHERE Rating<
(SELECT MAX(Rating) FROM C WHERE City="Київ");

SELECT Sname, MAX(Comm) FROM S
GROUP BY City HAVING MAX(Comm)> (SELECT AVG(Comm) FROM S WHERE City="Харків");

SELECT Sname FROM S
UNION
SELECT Cname FROM C;

SELECT Sname FROM S WHERE EXISTS (SELECT * FROM C WHERE Rating = "300");
