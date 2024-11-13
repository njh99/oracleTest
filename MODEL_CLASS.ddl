-- 생성자 Oracle SQL Developer Data Modeler 24.3.0.275.2224
--   위치:        2024-11-08 11:47:42 KST
--   사이트:      Oracle Database 21c
--   유형:      Oracle Database 21c



CREATE USER hr IDENTIFIED BY account

unlock;

-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE lesson (
    no   NUMBER(10) NOT NULL,
    num  CHAR(2 CHAR) NOT NULL,
    name VARCHAR2(20 CHAR) NOT NULL
);

ALTER TABLE lesson ADD CONSTRAINT lesson_pk PRIMARY KEY ( no );

CREATE TABLE student (
    no           NUMBER(10) NOT NULL,
    code         CHAR(8 CHAR) NOT NULL,
    num          CHAR(2 CHAR) NOT NULL,
    name         VARCHAR2(10 CHAR) NOT NULL,
    id           VARCHAR2(8 CHAR) NOT NULL,
    pwd          VARCHAR2(8 CHAR) NOT NULL,
    juminno      CHAR(13 CHAR) NOT NULL,
    phone        CHAR(11 CHAR) NOT NULL,
    address      VARCHAR2(40 CHAR),
    email        VARCHAR2(40 CHAR) NOT NULL,
    enroll       DATE DEFAULT SYSDATE
);

ALTER TABLE student ADD CONSTRAINT student_pk PRIMARY KEY ( code );
ALTER TABLE STUDENT ADD CONSTRAINT STUDENT_ID_UK UNIQUE(ID);
ALTER TABLE STUDENT ADD CONSTRAINT STUDENT_juminno_UK UNIQUE(juminno);
ALTER TABLE STUDENT ADD CONSTRAINT STUDENT_email_UK UNIQUE(email);
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME=UPPER('STUDENT') AND CONSTRAINT_TYPE != 'C';
SELECT * FROM USER_CONS_COLUMS WHERE TABLE_NAME = 'STUDENT';

CREATE TABLE subject (
    no       NUMBER(10) NOT NULL,
    NUM CHAR(2 CHAR) NOT NULL,
    name     VARCHAR2(20 CHAR) NOT NULL
);

ALTER TABLE subject ADD CONSTRAINT subject_NUM_pk PRIMARY KEY ( NUM );

ALTER TABLE student
    ADD CONSTRAINT student_SUBJECT_num_fk FOREIGN KEY ( num )
    REFERENCES subject (NUM )
           ON DELETE CASCADE;

CREATE TABLE trainee (
    no             NUMBER(10) NOT NULL,
    code           CHAR(8 CHAR) NOT NULL,
    num            CHAR(2 CHAR) NOT NULL,
    section        VARCHAR2(10 CHAR) NOT NULL,
    register       DATE NOT NULL
    
);

ALTER TABLE trainee ADD CONSTRAINT trainee_NO_pk PRIMARY KEY ( no );
ALTER TABLE trainee
    ADD CONSTRAINT trainee_student_code_fk
        FOREIGN KEY ( code )REFERENCES student ( code );
 
ALTER TABLE trainee
    ADD CONSTRAINT trainee_subject_fk
        FOREIGN KEY ( num )
            REFERENCES subject ( NUM )
           ;
        
            
ALTER TABLE lesson
    ADD CONSTRAINT lesson_student_fk
        FOREIGN KEY ( num )
            REFERENCES student ( code );




-- Oracle SQL Developer Data Modeler 요약 보고서: 
-- 
-- CREATE TABLE                             4
-- CREATE INDEX                             0
-- ALTER TABLE                              8
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              1
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 1
