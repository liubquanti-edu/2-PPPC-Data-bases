INSERT INTO book(book_id, title, author, price, amount) VALUES(6, 'Одинийя з обманом', 'Нестайко В. З.', 480.5, 10);
SELECT * FROM book;

SELECT author, title, price
FROM book
WHERE price <= (SELECT AVG(price) FROM book)
ORDER BY price DESC;

SELECT *
FROM book
WHERE price > (SELECT MIN(price) FROM book) + 150;

SELECT author, title, SUM(amount) as total_amount
FROM book
GROUP BY author
HAVING COUNT(*) = 1;

SELECT author, title, amount
FROM book
WHERE amount < (SELECT MAX(avg_amount) FROM (SELECT AVG(amount) as avg_amount FROM book GROUP BY author) AS subquery);

SELECT author, title, price 
FROM book
WHERE price < (SELECT MAX(min_price) FROM (SELECT MIN(price) AS min_price FROM book GROUP BY author) AS author_prices) ORDER BY author ASC, price DESC;


SELECT title, author, amount as current_amount, (SELECT MAX(amount) FROM book) - amount as order_amount,
'Замовлення' as order_name FROM book WHERE amount < (SELECT MAX(amount) FROM book);
