-- hw02

-- 1
CREATE TABLE product (
	isbn CHAR(8) primary key,
    name VARCHAR(50) not null,
    price INT not null
);

desc product;


-- 2
INSERT INTO product
	VALUES('123-1-10','샘숭TV', 200000);
    
INSERT INTO product
	VALUES('123-1-11','샘숭노트북', 250000);
    
INSERT INTO product
	VALUES('123-1-12','엘쥐TV', 150000);
    
INSERT INTO product
	VALUES('123-1-13','엘쥐노트북', 300000);
    
INSERT INTO product
	VALUES('123-1-14','HP노트북', 100000);

-- 3
select name, price*0.85 as price
	from product;

-- 4
UPDATE product SET price = price*0.8
	WHERE name LIKE '%TV%';
select * from product;

-- 5
select sum(price)
	from product;
