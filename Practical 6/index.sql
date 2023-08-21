SELECT * FROM book;

SELECT author, title, price FROM book;

SELECT title AS Назва, author AS Автор FROM book;

SELECT title, amount, amount * 1.65 AS pack FROM book;

SELECT title, author, amount, ROUND(price * 0.3, 2) AS new_price FROM book;

SELECT author, title, ROUND(
  CASE 
    WHEN author = 'Франко І.Я.' THEN price * 1.1 
    WHEN author = 'Шевченко Т.Г.' THEN price * 1.05 
    ELSE price
  END, 2
) AS new_price FROM book;
