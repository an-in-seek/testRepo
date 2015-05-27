create table FAQ(
	faq_no number(10),
	faq_title varchar2(50) not null,
	faq_content varchar2(100) not null,
	constraint faq_pk primary key (faq_no)
);
drop table faq;
INSERT INTO faq (faq_no, faq_title, faq_content) VALUES(1, '마일리지는 어떻게 충전하나요?', '안녕하세요! 만나서 반갑습니다.');
INSERT INTO faq (faq_no, faq_title, faq_content) VALUES(2, '회원탈퇴는 어떻게 하나요?', '안녕하세요! 탈퇴하시면 안됩니다.^^');
select * from faq;

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
drop table qna;
INSERT INTO qna (qna_no, qna_title, qna_content, qna_category, qna_member_id, qna_hits, qna_registration_date) VALUES(1, '회원탈퇴 어떻게 하나요?', '회원탈퇴 하는 방법좀 알려주세요', '회원관련', 'user01', 21, '20111231');
select * from qna;

drop table member;

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

-- 사진 경로 컬럼 추가
alter table member add(picture_name varchar2(13)) -- 추가 이므로 nullable로 한다. 파일명을 밀리초로 변경 예정 - 13자리

delete from member;
INSERT INTO MEMBER (ID, PASSWORD, NAME, EMAIL, JOIN_DATE) VALUES('id-1', '1111', '김철수', 'kcs@abc.com', '20111231');
INSERT INTO MEMBER (ID, PASSWORD, NAME, EMAIL, JOIN_DATE) VALUES('id-2', '1111', '유영희', 'ryuyh@naver.com', '20140811');
INSERT INTO MEMBER (ID, PASSWORD, NAME, EMAIL, JOIN_DATE) VALUES('id-3', '1111', '최수경', 'choisk@korea.com', '20140811');
INSERT INTO MEMBER (ID, PASSWORD, NAME, EMAIL, JOIN_DATE) VALUES('id-4', '1111', '김영수', 'kim@abc.com', '20130701');
INSERT INTO MEMBER (ID, PASSWORD, NAME, EMAIL, JOIN_DATE) VALUES('id-5', '1111', '박경수', 'parkks@daum.net', '20140327');
INSERT INTO MEMBER (ID, PASSWORD, NAME, EMAIL, JOIN_DATE) VALUES('id-6', '1111', '서유석', 'seous@daum.net', '20120830');
INSERT INTO MEMBER (ID, PASSWORD, NAME, EMAIL, JOIN_DATE) VALUES('id-7', '1111', '임경희', 'limkh@nate.com', '20140508');
INSERT INTO MEMBER (ID, PASSWORD, NAME, EMAIL, JOIN_DATE) VALUES('id-8', '1111', '홍길동', 'honggd@kosta.or.kr', '20100116');
INSERT INTO MEMBER (ID, PASSWORD, NAME, EMAIL, JOIN_DATE) VALUES('id-9', '1111', '홍길순', 'rlfehdghd@kosta.or.kr', '20110916');
INSERT INTO MEMBER (ID, PASSWORD, NAME, EMAIL, JOIN_DATE) VALUES('id-10', '1111', '박영수', 'duadkdoe9@kosta.or.kr', '20140516');
INSERT INTO MEMBER (ID, PASSWORD, NAME, EMAIL, JOIN_DATE) VALUES('id-11', '1111', '이명수', 'audtnfll@kosta.or.kr', '20110111');
INSERT INTO MEMBER (ID, PASSWORD, NAME, EMAIL, JOIN_DATE) VALUES('id-12', '1111', '이길영', 'rlfdudlee@kosta.or.kr', '19991126');
INSERT INTO MEMBER (ID, PASSWORD, NAME, EMAIL, JOIN_DATE) VALUES('id-13', '1111', '유영미', 'dudaldb@kosta.or.kr', '20130117');
INSERT INTO MEMBER (ID, PASSWORD, NAME, EMAIL, JOIN_DATE) VALUES('id-14', '1111', '채수길', 'cotnrlf@kosta.or.kr', '20050326');
INSERT INTO MEMBER (ID, PASSWORD, NAME, EMAIL, JOIN_DATE) VALUES('id-15', '1111', '채명길', 'woaudrlf@kosta.or.kr', '20060816');
INSERT INTO MEMBER (ID, PASSWORD, NAME, EMAIL, JOIN_DATE) VALUES('id-16', '1111', '홍유성', '1211ghddbtjd@kosta.or.kr', '20100714');
INSERT INTO MEMBER (ID, PASSWORD, NAME, EMAIL, JOIN_DATE) VALUES('id-17', '1111', '오정미', 'dhwjdalfood@kosta.or.kr', '20120311');
INSERT INTO MEMBER (ID, PASSWORD, NAME, EMAIL, JOIN_DATE) VALUES('id-18', '1111', '우정희', 'dnwjdgmltl@kosta.or.kr', '20111117');
INSERT INTO MEMBER (ID, PASSWORD, NAME, EMAIL, JOIN_DATE) VALUES('id-19', '1111', '정우명', 'wjdanaud9911@kosta.or.kr', '20110116');
INSERT INTO MEMBER (ID, PASSWORD, NAME, EMAIL, JOIN_DATE) VALUES('id-20', '1111', '서유길', 'tjdbrlfca01@kosta.or.kr', '20100816');
INSERT INTO MEMBER (ID, PASSWORD, NAME, EMAIL, JOIN_DATE) VALUES('id-21', '1111', '김철수', 'rlacjftn389@kosta.or.kr', '20110216');
INSERT INTO MEMBER (ID, PASSWORD, NAME, EMAIL, JOIN_DATE) VALUES('id-22', '1111', '최수경', 'chltnaod0033@kosta.or.kr', '20100118');
INSERT INTO MEMBER (ID, PASSWORD, NAME, EMAIL, JOIN_DATE) VALUES('id-23', '1111', '유영미', 'dnbdudal@kosta.or.kr', '20120126');
INSERT INTO MEMBER (ID, PASSWORD, NAME, EMAIL, JOIN_DATE) VALUES('id-24', '1111', '박영수', 'qkrdudtn@kosta.or.kr', '20110107');
INSERT INTO MEMBER (ID, PASSWORD, NAME, EMAIL, JOIN_DATE) VALUES('id-25', '1111', '박영수', 'qkraudtn@kosta.or.kr', '20070306');
INSERT INTO MEMBER (ID, PASSWORD, NAME, EMAIL, JOIN_DATE) VALUES('id-26', '1111', '이명수', 'ab3adfr3@kosta.or.kr', '20110216');
INSERT INTO MEMBER (ID, PASSWORD, NAME, EMAIL, JOIN_DATE) VALUES('id-27', '1111', '이명희', 'abci93lz@kosta.or.kr', '20100917');
INSERT INTO MEMBER (ID, PASSWORD, NAME, EMAIL, JOIN_DATE) VALUES('id-28', '1111', '이가희', 'lee9392@kosta.or.kr', '20061116');
INSERT INTO MEMBER (ID, PASSWORD, NAME, EMAIL, JOIN_DATE) VALUES('id-29', '1111', '김가영', 'kimaldke@kosta.or.kr', '20120815');
INSERT INTO MEMBER (ID, PASSWORD, NAME, EMAIL, JOIN_DATE) VALUES('id-30', '1111', '손영주', 'ullacke@kosta.or.kr', '20001231');
INSERT INTO MEMBER (ID, PASSWORD, NAME, EMAIL, JOIN_DATE) VALUES('id-31', '1111', '손영희', 'evzae@kosta.or.kr', '20000130');
INSERT INTO MEMBER (ID, PASSWORD, NAME, EMAIL, JOIN_DATE) VALUES('id-32', '1111', '이명희', 'abccvd@kosta.or.kr', '20100116');
INSERT INTO MEMBER (ID, PASSWORD, NAME, EMAIL, JOIN_DATE) VALUES('id-33', '1111', '김가영', '3dlkjaslkj@kosta.or.kr', '19900121');
INSERT INTO MEMBER (ID, PASSWORD, NAME, EMAIL, JOIN_DATE) VALUES('id-34', '1111', '이가희', 'recalsxd@kosta.or.kr', '19980706');
INSERT INTO MEMBER (ID, PASSWORD, NAME, EMAIL, JOIN_DATE) VALUES('id-35', '1111', '채명길', 'ck9a03@kosta.or.kr', '19990312');
INSERT INTO MEMBER (ID, PASSWORD, NAME, EMAIL, JOIN_DATE) VALUES('id-36', '1111', '우정희', '0293lll@kosta.or.kr', '20110110');
INSERT INTO MEMBER (ID, PASSWORD, NAME, EMAIL, JOIN_DATE) VALUES('id-37', '1111', '홍정연', 'adfv3@kosta.or.kr', '20100420');
INSERT INTO MEMBER (ID, PASSWORD, NAME, EMAIL, JOIN_DATE) VALUES('id-38', '1111', '정우명', 'kiald03@kosta.or.kr', '19970820');
INSERT INTO MEMBER (ID, PASSWORD, NAME, EMAIL, JOIN_DATE) VALUES('id-39', '1111', '정보영', 'aclde@kosta.or.kr', '19951021');
INSERT INTO MEMBER (ID, PASSWORD, NAME, EMAIL, JOIN_DATE) VALUES('id-40', '1111', '장보미', 'jangbomi@kosta.or.kr', '20000101');
INSERT INTO MEMBER (ID, PASSWORD, NAME, EMAIL, JOIN_DATE) VALUES('id-41', '1111', '오수경', 'oo@kosta.or.kr', '20091210');
INSERT INTO MEMBER (ID, PASSWORD, NAME, EMAIL, JOIN_DATE) VALUES('id-42', '1111', '한희주', 'hanheeju@kosta.or.kr', '19900121');
INSERT INTO MEMBER (ID, PASSWORD, NAME, EMAIL, JOIN_DATE) VALUES('id-43', '1111', '홍영주', 'honyju@kosta.or.kr', '19990312');
INSERT INTO MEMBER (ID, PASSWORD, NAME, EMAIL, JOIN_DATE) VALUES('id-44', '1111', '김우람', 'kimyl@kosta.or.kr', '20100116');
INSERT INTO MEMBER (ID, PASSWORD, NAME, EMAIL, JOIN_DATE) VALUES('id-45', '1111', '임경희', 'limkyunghee@kosta.or.kr', '20100116');
INSERT INTO MEMBER (ID, PASSWORD, NAME, EMAIL, JOIN_DATE) VALUES('id-46', '1111', '임경희', 'limkh@kosta.or.kr', '20110107');
INSERT INTO MEMBER (ID, PASSWORD, NAME, EMAIL, JOIN_DATE) VALUES('id-47', '1111', '김철수', 'kimchsoo@kosta.or.kr', '19900121');
INSERT INTO MEMBER (ID, PASSWORD, NAME, EMAIL, JOIN_DATE) VALUES('id-48', '1111', '김영주', 'kimyj@kosta.or.kr', '20100116');
INSERT INTO MEMBER (ID, PASSWORD, NAME, EMAIL, JOIN_DATE) VALUES('id-49', '1111', '홍우성', 'hong@kosta.or.kr', '19990309');
INSERT INTO MEMBER (ID, PASSWORD, NAME, EMAIL, JOIN_DATE) VALUES('id-50', '1111', '이병주', 'leebyungjoo@kosta.or.kr', '20100116');
INSERT INTO MEMBER (ID, PASSWORD, NAME, EMAIL, JOIN_DATE) VALUES('id-51', '1111', '박범진', 'parkbj@kosta.or.kr', '19900121');

