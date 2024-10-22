	(1.3.4) boards테이블 수정
	(1.3.6) reviews, transactions테이블 수정
-----------------------------------------------------------	
-----------------------------------------------------------
-----------------------------------------------------------

<DB ver1.3.6>
	
	

<테이블>
CREATE TABLE users (
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    username VARCHAR2(20) UNIQUE,
    name VARCHAR2(20) NOT NULL,
    email VARCHAR2(50) NOT NULL,
    phone VARCHAR2(13) NOT NULL,
    address VARCHAR2(120) NOT NULL,
    password CHAR(64) NOT NULL,
    birth number,
    nickname varchar2(20),
    kakaoId NUMBER,
    naverId NUMBER,
    provinceId NUMBER,
    cityId NUMBER,
    districtId NUMBER,
    active NUMBER(1) DEFAULT 1;
	auth VARCHAR2(10) DEFAULT 'user',
    createDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE category (
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    name VARCHAR2(40) UNIQUE NOT NULL,
    url VARCHAR2(100) UNIQUE
);

CREATE TABLE subCategory (
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    name VARCHAR2(40) UNIQUE NOT NULL,
    url VARCHAR2(100) UNIQUE,
    categoryId NUMBER NOT NULL,
    FOREIGN KEY (categoryId) REFERENCES category(id)
);


CREATE TABLE product (
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    productName VARCHAR2(120) UNIQUE NOT NULL,
    categoryId NUMBER NOT NULL,
    price NUMBER NOT NULL,
    sold char check (sold in (0,1)),
    detail CLOB NOT NULL,
    roadAddrPart1 VARCHAR(255),
    addrDetail VARCHAR(255),
    subCategoryId NUMBER NOT NULL,
    imgUrl_1 VARCHAR2(100) NOT NULL,
    imgUrl_2 VARCHAR2(100),
    imgUrl_3 VARCHAR2(100),
    imgUrl_4 VARCHAR2(100),
    latitude VARCHAR(50),
    longitude VARCHAR(50),
    writerId NUMBER NOT NULL,
    createDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updateDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_product_category FOREIGN KEY (categoryId) REFERENCES category(id),
    CONSTRAINT fk_product_users FOREIGN KEY (writerId) REFERENCES users(id)
	CONSTRAINT fk_product_subcategory FOREIGN KEY (subCategoryId) REFERENCES subCategory(id)
    );

CREATE TABLE favorite (
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    userId NUMBER NOT NULL,
    productId NUMBER NOT NULL,
    createDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_favorite_users FOREIGN KEY (userId) REFERENCES users(id),
    CONSTRAINT fk_favorite_product FOREIGN KEY (productId) REFERENCES product(id)
);

CREATE TABLE boards(
	id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
	bno NUMBER NOT NULL,
	writerId NUMBER NOT NULL,
	title varchar2(200) NOT NULL,
	content varchar2(2000) NOT NULL,
	createDate DATE DEFAULT sysdate NOT NULL,
	updateDate DATE DEFAULT sysdate,
	ofile varchar2(200),
	sfile varchar2(30),
	views NUMBER DEFAULT 0 NOT NULL,
	likes NUMBER DEFAULT 0 NOT NULL,
	CONSTRAINT fk_board_users FOREIGN KEY (writerId) REFERENCES users(id)
); 

CREATE TABLE BOARD_COMMENT (
    cm_id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    cm_board NUMBER NOT NULL,
    cm_writerId VARCHAR2(15),
    cm_createDate DATE DEFAULT sysdate NOT NULL,
    cm_content VARCHAR2(1000) NOT NULL,
    CONSTRAINT FK_cm_board FOREIGN KEY (cm_board) REFERENCES boards(id)
);
(7/5 이민욱 추가했습니다)

CREATE TABLE board_likes (
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    board_id NUMBER NOT NULL,
    user_id NUMBER NOT NULL,
    UNIQUE (board_id, user_id),
    FOREIGN KEY (board_id) REFERENCES boards(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);
(7/9 이민욱 추가했습니다)


CREATE TABLE review (
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    transactionId NUMBER NOT NULL,
    writerId NUMBER NOT NULL,
    title VARCHAR2(200) NOT NULL,
    detail CLOB NOT NULL,
    rating NUMBER(10) DEFAULT 10,
    views NUMBER DEFAULT 0 NOT NULL,
    likes NUMBER DEFAULT 0 NOT NULL,
    ofile VARCHAR2(200),
    sfile VARCHAR2(200),
    writerId NUMBER NOT NULL,
 
    createDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updateDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_review_writer FOREIGN KEY (writerId) REFERENCES users(id);
    CONSTRAINT fk_review_transaction FOREIGN KEY (transactionId) REFERENCES transactions(id),
    CONSTRAINT fk_review_writer FOREIGN KEY (writerId) REFERENCES users(id)
);


(카테고리추가= 전체복사// v_categoryId NUMBER; 옆에서Ctl+엔터)
DECLARE
    v_categoryId NUMBER;
BEGIN
    -- 카테고리 삽입
    INSERT INTO category (name) VALUES ('유아 안전용품') RETURNING id INTO v_categoryId;
    INSERT INTO subCategory (name, categoryId) VALUES ('아기 모니터', v_categoryId);
    INSERT INTO subCategory (name, categoryId) VALUES ('침대 난간 및 가드', v_categoryId);
    INSERT INTO subCategory (name, categoryId) VALUES ('게이트 및 가드', v_categoryId);
    INSERT INTO subCategory (name, categoryId) VALUES ('기타 아기 및 어린이 안전용품', v_categoryId);
    INSERT INTO subCategory (name, categoryId) VALUES ('놀이펜', v_categoryId);

    INSERT INTO category (name) VALUES ('바운서, 로커 및 그네') RETURNING id INTO v_categoryId;
    INSERT INTO subCategory (name, categoryId) VALUES ('아기 바운서', v_categoryId);
    INSERT INTO subCategory (name, categoryId) VALUES ('아기 로커', v_categoryId);
    INSERT INTO subCategory (name, categoryId) VALUES ('아기 그네', v_categoryId);
    INSERT INTO subCategory (name, categoryId) VALUES ('아기 보행기', v_categoryId);

    INSERT INTO category (name) VALUES ('기저귀 용품') RETURNING id INTO v_categoryId;
    INSERT INTO subCategory (name, categoryId) VALUES ('기저귀 가방', v_categoryId);
    INSERT INTO subCategory (name, categoryId) VALUES ('기저귀 매트', v_categoryId);
    INSERT INTO subCategory (name, categoryId) VALUES ('기타 기저귀 갈이 용품', v_categoryId);
    INSERT INTO subCategory (name, categoryId) VALUES ('유아용 변기', v_categoryId);

    INSERT INTO category (name) VALUES ('수유 용품') RETURNING id INTO v_categoryId;
    INSERT INTO subCategory (name, categoryId) VALUES ('젖병 워머', v_categoryId);
    INSERT INTO subCategory (name, categoryId) VALUES ('젖병', v_categoryId);
    INSERT INTO subCategory (name, categoryId) VALUES ('유축기', v_categoryId);
    INSERT INTO subCategory (name, categoryId) VALUES ('기타 수유 용품', v_categoryId);

    INSERT INTO category (name) VALUES ('유아 옷, 신발 및 액세서리') RETURNING id INTO v_categoryId;
    INSERT INTO subCategory (name, categoryId) VALUES ('옷 묶음', v_categoryId);
    INSERT INTO subCategory (name, categoryId) VALUES ('드레스', v_categoryId);
    INSERT INTO subCategory (name, categoryId) VALUES ('청바지 및 바지', v_categoryId);
    INSERT INTO subCategory (name, categoryId) VALUES ('어린이 액세서리', v_categoryId);
    INSERT INTO subCategory (name, categoryId) VALUES ('코트 및 재킷', v_categoryId);
    INSERT INTO subCategory (name, categoryId) VALUES ('잠옷', v_categoryId);
    INSERT INTO subCategory (name, categoryId) VALUES ('기타 어린이 옷', v_categoryId);
    INSERT INTO subCategory (name, categoryId) VALUES ('신발 및 부츠', v_categoryId);
    INSERT INTO subCategory (name, categoryId) VALUES ('수영복', v_categoryId);
    INSERT INTO subCategory (name, categoryId) VALUES ('상의 및 셔츠', v_categoryId);

    INSERT INTO category (name) VALUES ('유아 및 어린이 가구') RETURNING id INTO v_categoryId;
    INSERT INTO subCategory (name, categoryId) VALUES ('욕조', v_categoryId);
    INSERT INTO subCategory (name, categoryId) VALUES ('기저귀 교환대', v_categoryId);
    INSERT INTO subCategory (name, categoryId) VALUES ('유아용 침대', v_categoryId);
    INSERT INTO subCategory (name, categoryId) VALUES ('아기 침대 및 요람', v_categoryId);
    INSERT INTO subCategory (name, categoryId) VALUES ('하이체어', v_categoryId);
    INSERT INTO subCategory (name, categoryId) VALUES ('램프, 조명 및 갓', v_categoryId);
    INSERT INTO subCategory (name, categoryId) VALUES ('기타', v_categoryId);

    INSERT INTO category (name) VALUES ('야외 장난감') RETURNING id INTO v_categoryId;
    INSERT INTO subCategory (name, categoryId) VALUES ('기타 야외 장난감', v_categoryId);
    INSERT INTO subCategory (name, categoryId) VALUES ('놀이집 및 놀이 텐트', v_categoryId);
    INSERT INTO subCategory (name, categoryId) VALUES ('모래놀이 및 물놀이 장난감', v_categoryId);
    INSERT INTO subCategory (name, categoryId) VALUES ('스쿠터', v_categoryId);
    INSERT INTO subCategory (name, categoryId) VALUES ('스케이트보드', v_categoryId);
    INSERT INTO subCategory (name, categoryId) VALUES ('미끄럼틀', v_categoryId);

    INSERT INTO category (name) VALUES ('장난감') RETURNING id INTO v_categoryId;
    INSERT INTO subCategory (name, categoryId) VALUES ('기타 장난감', v_categoryId);
END;
/

CREATE TABLE transactions (
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    sellerId NUMBER NOT NULL,
    buyerId NUMBER NOT NULL,
    productId NUMBER NOT NULL,
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_transaction_seller FOREIGN KEY (sellerId) REFERENCES users(id),
    CONSTRAINT fk_transaction_buyer FOREIGN KEY (buyerId) REFERENCES users(id),
    CONSTRAINT fk_transaction_product FOREIGN KEY (productId) REFERENCES product(id)
);


CREATE TABLE site_traffic (
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    page_url VARCHAR2(255) NOT NULL,
    visit_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    user_id NUMBER,
    CONSTRAINT fk_traffic_users FOREIGN KEY (user_id) REFERENCES users(id)
);
---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
--2차프로젝트 마지막 발표후 DB (2024.08.22)
--2차프로젝트 마지막 발표후 DB (2024.08.22)
--2차프로젝트 마지막 발표후 DB (2024.08.22)
--2차프로젝트 마지막 발표후 DB (2024.08.22)
--2차프로젝트 마지막 발표후 DB (2024.08.22)
--2차프로젝트 마지막 발표후 DB (2024.08.22)
--2차프로젝트 마지막 발표후 DB (2024.08.22)
--2차프로젝트 마지막 발표후 DB (2024.08.22)
--2차프로젝트 마지막 발표후 DB (2024.08.22)
--2차프로젝트 마지막 발표후 DB (2024.08.22)
--2차프로젝트 마지막 발표후 DB (2024.08.22)
---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
--2차프로젝트 마지막 발표후 DB (2024.08.22)
--2차프로젝트 마지막 발표후 DB (2024.08.22)
--2차프로젝트 마지막 발표후 DB (2024.08.22)
--2차프로젝트 마지막 발표후 DB (2024.08.22)
--2차프로젝트 마지막 발표후 DB (2024.08.22)
--2차프로젝트 마지막 발표후 DB (2024.08.22)
--2차프로젝트 마지막 발표후 DB (2024.08.22)
--2차프로젝트 마지막 발표후 DB (2024.08.22)
--2차프로젝트 마지막 발표후 DB (2024.08.22)
--2차프로젝트 마지막 발표후 DB (2024.08.22)
--2차프로젝트 마지막 발표후 DB (2024.08.22)


-- "C##MUSTHAVE".USERS definition

CREATE TABLE "C##MUSTHAVE"."USERS" 
   (	"ID" NUMBER GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  NOT NULL ENABLE, 
	"USERNAME" VARCHAR2(20), 
	"NAME" VARCHAR2(20) NOT NULL ENABLE, 
	"EMAIL" VARCHAR2(50) NOT NULL ENABLE, 
	"PHONE" VARCHAR2(13) NOT NULL ENABLE, 
	"ADDRESS" VARCHAR2(120) NOT NULL ENABLE, 
	"PASSWORD" CHAR(64) NOT NULL ENABLE, 
	"KAKAOID" NUMBER, 
	"NAVERID" NUMBER, 
	"PROVINCEID" NUMBER, 
	"CITYID" NUMBER, 
	"DISTRICTID" NUMBER, 
	"AUTH" VARCHAR2(10) DEFAULT 'user', 
	"CREATEDATE" TIMESTAMP (6) DEFAULT CURRENT_TIMESTAMP, 
	"NICKNAME" VARCHAR2(20), 
	"BIRTH" NUMBER, 
	"ACTIVE" NUMBER(1,0) DEFAULT 1, 
	 PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 UNIQUE ("USERNAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

CREATE UNIQUE INDEX "C##MUSTHAVE"."SYS_C008582" ON "C##MUSTHAVE"."USERS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
  CREATE UNIQUE INDEX "C##MUSTHAVE"."SYS_C008583" ON "C##MUSTHAVE"."USERS" ("USERNAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;


-- "C##MUSTHAVE".CATEGORY definition

CREATE TABLE "C##MUSTHAVE"."CATEGORY" 
   (	"ID" NUMBER GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  NOT NULL ENABLE, 
	"NAME" VARCHAR2(40) NOT NULL ENABLE, 
	"URL" VARCHAR2(100), 
	 PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 UNIQUE ("NAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 UNIQUE ("URL")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

CREATE UNIQUE INDEX "C##MUSTHAVE"."SYS_C008589" ON "C##MUSTHAVE"."CATEGORY" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
  CREATE UNIQUE INDEX "C##MUSTHAVE"."SYS_C008590" ON "C##MUSTHAVE"."CATEGORY" ("NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
  CREATE UNIQUE INDEX "C##MUSTHAVE"."SYS_C008591" ON "C##MUSTHAVE"."CATEGORY" ("URL") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;


-- "C##MUSTHAVE".SITE_TRAFFIC definition

CREATE TABLE "C##MUSTHAVE"."SITE_TRAFFIC" 
   (	"ID" NUMBER GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  NOT NULL ENABLE, 
	"PAGE_URL" VARCHAR2(255) NOT NULL ENABLE, 
	"VISIT_DATE" TIMESTAMP (6) DEFAULT CURRENT_TIMESTAMP, 
	"USER_ID" NUMBER, 
	 PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

ALTER TABLE "C##MUSTHAVE"."SITE_TRAFFIC" ADD CONSTRAINT "FK_TRAFFIC_USERS" FOREIGN KEY ("USER_ID")
	  REFERENCES "C##MUSTHAVE"."USERS" ("ID") ENABLE;

CREATE UNIQUE INDEX "C##MUSTHAVE"."SYS_C008658" ON "C##MUSTHAVE"."SITE_TRAFFIC" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;


-- "C##MUSTHAVE".SUBCATEGORY definition

CREATE TABLE "C##MUSTHAVE"."SUBCATEGORY" 
   (	"ID" NUMBER GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  NOT NULL ENABLE, 
	"NAME" VARCHAR2(40) NOT NULL ENABLE, 
	"URL" VARCHAR2(100), 
	"CATEGORYID" NUMBER NOT NULL ENABLE, 
	 PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 UNIQUE ("NAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 UNIQUE ("URL")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

ALTER TABLE "C##MUSTHAVE"."SUBCATEGORY" ADD FOREIGN KEY ("CATEGORYID")
	  REFERENCES "C##MUSTHAVE"."CATEGORY" ("ID") ENABLE;

CREATE UNIQUE INDEX "C##MUSTHAVE"."SYS_C008644" ON "C##MUSTHAVE"."SUBCATEGORY" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
  CREATE UNIQUE INDEX "C##MUSTHAVE"."SYS_C008645" ON "C##MUSTHAVE"."SUBCATEGORY" ("NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
  CREATE UNIQUE INDEX "C##MUSTHAVE"."SYS_C008646" ON "C##MUSTHAVE"."SUBCATEGORY" ("URL") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;


-- "C##MUSTHAVE".BOARDS definition

CREATE TABLE "C##MUSTHAVE"."BOARDS" 
   (	"ID" NUMBER GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  NOT NULL ENABLE, 
	"BNO" NUMBER NOT NULL ENABLE, 
	"WRITERID" NUMBER NOT NULL ENABLE, 
	"TITLE" VARCHAR2(200) NOT NULL ENABLE, 
	"CONTENT" VARCHAR2(2000) NOT NULL ENABLE, 
	"CREATEDATE" DATE DEFAULT sysdate NOT NULL ENABLE, 
	"UPDATEDATE" DATE DEFAULT sysdate, 
	"OFILE" VARCHAR2(200), 
	"SFILE" VARCHAR2(30), 
	"VIEWS" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"LIKES" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	 PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

ALTER TABLE "C##MUSTHAVE"."BOARDS" ADD CONSTRAINT "FK_BOARD_USERS" FOREIGN KEY ("WRITERID")
	  REFERENCES "C##MUSTHAVE"."USERS" ("ID") ENABLE;

CREATE UNIQUE INDEX "C##MUSTHAVE"."SYS_C008668" ON "C##MUSTHAVE"."BOARDS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;


-- "C##MUSTHAVE".BOARD_LIKES definition

CREATE TABLE "C##MUSTHAVE"."BOARD_LIKES" 
   (	"ID" NUMBER GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  NOT NULL ENABLE, 
	"BOARD_ID" NUMBER NOT NULL ENABLE, 
	"USER_ID" NUMBER NOT NULL ENABLE, 
	 PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 UNIQUE ("BOARD_ID", "USER_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

ALTER TABLE "C##MUSTHAVE"."BOARD_LIKES" ADD FOREIGN KEY ("BOARD_ID")
	  REFERENCES "C##MUSTHAVE"."BOARDS" ("ID") ENABLE;
  ALTER TABLE "C##MUSTHAVE"."BOARD_LIKES" ADD FOREIGN KEY ("USER_ID")
	  REFERENCES "C##MUSTHAVE"."USERS" ("ID") ENABLE;

CREATE UNIQUE INDEX "C##MUSTHAVE"."SYS_C008709" ON "C##MUSTHAVE"."BOARD_LIKES" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
  CREATE UNIQUE INDEX "C##MUSTHAVE"."SYS_C008710" ON "C##MUSTHAVE"."BOARD_LIKES" ("BOARD_ID", "USER_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;


-- "C##MUSTHAVE".PRODUCT definition

CREATE TABLE "C##MUSTHAVE"."PRODUCT" 
   (	"ID" NUMBER GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  NOT NULL ENABLE, 
	"PRODUCTNAME" VARCHAR2(120) NOT NULL ENABLE, 
	"CATEGORYID" NUMBER NOT NULL ENABLE, 
	"PRICE" NUMBER NOT NULL ENABLE, 
	"SOLD" CHAR(1), 
	"DETAIL" CLOB NOT NULL ENABLE, 
	"IMGURL_1" VARCHAR2(100) NOT NULL ENABLE, 
	"IMGURL_2" VARCHAR2(100), 
	"IMGURL_3" VARCHAR2(100), 
	"IMGURL_4" VARCHAR2(100), 
	"WRITERID" NUMBER NOT NULL ENABLE, 
	"CREATEDATE" TIMESTAMP (6) DEFAULT CURRENT_TIMESTAMP, 
	"UPDATEDATE" TIMESTAMP (6) DEFAULT CURRENT_TIMESTAMP, 
	"SUBCATEGORYID" NUMBER NOT NULL ENABLE, 
	"ROADADDRPART1" VARCHAR2(255), 
	"ADDRDETAIL" VARCHAR2(255), 
	"LATITUDE" VARCHAR2(50), 
	"LONGITUDE" VARCHAR2(50), 
	 CHECK (sold in (0,1)) ENABLE, 
	 PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 UNIQUE ("PRODUCTNAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 LOB ("DETAIL") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW 4000 CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES 
  STORAGE(INITIAL 262144 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;

ALTER TABLE "C##MUSTHAVE"."PRODUCT" ADD CONSTRAINT "FK_PRODUCT_SUBCATEGORY" FOREIGN KEY ("SUBCATEGORYID")
	  REFERENCES "C##MUSTHAVE"."SUBCATEGORY" ("ID") ENABLE;
  ALTER TABLE "C##MUSTHAVE"."PRODUCT" ADD CONSTRAINT "FK_PRODUCT_CATEGORY" FOREIGN KEY ("CATEGORYID")
	  REFERENCES "C##MUSTHAVE"."CATEGORY" ("ID") ENABLE;
  ALTER TABLE "C##MUSTHAVE"."PRODUCT" ADD CONSTRAINT "FK_PRODUCT_USERS" FOREIGN KEY ("WRITERID")
	  REFERENCES "C##MUSTHAVE"."USERS" ("ID") ENABLE;

CREATE UNIQUE INDEX "C##MUSTHAVE"."SYS_C008600" ON "C##MUSTHAVE"."PRODUCT" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
  CREATE UNIQUE INDEX "C##MUSTHAVE"."SYS_IL0000079775C00006$$" ON "C##MUSTHAVE"."PRODUCT" (
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
  PARALLEL (DEGREE 0 INSTANCES 0) ;
  CREATE UNIQUE INDEX "C##MUSTHAVE"."SYS_C008601" ON "C##MUSTHAVE"."PRODUCT" ("PRODUCTNAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;


-- "C##MUSTHAVE".BOARD_COMMENT definition

CREATE TABLE "C##MUSTHAVE"."BOARD_COMMENT" 
   (	"CM_ID" NUMBER GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  NOT NULL ENABLE, 
	"CM_BOARD" NUMBER NOT NULL ENABLE, 
	"CM_WRITERID" VARCHAR2(15), 
	"CM_CREATEDATE" DATE DEFAULT sysdate NOT NULL ENABLE, 
	"CM_CONTENT" VARCHAR2(1000) NOT NULL ENABLE, 
	 PRIMARY KEY ("CM_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

ALTER TABLE "C##MUSTHAVE"."BOARD_COMMENT" ADD CONSTRAINT "FK_CM_BOARD" FOREIGN KEY ("CM_BOARD")
	  REFERENCES "C##MUSTHAVE"."BOARDS" ("ID") ENABLE;

CREATE UNIQUE INDEX "C##MUSTHAVE"."SYS_C008704" ON "C##MUSTHAVE"."BOARD_COMMENT" ("CM_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;


-- "C##MUSTHAVE".FAVORITE definition

CREATE TABLE "C##MUSTHAVE"."FAVORITE" 
   (	"ID" NUMBER GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  NOT NULL ENABLE, 
	"USERID" NUMBER NOT NULL ENABLE, 
	"PRODUCTID" NUMBER NOT NULL ENABLE, 
	"CREATEDATE" TIMESTAMP (6) DEFAULT CURRENT_TIMESTAMP, 
	 PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

ALTER TABLE "C##MUSTHAVE"."FAVORITE" ADD CONSTRAINT "FK_FAVORITE_USERS" FOREIGN KEY ("USERID")
	  REFERENCES "C##MUSTHAVE"."USERS" ("ID") ENABLE;
  ALTER TABLE "C##MUSTHAVE"."FAVORITE" ADD CONSTRAINT "FK_FAVORITE_PRODUCT" FOREIGN KEY ("PRODUCTID")
	  REFERENCES "C##MUSTHAVE"."PRODUCT" ("ID") ENABLE;

CREATE UNIQUE INDEX "C##MUSTHAVE"."SYS_C008607" ON "C##MUSTHAVE"."FAVORITE" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;


-- "C##MUSTHAVE".TRANSACTIONS definition

CREATE TABLE "C##MUSTHAVE"."TRANSACTIONS" 
   (	"ID" NUMBER GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  NOT NULL ENABLE, 
	"SELLERID" NUMBER NOT NULL ENABLE, 
	"BUYERID" NUMBER NOT NULL ENABLE, 
	"PRODUCTID" NUMBER NOT NULL ENABLE, 
	"TRANSACTION_DATE" TIMESTAMP (6) DEFAULT CURRENT_TIMESTAMP, 
	 PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

ALTER TABLE "C##MUSTHAVE"."TRANSACTIONS" ADD CONSTRAINT "FK_TRANSACTION_SELLER" FOREIGN KEY ("SELLERID")
	  REFERENCES "C##MUSTHAVE"."USERS" ("ID") ENABLE;
  ALTER TABLE "C##MUSTHAVE"."TRANSACTIONS" ADD CONSTRAINT "FK_TRANSACTION_BUYER" FOREIGN KEY ("BUYERID")
	  REFERENCES "C##MUSTHAVE"."USERS" ("ID") ENABLE;
  ALTER TABLE "C##MUSTHAVE"."TRANSACTIONS" ADD CONSTRAINT "FK_TRANSACTION_PRODUCT" FOREIGN KEY ("PRODUCTID")
	  REFERENCES "C##MUSTHAVE"."PRODUCT" ("ID") ENABLE;

CREATE UNIQUE INDEX "C##MUSTHAVE"."SYS_C008686" ON "C##MUSTHAVE"."TRANSACTIONS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;


-- "C##MUSTHAVE".REVIEW definition

CREATE TABLE "C##MUSTHAVE"."REVIEW" 
   (	"ID" NUMBER GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  NOT NULL ENABLE, 
	"TRANSACTIONID" NUMBER NOT NULL ENABLE, 
	"TITLE" VARCHAR2(200) NOT NULL ENABLE, 
	"DETAIL" CLOB NOT NULL ENABLE, 
	"RATING" NUMBER(10,0) DEFAULT 10, 
	"OFILE" VARCHAR2(200), 
	"SFILE" VARCHAR2(200), 
	"CREATEDATE" TIMESTAMP (6) DEFAULT CURRENT_TIMESTAMP, 
	"UPDATEDATE" TIMESTAMP (6) DEFAULT CURRENT_TIMESTAMP, 
	"VIEWS" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"LIKES" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"WRITERID" NUMBER NOT NULL ENABLE, 
	 PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 LOB ("DETAIL") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW 4000 CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES 
  STORAGE(INITIAL 262144 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;

ALTER TABLE "C##MUSTHAVE"."REVIEW" ADD CONSTRAINT "FK_REVIEW_TRANSACTION" FOREIGN KEY ("TRANSACTIONID")
	  REFERENCES "C##MUSTHAVE"."TRANSACTIONS" ("ID") ENABLE;
  ALTER TABLE "C##MUSTHAVE"."REVIEW" ADD CONSTRAINT "FK_REVIEW_WRITER" FOREIGN KEY ("WRITERID")
	  REFERENCES "C##MUSTHAVE"."USERS" ("ID") ENABLE;

CREATE UNIQUE INDEX "C##MUSTHAVE"."SYS_C008694" ON "C##MUSTHAVE"."REVIEW" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
  CREATE UNIQUE INDEX "C##MUSTHAVE"."SYS_IL0000080425C00004$$" ON "C##MUSTHAVE"."REVIEW" (
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
  PARALLEL (DEGREE 0 INSTANCES 0) ;
