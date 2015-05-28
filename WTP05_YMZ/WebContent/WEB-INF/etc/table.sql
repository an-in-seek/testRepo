/* 회원 */
DROP TABLE MEMBER CASCADE CONSTRAINTS;

/* 맛집 */
DROP TABLE RESTAURANT CASCADE CONSTRAINTS;

/* 음식 */
DROP TABLE FOOD CASCADE CONSTRAINTS;

/* 맛집_댓글 */
DROP TABLE RESTAURANT_REPLY CASCADE CONSTRAINTS;

/* 맛집 리뷰 */
DROP TABLE REVIEW CASCADE CONSTRAINTS;

/* 리뷰_댓글 */
DROP TABLE REVIEW_REPLY CASCADE CONSTRAINTS;

/* 신고당한 맛집 */
DROP TABLE REPORTED_RESTAURANT CASCADE CONSTRAINTS;

/* 신고당한 리뷰 */
DROP TABLE REPORTED_REVIEW CASCADE CONSTRAINTS;

/* 신고당한 댓글 */
DROP TABLE REPORTED_REPLY CASCADE CONSTRAINTS;

/* 자주 묻는 질문과 답변 */
DROP TABLE FAQ CASCADE CONSTRAINTS;

/* 질문과답변 */
DROP TABLE QNA CASCADE CONSTRAINTS;

/* 회원 */
CREATE TABLE MEMBER (
	MEMBER_ID VARCHAR2(10) NOT NULL, /* 회원_ID */
	MEMBER_PASSWORD VARCHAR2(10) NOT NULL, /* 회원 비밀번호 */
	NAME VARCHAR2(30) NOT NULL, /* 회원 이름 */
	NICKNAME VARCHAR2(30) NOT NULL, /* 닉네임 */
	BIRTH VARCHAR2(12) NOT NULL, /* 생일 */
	SEX VARCHAR2(4) NOT NULL, /* 성별 */
	ZIPCODE VARCHAR2(10) NOT NULL, /* 우편번호 */
	ADDRESS VARCHAR2(100) NOT NULL, /* 주소 */
	DETAIL_ADDRESS VARCHAR2(100) NOT NULL, /* 상세주소 */
	EMAIL VARCHAR2(100) NOT NULL, /* 이메일 */
	PHONE_NO VARCHAR2(20) NOT NULL, /* 전환번호 */
	FAVORITE_FOOD VARCHAR2(30), /* 선호음식 */
	MILEAGE NUMBER(10) NOT NULL, /* 마일리지 */
	GRADE VARCHAR2(10) NOT NULL, /* 등급 */
	JOIN_DATE VARCHAR2(8) NOT NULL /* 가입일 */
);
ALTER TABLE MEMBER ADD PRIMARY KEY (MEMBER_ID);

/* 맛집 */
CREATE TABLE RESTAURANT (
	RESTAURANT_NO NUMBER(10) NOT NULL, /* 맛집 번호 */
	RESTAURANT_NAME VARCHAR2(30) NOT NULL, /* 맛집 이름 */
	CATEGORY VARCHAR2(12) NOT NULL, /* 분류 */
	PHONE_NO VARCHAR2(20) NOT NULL, /* 전화번호 */
	ADDRESS VARCHAR2(100) NOT NULL, /* 주소 */
	DESCRIPTION CLOB NOT NULL, /* 설명 */
	PICTURE_NAME VARCHAR2(70), /* 사진 이름 */
	SCORE NUMBER(2) NOT NULL, /* 평점 */
	HITS NUMBER(10) NOT NULL, /* 조회수 */
	THEME VARCHAR2(12) NOT NULL, /* 테마 */
	REG_DATE VARCHAR2(8) NOT NULL, /* 등록일 */
	REPLY_COUNT NUMBER(4) NOT NULL, /* 댓글수 */
	BUILDING_NAME VARCHAR2(30) NOT NULL, /* 건물이름 */
	FLOOR VARCHAR2(2) NOT NULL /* 층수 */
);
ALTER TABLE RESTAURANT ADD PRIMARY KEY (RESTAURANT_NO);

