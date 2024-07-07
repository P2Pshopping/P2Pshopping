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



CREATE TABLE review (
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    transactionId NUMBER NOT NULL,
    title VARCHAR2(200) NOT NULL,
    detail CLOB NOT NULL,
    rating NUMBER(10) DEFAULT 10,
    views NUMBER DEFAULT 0 NOT NULL,
    likes NUMBER DEFAULT 0 NOT NULL,
    ofile VARCHAR2(200),
    sfile VARCHAR2(200),
    createDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updateDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_review_transaction FOREIGN KEY (transactionId) REFERENCES transactions(id)
);

CREATE TABLE ChatRoom (
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    buyerId NUMBER NOT NULL,
    sellerId NUMBER NOT NULL,
    createdDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_chatRoom_buyer FOREIGN KEY (buyerId) REFERENCES users(id),
    CONSTRAINT fk_chatRoom_seller FOREIGN KEY (sellerId) REFERENCES users(id)
);


CREATE TABLE Message (
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    chatRoomId NUMBER NOT NULL,
    senderId NUMBER NOT NULL,
    messageText CLOB NOT NULL,
    sentDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_message_chatRoom FOREIGN KEY (chatRoomId) REFERENCES ChatRoom(id),
    CONSTRAINT fk_message_sender FOREIGN KEY (senderId) REFERENCES users(id)
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

