--고객 테이블
CREATE TABLE customer (
    id     VARCHAR2(50 CHAR) NOT NULL,
    c_name VARCHAR2(50 CHAR),
    phone  NUMBER(11) NOT NULL
);

ALTER TABLE customer ADD CONSTRAINT customer_pk PRIMARY KEY ( id );

--매장 테이블
CREATE TABLE marcket (
    marketname VARCHAR2(50 CHAR) NOT NULL,
    tel        NUMBER(11) NOT NULL,
    manager    VARCHAR2(50 CHAR)
);

ALTER TABLE marcket ADD CONSTRAINT marcket_pk PRIMARY KEY ( marketname );

--용품 테이블
CREATE TABLE product (
    code   VARCHAR2(50 CHAR) NOT NULL,
    p_name VARCHAR2(50 CHAR) NOT NULL,
    price  NUMBER(7) NOT NULL,
    amount NUMBER(5) NOT NULL
);

ALTER TABLE product ADD CONSTRAINT product_pk PRIMARY KEY ( code );

--구매 테이블
CREATE TABLE purchase (
    num        NUMBER(20) NOT NULL,
    code       VARCHAR2(50 CHAR) NOT NULL,
    id         VARCHAR2(50 CHAR) NOT NULL,
    marketname VARCHAR2(50 CHAR) NOT NULL
);

ALTER TABLE purchase ADD CONSTRAINT purchase_pk PRIMARY KEY ( num );

--외래키 선언
ALTER TABLE purchase ADD CONSTRAINT purchase_customer_fk
        FOREIGN KEY ( id ) REFERENCES customer ( id ) ON DELETE CASCADE;

ALTER TABLE purchase ADD CONSTRAINT purchase_marcket_fk
        FOREIGN KEY ( marketname ) REFERENCES marcket ( marketname ) ON DELETE CASCADE;

ALTER TABLE purchase ADD CONSTRAINT purchase_product_fk
        FOREIGN KEY ( code ) REFERENCES product ( code ) ON DELETE CASCADE;