/* 음식 */
CREATE TABLE FOOD (
	FOOD_NO NUMBER(10) NOT NULL, /* 음식번호 */
	FOOD_NAME VARCHAR2(30) NOT NULL, /* 음식이름 */
	FOOD_PRICE NUMBER(10) NOT NULL, /* 음식가격 */
	FOOD_DESCRIPTION CLOB NOT NULL, /* 음식설명 */
	RESTAURANT_NO NUMBER(10) NOT NULL /* 맛집 번호 */
);
ALTER TABLE FOOD ADD PRIMARY KEY (FOOD_NO);

/* 맛집_댓글 */
CREATE TABLE RESTAURANT_REPLY (
	RESTAURANT_REPLY_NO NUMBER(10) NOT NULL, /* 맛집 댓글 번호 */
	REG_DATE VARCHAR2(8) NOT NULL, /* 등록일 */
	CONTENT CLOB NOT NULL, /* 내용 */
	SCORE NUMBER(2) NOT NULL, /* 평점 */
	MEMBER_ID VARCHAR2(10) NOT NULL, /* 회원_ID */
	RESTAURANT_NO NUMBER(10) NOT NULL /* 맛집게시물번호 */
);
ALTER TABLE RESTAURANT_REPLY ADD PRIMARY KEY (RESTAURANT_REPLY_NO);

/* 맛집 리뷰 */
CREATE TABLE REVIEW (
	REVIEW_NO NUMBER(10) NOT NULL, /* 리뷰 번호 */
	TITLE VARCHAR2(60) NOT NULL, /* 제목 */
	CONTENT CLOB NOT NULL, /* 내용 */
	PICTURE_NAME VARCHAR2(70), /* 사진_이름 */
	HITS NUMBER(10) NOT NULL, /* 조회수 */
	RECOMMEND NUMBER(4) NOT NULL, /* 추천수 */
	REG_DATE VARCHAR2(8) NOT NULL, /* 등록일 */
	MEMBER_ID VARCHAR2(10) NOT NULL /* 회원_ID */
);
ALTER TABLE REVIEW ADD PRIMARY KEY (REVIEW_NO);

/* 리뷰_댓글 */
CREATE TABLE REVIEW_REPLY (
	REVIEW_REPLY_NO NUMBER(10) NOT NULL, /* 리뷰댓글번호 */
	REG_DATE VARCHAR2(8) NOT NULL, /* 등록일 */
	CONTENT CLOB NOT NULL, /* 내용 */
	MEMBER_ID VARCHAR2(10) NOT NULL, /* 회원_ID */
	REVIEW_NO NUMBER(10) NOT NULL /* 리뷰 번호 */
);
ALTER TABLE REVIEW_REPLY ADD PRIMARY KEY (REVIEW_REPLY_NO);

/* 신고당한 맛집 */
CREATE TABLE REPORTED_RESTAURANT (
	REPORTED_RESTAURANT_NO NUMBER(10) NOT NULL, /* 게시물 번호 */
	CATEGORY VARCHAR2(12) NOT NULL, /* 분류 */
	BBS_NO NUMBER(10) NOT NULL, /* 게시판 번호 */
	STATE VARCHAR2(12) NOT NULL, /* 상태 */
	REASON VARCHAR2(12) NOT NULL, /* 이유 */
	REPORTER_ID VARCHAR2(10) NOT NULL/* 신고자_ID */
);
ALTER TABLE REPORTED_RESTAURANT ADD PRIMARY KEY (REPORTED_RESTAURANT_NO);

/* 신고당한 리뷰 */
CREATE TABLE REPORTED_REVIEW (
	REPORTED_REVIEW_NO NUMBER(10) NOT NULL, /* 게시물 번호 */
	CATEGORY VARCHAR2(12) NOT NULL, /* 분류 */
	BBS_NO NUMBER(10) NOT NULL, /* 게시판 번호 */
	STATE VARCHAR2(12) NOT NULL, /* 상태 */
	REASON VARCHAR2(12) NOT NULL, /* 이유 */
	REPORTER_ID VARCHAR2(10) NOT NULL/* 신고자_ID */
);
ALTER TABLE REPORTED_REVIEW ADD PRIMARY KEY (REPORTED_REVIEW_NO);

