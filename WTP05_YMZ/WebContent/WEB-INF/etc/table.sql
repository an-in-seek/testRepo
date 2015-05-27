create table FAQ(
	faq_no number(10),
	faq_title varchar2(50) not null,
	faq_content varchar2(100) not null,
	constraint faq_pk primary key (faq_no)
);

create table QNA(
	qna_no number(10),
	qna_title varchar2(50) not null,
	qna_content varchar2(100) not null,
	qna_category varchar2(20) not null,
	qna_member_id varchar2(10) not null,
	qna_hits number(10) not null,
	qna_registration_date varchar2(8) not null,
	constraint qna_pk primary key (qna_no)
);

create table member(
	member_id varchar2(10), 
	member_password varchar2(10) not null, 
	member_name varchar2(50) not null, 
	member_nickname varchar2(50) not null,
	member_birth varchar2(12) not null,
	member_sex varchar2(4) not null,
	member_address varchar2(100) not null,
	member_email varchar2(100) not null, 
	member_phone_no varchar2(20) not null,
	member_favorite_food varchar2(10) not null,
	member_mileage number(10) not null,
	member_grade varchar2(10), not null,
	join_date varchar2(8) not null, 
	constraint member_pk primary key (member_id)
);