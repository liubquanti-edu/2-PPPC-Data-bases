SELECT DISTINCT author FROM book;

SELECT author, COUNT(DISTINCT title) AS Різних_книг, SUM(amount) AS Кількість_примірників 
FROM book
GROUP BY author;


SELECT author, 
ROUND(SUM(price*amount),2) AS Вартість, 
ROUND(SUM(price*amount)*0.18/100/(1+0.18/100),2) AS ПДВ,
ROUND(SUM(price*amount)/(1+0.18/100),2) AS Вартість_без_ПДВ
FROM book
GROUP BY author;


SELECT SUM(amount) AS Кількість_примірників, 
ROUND(SUM(price*amount),2) AS Вартість
FROM book;


SELECT MIN(price) AS Мінімальна_ціна, 
MAX(price) AS Максимальна_ціна, 
ROUND(AVG(DISTINCT price),2) AS Середня_ціна 
FROM book;


SELECT author, MIN(price) AS Мінімальна_ціна, MAX(price) AS Максимальна_ціна,
SUM(price*amount) AS Загальна_ціна
FROM book
GROUP BY author
HAVING Загальна_ціна > 5000
ORDER BY Мінімальна_ціна DESC;


SELECT ROUND(AVG(price), 2) AS Середня_ціна, ROUND(SUM(price * amount), 2) AS Вартість
FROM book
WHERE amount BETWEEN 5 AND 14;


SELECT author, ROUND(SUM(price*amount),2) AS Вартість 
FROM book 
WHERE title NOT IN ('Захар Беркут', 'Троє з Васюківки')
GROUP BY author 
HAVING SUM(price*amount) > 5000;