/* 신고당한 댓글 */
CREATE TABLE REPORTED_REPLY (
	REPORTED_REPLY_NO NUMBER(10) NOT NULL, /* 댓글 번호 */
	CATEGORY VARCHAR2(12) NOT NULL, /* 분류 */
	CONTENT CLOB NOT NULL, /* 내용 */
	STATE VARCHAR2(12) NOT NULL, /* 상태 */
	REASON VARCHAR2(12) NOT NULL, /* 이유 */
	REPORTER_ID VARCHAR2(10) NOT NULL /* 신고자 id */
);
ALTER TABLE REPORTED_REPLY ADD PRIMARY KEY (REPORTED_REPLY_NO);

/* 자주 묻는 질문과 답변 */
CREATE TABLE FAQ (
	FAQ_NO NUMBER(10) NOT NULL, /* 게시물 번호 */
	FAQ_TITLE VARCHAR2(60) NOT NULL, /* 제목 */
	FAQ_CONTENT CLOB NOT NULL /* 내용 */
);
ALTER TABLE FAQ ADD PRIMARY KEY (FAQ_NO);

insert into FAQ (faq_no, faq_title, faq_content) values(1, '마일리지 충전하는 방법', '마일리지를 충전하려면 어떻게 해야되나요?');
insert into FAQ (faq_no, faq_title, faq_content) values(2, '마일리지 충전하는 방법', '마일리지를 충전하려면 어떻게 해야되나요?');
insert into FAQ (faq_no, faq_title, faq_content) values(3, '마일리지 충전하는 방법', '마일리지를 충전하려면 어떻게 해야되나요?');
insert into FAQ (faq_no, faq_title, faq_content) values(4, '마일리지 충전하는 방법', '마일리지를 충전하려면 어떻게 해야되나요?');
insert into FAQ (faq_no, faq_title, faq_content) values(5, '마일리지 충전하는 방법', '마일리지를 충전하려면 어떻게 해야되나요?');
insert into FAQ (faq_no, faq_title, faq_content) values(6, '마일리지 충전하는 방법', '마일리지를 충전하려면 어떻게 해야되나요?');
insert into FAQ (faq_no, faq_title, faq_content) values(7, '마일리지 충전하는 방법', '마일리지를 충전하려면 어떻게 해야되나요?');
insert into FAQ (faq_no, faq_title, faq_content) values(8, '마일리지 충전하는 방법', '마일리지를 충전하려면 어떻게 해야되나요?');
insert into FAQ (faq_no, faq_title, faq_content) values(9, '마일리지 충전하는 방법', '마일리지를 충전하려면 어떻게 해야되나요?');
insert into FAQ (faq_no, faq_title, faq_content) values(10, '마일리지 충전하는 방법', '마일리지를 충전하려면 어떻게 해야되나요?');

/* 질문과답변 */
CREATE TABLE QNA (
	QNA_NO NUMBER(10) NOT NULL, /* 게시물 번호 */
	QNA_TITLE VARCHAR2(60) NOT NULL, /* 제목 */
	QNA_CATEGORY VARCHAR2(12) NOT NULL, /* 카테고리 */
	QNA_REGISTRATION_DATE VARCHAR2(8) NOT NULL, /* 등록일 */
	QNA_HITS NUMBER(10) NOT NULL, /* 조회수 */
	QNA_CONTENT CLOB NOT NULL, /* 내용 */
	MEMBER_ID VARCHAR2(10) NOT NULL /* 회원_ID */
);
ALTER TABLE QNA ADD PRIMARY KEY (QNA_NO);
DROP TABLE QNA CASCADE CONSTRAINTS;

