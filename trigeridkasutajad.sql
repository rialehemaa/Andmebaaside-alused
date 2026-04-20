create database trigeridkasutajad;
use trigeridkasutajad;

-- tabel products
CREATE TABLE products(
product_id int primary key identity(1,1),
product_name varchar(255),
brand_id int,
category_id int,
model_year smallint,
list_price decimal(10,2)
);

-- tabel product_audits (logi tabel)
CREATE TABLE product_audits(
change_id int identity primary key,
product_id int not null,
product_name varchar(255) not null,
brand_id int not null,
category_id int not null,
model_year smallint not null,
list_price decimal(10,2) not null,
updated_at datetime not null,
operation char(3) not null,
CHECK(operation='INS' OR operation='DEL')
);

-- TRIGGER (INSERT + DELETE)
CREATE TRIGGER trg_product_audit
ON products
AFTER INSERT, DELETE
AS
BEGIN
SET NOCOUNT ON;

INSERT INTO
    product_audits
        (
            product_id,
            product_name,
            brand_id,
            category_id,
            model_year,
            list_price,
            updated_at,
            operation
        )
SELECT
    i.product_id,
    product_name,
    brand_id,
    category_id,
    model_year,
    i.list_price,
    GETDATE(),
    'INS'
FROM
    inserted AS i
UNION ALL
    SELECT
        d.product_id,
        product_name,
        brand_id,
        category_id,
        model_year,
        d.list_price,
        getdate(),
        'DEL'
    FROM
        deleted AS d;
	END
-- TEST INSERT
INSERT INTO products(
    product_name, 
    brand_id, 
    category_id, 
    model_year, 
    list_price
)
VALUES (
    'Test product',
    1,
    1,
    2018,
    599
);

SELECT * FROM products;
SELECT * FROM product_audits;

-- TEST DELETE
DELETE FROM 
    products
WHERE 
    product_id = 1;


SELECT * FROM products;
SELECT * FROM product_audits;

-- vaatame andmeid (nagu SELECT näites)
SELECT 
	product_name, 
	list_price
FROM 
	products
ORDER BY 
	product_name;

-- STORED PROCEDURE loomine
CREATE PROCEDURE uspProductList
AS
BEGIN
    SELECT 
        product_name, 
        list_price
    FROM 
        products
    ORDER BY 
        product_name;
END;

EXECUTE uspProductList;

-- kustutame procedure
DROP PROCEDURE uspProductList;

GRANT SELECT
ON products TO Dariia;

GRANT INSERT
ON products TO Dariia;

GRANT SELECT, INSERT
ON products TO DariiaTest;
