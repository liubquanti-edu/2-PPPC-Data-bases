CREATE TABLE supply (
   book_id INTEGER PRIMARY KEY AUTOINCREMENT,
   title TEXT (50),
   author TEXT(50),
   price DECIMAL (8, 2),
   amount INTEGER
);

INSERT INTO supply (book_id, title, author, price, amount) VALUES
(1, 'Зимові дерева', 'Стус В. С.', 518.99, 2),
(2, 'Думи мої, доми мої', 'Шевченко Т. Г.', 570.2, 6),
(3, 'Украдене щастя', 'Франко І. Я.', 540.5, 7),
(4, 'Пригоди в лісовій школі', 'Нестайко В. З.', 360.9, 3);

CREATE TABLE book1 AS
SELECT * FROM book;

SELECT * FROM supply;

CREATE TABLE book2 AS
SELECT * FROM book;

SELECT * FROM book2;
