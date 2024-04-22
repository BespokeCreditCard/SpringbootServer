CREATE DATABASE new_db;
use new_db;

select * from card74;
select * from cardImg;
select * from test;
select * from train_dev;
select * from users_dev;
select * from visualization_dev;

CREATE TABLE recommendation (
    SEQ VARCHAR(30),
    cluster_num INT,
    card_idx1 INT,
    card_idx2 INT,
    card_idx3 INT,
    card_idx4 INT,
    card_idx5 INT,
    benefit1 VARCHAR(30),
    benefit2 VARCHAR(30),
    benefit3 VARCHAR(30),
    benefit4 VARCHAR(30),
    benefit5 VARCHAR(30)
);

RENAME TABLE user TO users;
RENAME TABLE train_dev TO train;
RENAME TABLE visualization_dev TO visualization;

drop table users;

CREATE TABLE users (
    userID VARCHAR(20) NOT NULL,
    name VARCHAR(20) NOT NULL,
    password VARCHAR(100) NOT NULL,
    birth_date DATE NOT NULL,
    register_date DATE NOT NULL,
    gender CHAR(1) NOT NULL,
    address TEXT,
    grade DECIMAL(5,2),
    agreement TINYINT NOT NULL,
    digital TINYINT NOT NULL,
    contact VARCHAR(13),
    card_id Int,
    delivery_address TEXT,
    role VARCHAR(30),
    PRIMARY KEY (userID)
);

select * from card74;

select count(*) from card74;
select count(*) from cardImg;
select count(*) from recommendation;
select count(*) from test;
select count(*) from train;
select count(*) from users;
select count(*) from visualization;

select * from users;
select * from test;
select * from train;
select * from visualization;

SELECT COUNT(*) 
FROM INFORMATION_SCHEMA.COLUMNS 
Where TABLE_NAME = 'test';

SELECT COUNT(*) 
FROM INFORMATION_SCHEMA.COLUMNS 
Where TABLE_NAME = 'train';


SELECT COUNT(*) 
FROM INFORMATION_SCHEMA.COLUMNS 
Where TABLE_NAME = 'visualization';

select * from image_template;

select * from recommendation;

INSERT INTO image_template (id, url)
VALUES (12, '22.png');



CREATE TABLE image_template (
    id INT AUTO_INCREMENT PRIMARY KEY,
    url VARCHAR(255) NOT NULL
);
select * from image_template;
drop table imagetemplate;


INSERT INTO recommendation (SEQ, cluster_num, card_idx1, benefit1)
VALUES ('8YBQA0UZ1JNAPF1LPQC3', 1, 12, '모든가맹점');