insert into QNA (qna_no, qna_title, qna_category, qna_registration_date, qna_hits, qna_content, member_id) 
values(1, '회원탈퇴 어떻게 해요?', '회원관련', '20150505', 1, '안녕하세요! 관리자님 제가 회원탈퇴를 하려고 하는데 어떻게 해야되나요?', 'user01');
insert into QNA (qna_no, qna_title, qna_category, qna_registration_date, qna_hits, qna_content, member_id) 
values(2, '회원탈퇴 어떻게 해요?', '회원관련', '20150405', 2, '안녕하세요! 관리자님 제가 회원탈퇴를 하려고 하는데 어떻게 해야되나요?', 'user01');
insert into QNA (qna_no, qna_title, qna_category, qna_registration_date, qna_hits, qna_content, member_id) 
values(3, '회원탈퇴 어떻게 해요?', '회원관련', '20150405', 3, '안녕하세요! 관리자님 제가 회원탈퇴를 하려고 하는데 어떻게 해야되나요?', 'user01');
insert into QNA (qna_no, qna_title, qna_category, qna_registration_date, qna_hits, qna_content, member_id) 
values(4, '회원탈퇴 어떻게 해요?', '회원관련', '20150205', 14, '안녕하세요! 관리자님 제가 회원탈퇴를 하려고 하는데 어떻게 해야되나요?', 'user01');
insert into QNA (qna_no, qna_title, qna_category, qna_registration_date, qna_hits, qna_content, member_id) 
values(5, '회원탈퇴 어떻게 해요?', '회원관련', '20150105', 15, '안녕하세요! 관리자님 제가 회원탈퇴를 하려고 하는데 어떻게 해야되나요?', 'user01');
insert into QNA (qna_no, qna_title, qna_category, qna_registration_date, qna_hits, qna_content, member_id) 
values(6, '회원탈퇴 어떻게 해요?', '회원관련', '20150501', 16, '안녕하세요! 관리자님 제가 회원탈퇴를 하려고 하는데 어떻게 해야되나요?', 'user01');
insert into QNA (qna_no, qna_title, qna_category, qna_registration_date, qna_hits, qna_content, member_id) 
values(7, '회원탈퇴 어떻게 해요?', '회원관련', '20150502', 17, '안녕하세요! 관리자님 제가 회원탈퇴를 하려고 하는데 어떻게 해야되나요?', 'user01');
insert into QNA (qna_no, qna_title, qna_category, qna_registration_date, qna_hits, qna_content, member_id) 
values(8, '회원탈퇴 어떻게 해요?', '회원관련', '20150503', 18, '안녕하세요! 관리자님 제가 회원탈퇴를 하려고 하는데 어떻게 해야되나요?', 'user01');
insert into QNA (qna_no, qna_title, qna_category, qna_registration_date, qna_hits, qna_content, member_id) 
values(9, '회원탈퇴 어떻게 해요?', '회원관련', '20150504', 19, '안녕하세요! 관리자님 제가 회원탈퇴를 하려고 하는데 어떻게 해야되나요?', 'user01');
insert into QNA (qna_no, qna_title, qna_category, qna_registration_date, qna_hits, qna_content, member_id) 
values(11, '회원탈퇴 어떻게 해요?', '회원관련', '20150506', 20, '안녕하세요! 관리자님 제가 회원탈퇴를 하려고 하는데 어떻게 해야되나요?', 'user01');



ALTER TABLE FOOD 
ADD FOREIGN KEY (RESTAURANT_NO) 
REFERENCES RESTAURANT (RESTAURANT_NO);

ALTER TABLE RESTAURANT_REPLY
ADD FOREIGN KEY (RESTAURANT_NO)
REFERENCES RESTAURANT (RESTAURANT_NO);

ALTER TABLE RESTAURANT_REPLY
ADD FOREIGN KEY (MEMBER_ID)
REFERENCES MEMBER (MEMBER_ID);

ALTER TABLE REVIEW
ADD FOREIGN KEY (MEMBER_ID)
REFERENCES MEMBER (MEMBER_ID);

ALTER TABLE REVIEW_REPLY
ADD FOREIGN KEY (REVIEW_NO)
REFERENCES REVIEW (REVIEW_NO);

ALTER TABLE REPORTED_RESTAURANT
ADD FOREIGN KEY (REPORTER_ID)
REFERENCES MEMBER (MEMBER_ID);

ALTER TABLE REPORTED_REVIEW
ADD FOREIGN KEY (REPORTER_ID)
REFERENCES MEMBER (MEMBER_ID);

ALTER TABLE REPORTED_REPLY
ADD FOREIGN KEY (REPORTER_ID)
REFERENCES MEMBER (MEMBER_ID);

ALTER TABLE QNA
ADD FOREIGN KEY (MEMBER_ID)
REFERENCES MEMBER (MEMBER_ID);