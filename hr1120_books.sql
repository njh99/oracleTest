--BOOK시퀀스
CREATE SEQUENCE  "HR"."BOOKS_ID_SEQ"  
MINVALUE 1 
MAXVALUE 9999999999999999999999999999 
INCREMENT BY 1 
START WITH 21 
CACHE 20 
NOORDER  
NOCYCLE  
NOKEEP  
NOSCALE  
GLOBAL ;
INSERT INTO BOOKS VALUES(books_id_seq.nextval,'hello','njh','2100','30000');
UPDATE SET;
SELECT * FROM BOOKS;
DESC BOOKS;