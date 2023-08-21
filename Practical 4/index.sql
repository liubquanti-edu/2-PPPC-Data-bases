CREATE TABLE book (book_id INTEGER PRIMARY KEY AUTOINCREMENT, title VARCHAR(50), author VARCHAR(30), price DECIMAL(8, 2), amount INT );

SELECT * FROM book;

INSERT INTO book(book_id, title, author, price, amount) VALUES(1, 'Захар Беркут', 'Франко І. Я.', 670.99, 3);
INSERT INTO book(book_id, title, author, price, amount) VALUES(2, 'Украдене щастя', 'Франко І. Я.', 540.50, 5);
INSERT INTO book(book_id, title, author, price, amount) VALUES(3, 'Пригоди в лісовій школі', 'Нестайко В. З.', 460.00, 10);
INSERT INTO book(book_id, title, author, price, amount) VALUES(4, 'Троє з Васюківки', 'Нестайко В. З.', 799.01, 2);
INSERT INTO book(book_id, title, author, price, amount) VALUES(5, 'Кобзар', 'Шевченко Т. Г.', 650.00, 15);

SELECT * FROM book;
