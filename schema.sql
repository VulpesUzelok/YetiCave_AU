
--//Создание категорий\\-- 
CREATE TABLE Cats(
cat_id int,
cat_name varchar(50),
cat_nick varchar(13),
CONSTRAINT cat_primary PRIMARY KEY (cat_id,cat_name,cat_nick)
);  
create UNIQUE INDEX cat_name on Cats(cat_name);
create UNIQUE INDEX cat_nick on Cats(cat_nick);

 --//Создание лотов\\--
CREATE TABLE Lots( 
lot_id int PRIMARY KEY AUTO_INCREMENT,
lot_user_id int,
lot_win_id int,
lot_name varchar(250),
lot_cat_id int,
lot_discr text,
lot_image text,
lot_cr_date date,
lot_comp_date date,
lot_start_price int,
lot_step int
);

 --//Создание пользователя\\--
CREATE TABLE Users(
user_id int,
user_name varchar(250),
user_email varchar(250),
user_password varchar(250),
user_singup_date date,
user_image text,
user_contact varchar(18),
CONSTRAINT user_primary PRIMARY KEY (user_id,user_name,user_email)
);
create UNIQUE INDEX user_name on Users(user_name);
create UNIQUE INDEX user_email on Users(user_email);

--//Создание ставок\\-- 
CREATE TABLE Rates(
rates_id int PRIMARY KEY AUTO_INCREMENT,
lot_id int,
user_id int,
rates_date date,
rates_price int
);

 --//Создание индекса для связей\\--
CREATE INDEX cat_index on Lots(lot_cat_id);
CREATE INDEX user_index on Lots(lot_user_id);
CREATE INDEX win_index on Lots(lot_win_id);
CREATE INDEX rates_lot_index on Rates(lot_id);
CREATE INDEX rates_user_index on Rates(user_id);

--//Создание связей для таблицы Лотов(Lots)\\--
ALTER TABLE `Lots`
ADD CONSTRAINT Lots_fk1 FOREIGN KEY (lot_id) REFERENCES Rates(lot_id);
ALTER TABLE `Lots`
ADD CONSTRAINT Lots_fk2 FOREIGN KEY (lot_user_id) REFERENCES Users(user_id);
ALTER TABLE `Lots` 
ADD CONSTRAINT Lots_fk3 FOREIGN KEY (lot_cat_id) REFERENCES Cats(cat_id);
ALTER TABLE `Lots` 
ADD CONSTRAINT Lots_fk4 FOREIGN KEY (lot_win_id) REFERENCES Users(user_id);

--//Создание связей для таблицы Cтавки(Rates)\\--
ALTER TABLE `Rates` 
ADD CONSTRAINT Rates_fk1 FOREIGN KEY (user_id) REFERENCES Users(user_id);