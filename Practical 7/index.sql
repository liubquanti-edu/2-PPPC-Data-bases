
SELECT title, author, price * amount AS total
FROM book
WHERE price * amount > 4000;

SELECT author, title, price
FROM book
WHERE amount < 10;

SELECT title, author, price
FROM book
WHERE author IN ('Франко І. Я.', 'Шевченко Т. Г.') AND price > 600;

SELECT title, author, price, amount
FROM book
WHERE (price < 500 OR price > 600) AND (price * amount >= 5000);

SELECT title, price
FROM book
WHERE author IN ('Франко І. Я.', 'Нестайко В. З.');

SELECT title, author
FROM book
WHERE price BETWEEN 540.50 AND 800 AND amount IN (2, 3, 5, 7);

SELECT author, title, COUNT(*) as amount 
FROM book
WHERE price < 750 
GROUP BY author, title 
ORDER BY author ASC, amount DESC;

SELECT author, title
FROM book
WHERE amount BETWEEN 2 AND 14
ORDER BY author DESC, title ASC;

SELECT title
FROM book
WHERE LENGTH(title) > 6;

SELECT title 
FROM book
WHERE title LIKE '% в %' 
OR title LIKE 'в %' 
OR title LIKE '% в';

SELECT title
FROM book
WHERE title NOT LIKE '% %';

SELECT title, author
FROM book
WHERE author REGEXP '^[^ ]+ В\.'
AND title REGEXP '^[^ ]+ [^ ]+'
ORDER BY title ASC;

SELECT title, author
FROM book
WHERE author LIKE '% В.%' AND title LIKE '% % %'
ORDER BY title ASC;
