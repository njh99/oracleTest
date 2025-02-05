-- 코드 그룹 테이블
CREATE TABLE code_group (
    group_code VARCHAR2(3) NOT NULL,
    group_name VARCHAR2(30) NOT NULL,
    use_yn     VARCHAR2(1) DEFAULT 'Y',
    reg_date   DATE DEFAULT sysdate,
    upd_date   DATE DEFAULT sysdate,
    PRIMARY KEY ( group_code )
);

-- 코드 상세 테이블
CREATE TABLE code_detail (
    group_code VARCHAR2(3) NOT NULL,
    code_value VARCHAR2(3) NOT NULL,
    code_name  VARCHAR2(30) NOT NULL,
    sort_seq   NUMBER NOT NULL,
    use_yn     VARCHAR2(1) DEFAULT 'Y',
    reg_date   DATE DEFAULT sysdate,
    upd_date   DATE DEFAULT sysdate,
    PRIMARY KEY ( group_code,
                  code_value )
);
-- 회원테이블
CREATE TABLE member (
    user_no   NUMBER(5) NOT NULL,
    user_id   VARCHAR2(50) NOT NULL,
    user_pw   VARCHAR2(100) NOT NULL,
    user_name VARCHAR2(100) NOT NULL,
    job       VARCHAR2(3) DEFAULT '00',
    coin      NUMBER(10) DEFAULT 0,
    reg_date  DATE DEFAULT sysdate,
    upd_date  DATE DEFAULT sysdate,
    enabled   VARCHAR2(1) DEFAULT '1',
    PRIMARY KEY ( user_no )
);
select *from member_auth;
--회원 테이블 sequence
CREATE SEQUENCE member_seq START WITH 1 INCREMENT BY 1;

-- 사용자 권한 테이블
CREATE TABLE member_auth (
    user_no NUMBER(5) NOT NULL,
    auth    VARCHAR2(50) NOT NULL
);

-- 회원 테이블과 사용자 권한 테이블 조인 제약조건
ALTER TABLE member_auth
    ADD CONSTRAINT fk_member_auth_user_no FOREIGN KEY ( user_no )
        REFERENCES member ( user_no );

--사용자 로그인 유지 테이블(READ ME)
CREATE TABLE persistent_logins (
    username  VARCHAR2(64) NOT NULL,
    series    VARCHAR2(64) NOT NULL,
    token     VARCHAR2(64) NOT NULL,
    last_used DATE NOT NULL,
    PRIMARY KEY ( series )
);

-- 회원 게시판 테이블
CREATE TABLE board (
    board_no NUMBER NOT NULL,
    title    VARCHAR2(200) NOT NULL,
    content  VARCHAR2(3000),
    writer   VARCHAR2(50) NOT NULL,
    reg_date DATE DEFAULT sysdate,
    PRIMARY KEY ( board_no )
);
-- 게시판 시퀀스
CREATE SEQUENCE board_seq START WITH 1 INCREMENT BY 1;

-- 공지사항 테이블
CREATE TABLE notice (
    notice_no NUMBER NOT NULL,
    title     VARCHAR2(200) NOT NULL,
    content   VARCHAR2(3000),
    reg_date  DATE DEFAULT sysdate,
    PRIMARY KEY ( notice_no )
);

-- 공지사항 시퀀스
CREATE SEQUENCE notice_seq START WITH 1 INCREMENT BY 1;

-- 상품테이블
CREATE TABLE item (
    item_id     NUMBER(10) NOT NULL,
    item_name   VARCHAR2(30) NOT NULL,
    price       NUMBER(7) NOT NULL,
    description VARCHAR2(500) NOT NULL,
    picture_url VARCHAR2(200),
    preview_url VARCHAR2(200),
    PRIMARY KEY ( item_id )
);

-- 상품 시퀀스
CREATE SEQUENCE item_seq START WITH 1 INCREMENT BY 1;

-- 코인 충전 내역 테이블
CREATE TABLE charge_coin_history (
    history_no NUMBER(10) NOT NULL,
    user_no    NUMBER(10) NOT NULL,
    amount     NUMBER(10) NOT NULL,
    reg_date   DATE DEFAULT sysdate,
    PRIMARY KEY ( history_no )
);
-- 코인 충전 테이블 시퀀스
CREATE SEQUENCE charge_coin_history_seq START WITH 1 INCREMENT BY 1;

-- 구매 테이블
CREATE TABLE user_item (
    user_item_no NUMBER(10) NOT NULL,
    user_no      NUMBER(10) NOT NULL,
    item_id      NUMBER(10) NOT NULL,
    reg_date     DATE DEFAULT sysdate,
    PRIMARY KEY ( user_item_no )
);
--구매 테이블 시퀀스
CREATE SEQUENCE user_item_seq START WITH 1 INCREMENT BY 1;

-- 구매내역 테이블
CREATE TABLE pay_coin_history (
    history_no NUMBER(10) NOT NULL,
    user_no    NUMBER(10) NOT NULL,
    item_id    NUMBER(10) NOT NULL,
    amount     NUMBER(10) NOT NULL,
    reg_date   DATE DEFAULT sysdate,
    PRIMARY KEY ( history_no )
);
-- 구매내역 테이블 시퀀스
CREATE SEQUENCE pay_coin_history_seq START WITH 1 INCREMENT BY 1;
















CREATE TABLE TossPayment (
    payment_id VARCHAR2(255) NOT NULL PRIMARY KEY,
    order_id number(16) NOT NULL UNIQUE,
    toss_order_id VARCHAR2(255) NOT NULL,
    toss_payment_key VARCHAR2(255) NOT NULL UNIQUE,
    toss_payment_method ENUM('가상계좌','간편결제','게임문화상품권','계좌이체','도서문화상품권','문화상품권','카드','휴대폰') NOT NULL,
    toss_payment_status ENUM('ABORTED','CANCELED','DONE','EXPIRED','IN_PROGRESS','PARTIAL_CANCELED','READY','WAITING_FOR_DEPOSIT') NOT NULL,
    total_amount number NOT NULL,
    approved_at date(6) DEFAULT NULL,
    requested_at date(6) NOT NULL,
    CONSTRAINT fk_order_id FOREIGN KEY (order_id) REFERENCES orders(order_id)
);