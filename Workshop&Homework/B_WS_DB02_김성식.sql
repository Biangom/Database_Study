-- WS02

-- 1
CREATE TABLE book (
	isbn CHAR(8) primary key,
    title VARCHAR(50) not null,
    author VARCHAR(10) not null,
    publisher VARCHAR(15) not null,
    price INT not null,
    description VARCHAR(200)
);

desc book;


-- 2
INSERT INTO book
	VALUES('123-1-14','Java와 coffee', 'diana', '자바닷컴', 8000, '삶의 즐거움');
    
INSERT INTO book(isbn, title, author, publisher, price)
	VALUES('555-23-2','AI와 미래', '김현주', '미래닷컴', 20000);
    
INSERT INTO book
	VALUES('123-2-15','Java와 놀기', '김태희', '자바닷컴', 22000, 'Java 정복');
    
INSERT INTO book
	VALUES('123-6-24','Java와 알고리즘', '서민규', '자바닷컴', 20000, '성능 업!!');
    
INSERT INTO book(isbn, title, author, publisher, price)
	VALUES('423-5-36','IoT세상', '이세준', '미래닷컴', 25000);

SET SQL_DAFE_UPDATES = 0; -- 업데이트 딜리트 시 안전모드 옵션을 꺼줘야 workbecn에서 동작함
-- 3
UPDATE book SET price = price*0.9;

-- 4
UPDATE book SET price = price*1.2
	WHERE title LIKE '%AI%';

-- 5
DELETE FROM book
	WHERE title LIKE '%Java%' and price < 10000;

-- 6
SELECT publisher, count(*) as '개수', SUM(price), AVG(price)
	FROM book
    GROUP BY publisher
    