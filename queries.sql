--//Заполнение Cats\\--
INSERT INTO Cats(cat_id, cat_name, cat_nick)
VALUES
(null, 'Доски и лыжи', 'boards'), 
(null, 'Крепления', 'attachment'),
(null, 'Ботинки','boots'),
(null, 'Одежда','clothing'), 
(null,'Инструменты','tools'),
(null, 'Разное', 'other');

--//Заполнение таблицы Lots\\-- 
INSERT INTO Lots
(lot_id, lot_user_id, lot_winner_id, lot_name, lot_cat_id, lot_discr, lot_image, 
lot_cr_date, lot_comp_date, lot_start_price, lot_step)
VALUES
(null, 1, null, '2014 Rossignol District Snowboard', 
1 , 'Временно отсутствует', 'img/lot-1.jpg', '2020-03-27 10:34:15', '2020-03-28 10:34:15', 
10999, 500),
(null, 1, 2, 'DC Ply Mens 2016/2017 Snowboard', 
1 , 'Временно отсутствует', 'img/lot-2.jpg', '2020-03-26 01:22:05', '2020-03-27 01:22:05', 
159999, 500),
(null, 2, null, 'Крепления Union Contact Pro 2015 года размер L/XL', 
2 , 'Временно отсутствует', 'img/lot-3.jpg', '2020-03-27 22:34:15', '2020-03-28 22:34:15',  
8000, 500),
(null, 1, null, 'Ботинки для сноуборда DC Mutiny Charocal', 
3 , 'Временно отсутствует', 'img/lot-4.jpg', '2020-03-27 13:32:12', '2020-03-28 13:32:12', 
10999, 500),
(null, 3, 1, 'Куртка для сноуборда DC Mutiny Charocal', 
4 , 'Временно отсутствует', 'img/lot-5.jpg', '2020-03-26 04:34:15', '2020-03-27 04:34:15', 
7500, 500),
(null, 3, 2, 'Маска Oakley Canopy', 
6 , 'Временно отсутствует', 'img/lot-6.jpg', '2020-03-25 18:40:59', '2020-03-26 18:40:59', 
5400, 500);

--//Заполнение таблицы Users\\-- 
INSERT INTO Users 
(user_id, user_image, user_contact, 
user_name, user_email, user_password, user_signup_date)
VALUES 
(null, null, null, 'Lenar', 'Kindly@mail.ru', 'FallotNewVegasIsBestGameForME', '20181023'),
(null, null, null, 'Vulpes','Otocoyn@mail.ru', 'TrueToCaesar4815', '20160905'),
(null, null, null, 'Giorno', 'JOJO@mail.com', 'Pepa24525462', '20201207');

--//Заполнение таблицы Rates\\-- 
INSERT INTO Rates(rates_id, lot_id, user_id, rates_date, rates_price)
VALUES
(null, 1, 3, '2020-01-01 14:10:00', 48210),
(null, 1, 2, '2020-01-01 15:20:00', 45782);

--//Запросы\\-- 
SELECT cat_name
FROM Cats

SELECT DISTINCT lot_name, lot_start_price, lot_image, MAX(rates_price) as 'Маскимальная ставка', count(c.rate_id) as 'Количество ставок', categ_name 
FROM Cats a left join lots b on cat_id=lot_cat_id left join 
rates c on b.lot_id=c.lot_id
WHERE "2020-01-01 15:15:15"<lot_comp_date
group by lot_name
ORDER BY  lot_cr_date DESC
SELECT lot_name, cat_name 
FROM Cats a inner join lots b on cat_id=lot_cat_id
WHERE lot_id=2

UPDATE lots 
SET lot_name="Крепления Union Contact Pro 2015 года размер L/XXXL"
WHERE lot_id=3

SELECT rates_id, lot_name, rates_price
from Rates a inner join lots b on a.lot_id=b.lot_id
where a.lot_id=1
ORDER BY  rates_date desc