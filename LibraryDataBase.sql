-- 관리자 정보 테이블
CREATE TABLE admins(
     admin_num      NUMBER(11)  CONSTRAINT ad_ad_num_pk  PRIMARY KEY,
     admin_name     VARCHAR2(255)  CONSTRAINT m_m_name_nn NOT NULL,
     admin_pw       VARCHAR2(255)  CONSTRAINT m_m_name_nn NOT NULL,
     admin_phone    VARCHAR2(255)  CONSTRAINT m_m_name_uk UNIQUE,
     admin_email    VARCHAR2(255)  CONSTRAINT m_m_name_nn NOT NULL,
     admin_address  VARCHAR2(255)  CONSTRAINT m_m_name_nn NOT NULL,
     admin_registrationdate  DATE  CONSTRAINT m_m_name_nn NOT NULL,
     admin_note     VARCHAR2(255)
);

-- 회원 정보 테이블
CREATE TABLE members (
     mem_num        NUMBER(11) CONSTRAINT m_m_num_pk  PRIMARY KEY,
     mem_name       VARCHAR2(255) CONSTRAINT m_m_name_nn NOT NULL,
     mem_id         VARCHAR2(255) CONSTRAINT m_m_name_uk UNIQUE,
     mem_pw         VARCHAR2(255) CONSTRAINT m_m_name_nn NOT NULL,
     mem_birthday   CHAR(6) CONSTRAINT m_m_name_nn NOT NULL,
     mem_sex        CHAR(1) CONSTRAINT m_m_sex_boolean CHECK(mem_sex IN ('0', '1')),
     mem_phone      VARCHAR2(255) CONSTRAINT m_m_name_uk UNIQUE,
     mem_email      VARCHAR2(255) CONSTRAINT m_m_name_nn NOT NULL,
     mem_address    VARCHAR2(255) CONSTRAINT m_m_name_nn NOT NULL,
     mem_note       VARCHAR2(255)     
);

-- 도서 정보 테이블
CREATE TABLE books(
     book_id        VARCHAR2(255)  CONSTRAINT b_b_id_pk  PRIMARY KEY,
     book_title     VARCHAR2(255)  CONSTRAINT b_b_title_nn NOT NULL,
     book_author    VARCHAR2(255)  CONSTRAINT b_b_author_nn NOT NULL,
     book_publisher VARCHAR2(255)  CONSTRAINT b_b_publisher_nn NOT NULL,
     book_isbn  VARCHAR2(255) CONSTRAINT b_b_isbn_uk UNIQUE,
     book_bias      NUMBER(11) DEFAULT 1,
     book_duplicates NUMBER(11) DEFAULT 1,
     book_registration_date   DATE CONSTRAINT b_b_reg_nn NOT NULL,
     book_price     NUMBER(11),
     location_id    VARCHAR2(255) CONSTRAINT b_loc_id_fk REFERENCES locations(location_id),
     book_note      VARCHAR2(255)
);

--CREATE TABLE callsign(
--     book_callsign  VARCHAR2(255)  CONSTRAINT c_b_cs_pk  PRIMARY KEY,
--     cs_classification_code VARCHAR2(255),
--     cs_sign           VARCHAR2(255),
--     cs_bias           NUMBER(11),
--     cs_duplicates     NUMBER(11)
--);

-- 도서 분류 / 위치 테이블
CREATE TABLE locations(
     location_id    CHAR(1) CONSTRAINT l_l_id_pk  PRIMARY KEY,
     location_name  VARCHAR2(255) CONSTRAINT l_l_name_nn NOT NULL
);

-- 대출 정보 테이블
CREATE TABLE check_out_info(
     check_out_id   NUMBER(11) CONSTRAINT coi_coi_id_pk PRIMARY KEY,
     book_id        VARCHAR2(255) CONSTRAINT coi_b_id_fk REFERENCES books(book_id),
     mem_num        NUMBER(11) CONSTRAINT coi_m_num_fk REFERENCES members(mem_id),
     check_out_date DATE CONSTRAINT coi_c_o_date_nn NOT NULL,
     expect_return_date DATE,
     check_in_date  DATE
);

-- 열람실 정보 테이블
CREATE TABLE readingroom(
     seat_num       NUMBER(11) CONSTRAINT r_s_num_pk PRIMARY KEY,
     table_divider  CHAR(1),
     seat_sex       CHAR(1)
);

-- 좌석 이용 정보 테이블
CREATE TABLE seat_use_details(
     use_id    NUMBER(11) CONSTRAINT sud_u_id_pk PRIMARY KEY,
     mem_num   NUMBER(11) CONSTRAINT sud_m_num_fk REFERENCES members(mem_num),
     seat_num  NUMBER(11) CONSTRAINT sud_s_num_fk REFERENCES readingroom(seat_num),
     start_time DATE CONSTRAINT sud_s_time_nn NOT NULL,
     end_time DATE
);

-- 이미지 정보 테이블
CREATE TABLE IMAGE_INFORMATION(
     image_id  NUMBER(11) CONSTRAINT i_i_id_pk PRIMARY KEY,
     image_name     VARCHAR2(255) CONSTRAINT i_i_name_nn NOT NULL, 
     image_byte_info      BLOB CONSTRAINT i_i_b_info_nn NOT NULL
);

