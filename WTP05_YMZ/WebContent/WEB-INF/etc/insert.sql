delete from member CASCADE CONSTRAINTS;
delete from restauran	 CASCADE CONSTRAINTS;
delete from location CASCADE CONSTRAINTS;
delete from review CASCADE CONSTRAINTS;
delete from faq CASCADE CONSTRAINTS;
delete from qna CASCADE CONSTRAINTS;

insert into member values('master01', 1111, '관리자1', '관리자1', '20100505', '남', '472-901', '경기도 성남시 분당구', '삼평동 유스페이스', 'master1@naver.com', '010-1111-1111', '한식', 99999, 'master', '20140514', '가입');
insert into member values('master02', 2222, '관리자2', '관리자2', '20100504', '남', '472-901', '경기도 성남시 분당구', '삼평동 유스페이스', 'master2@naver.com', '010-1111-1111', '한식', 99999, 'master', '20140515', '가입');
insert into member values('master03', 3333, '관리자3', '관리자3', '20100503', '남', '472-901', '경기도 성남시 분당구', '삼평동 유스페이스', 'master3@naver.com', '010-1111-1111', '한식', 99999, 'master', '20140516', '가입');
insert into member values('master04', 3333, '관리자4', '관리자4', '20100502', '남', '472-901', '경기도 성남시 분당구', '삼평동 유스페이스', 'master4@naver.com', '010-1111-1111', '한식', 99999, 'master', '20140517', '가입');
insert into member values('user01', 1111, '피카츄', '피카츄', '20100505', '남', '472-901', '경기도 성남시 분당구', '삼평동 유스페이스', 'user01@naver.com', '010-1111-1111', '양식', 10, 'user', '20140513', '탈퇴');
insert into member values('user02', 5555, '라이츄', '라이츄', '20100505', '남', '472-901', '경기도 성남시 분당구', '삼평동 유스페이스', 'user02@naver.com', '010-1111-1111', '한식', 100000, 'user', '20140512', '가입');
insert into member values('user03', 5555, '파이리', '파이리', '20100505', '남', '472-901', '경기도 성남시 분당구', '삼평동 유스페이스', 'user03@naver.com', '010-1111-1111', '일식', 100000, 'user', '20140511', '가입');
insert into member values('user04', 5555, '꼬부기', '꼬부기', '20100505', '남', '472-901', '경기도 성남시 분당구', '삼평동 유스페이스', 'user04@naver.com', '010-1111-1111', '한식', 100000, 'user', '20140510', '가입');
insert into member values('user05', 5555, '버터플', '버터플', '20100505', '남', '472-901', '경기도 성남시 분당구', '삼평동 유스페이스', 'user05@naver.com', '010-1111-1111', '양식', 100000, 'user', '20140519', '가입');
insert into member values('user06', 5555, '야도란', '야도란', '20100505', '남', '472-901', '경기도 성남시 분당구', '삼평동 유스페이스', 'user06@naver.com', '010-1111-1111', '한식', 100000, 'user', '20140518', '가입');
insert into member values('user07', 5555, '피존투', '피존투', '20100505', '남', '472-901', '경기도 성남시 분당구', '삼평동 유스페이스', 'user07@naver.com', '010-1111-1111', '중식', 100000, 'user', '20140517', '가입');
insert into member values('user08', 5555, '또가스', '또가스', '20100505', '남', '472-901', '경기도 성남시 분당구', '삼평동 유스페이스', 'user08@naver.com', '010-1111-1111', '한식', 100000, 'user', '20140516', '가입');
insert into member values('user09', 5555, '리자드', '리자드', '20100505', '남', '472-901', '경기도 성남시 분당구', '삼평동 유스페이스', 'user09@naver.com', '010-1111-1111', '중식', 100000, 'user', '20140515', '가입');
insert into member values('user10', 5555, '리자몽', '리자몽', '20100505', '남', '472-901', '경기도 성남시 분당구', '삼평동 유스페이스', 'user10@naver.com', '010-1111-1111', '한식', 100000, 'user', '20140514', '가입');
insert into member values('user11', 5555, '어니부기', '어니부기', '20100505', '남', '472-901', '경기도 성남시 분당구', '삼평동 유스페이스', 'user11@naver.com', '010-1111-1111', '일식', 100000, 'user', '20140513', '가입');
insert into member values('user12', 5555, '거북왕', '거북왕', '20100505', '남', '472-901', '경기도 성남시 분당구', '삼평동 유스페이스', 'user12@naver.com', '010-1111-1111', '양식', 100000, 'user', '20140512', '가입');
insert into member values('user13', 5555, '아상해씨', '이상해씨', '20100505', '남', '472-901', '경기도 성남시 분당구', '삼평동 유스페이스', 'user13@naver.com', '010-1111-1111', '한식', 100000, 'user', '20140511', '가입');
insert into member values('user14', 5555, '이상해풀', '이상해풀', '20100505', '남', '472-901', '경기도 성남시 분당구', '삼평동 유스페이스', 'user14@naver.com', '010-1111-1111', '한식', 100000, 'user', '20140510', '가입');
insert into member values('user15', 5555, '이상해꽃', '이상해꽃', '20100505', '남', '472-901', '경기도 성남시 분당구', '삼평동 유스페이스', 'user15@naver.com', '010-1111-1111', '한식', 100000, 'user', '20140501', '가입');

update member set grade='master' where member_id='master'
update member set grade='master' 	where member_id='2';
update member set mileage=11111 	where member_id='2';


delete member where member_id='1';

INSERT INTO FIRST_CATEGORY (FIRST_CATEGORY_ID, FIRST_CATEGORY_NAME, FIRST_CATEGORY_INFO) VALUES('F-1',  '유형', '유형 카테고리');
INSERT INTO FIRST_CATEGORY (FIRST_CATEGORY_ID, FIRST_CATEGORY_NAME, FIRST_CATEGORY_INFO) VALUES('F-2',  '맛집리뷰', '맛집리뷰 게시판에서 사용될 카테고리 정보');
INSERT INTO FIRST_CATEGORY (FIRST_CATEGORY_ID, FIRST_CATEGORY_NAME, FIRST_CATEGORY_INFO) VALUES('F-3',  '고객센터', '고객센터 게시판에서 사용될 카테고리 정보');
INSERT INTO FIRST_CATEGORY (FIRST_CATEGORY_ID, FIRST_CATEGORY_NAME, FIRST_CATEGORY_INFO) VALUES('F-4',  '테마', '테마 카테고리');
INSERT INTO FIRST_CATEGORY (FIRST_CATEGORY_ID, FIRST_CATEGORY_NAME, FIRST_CATEGORY_INFO) VALUES('F-5',  '맛집리뷰', '검색 카테고리');

INSERT INTO SECOND_CATEGORY (SECOND_CATEGORY_ID,  SECOND_CATEGORY_NAME, SECOND_CATEGORY_INFO, FIRST_CATEGORY_ID) VALUES ('S-1', '회원관련', '회원관련 QNA게시물 보기', 'F-3' );
INSERT INTO SECOND_CATEGORY (SECOND_CATEGORY_ID,  SECOND_CATEGORY_NAME, SECOND_CATEGORY_INFO, FIRST_CATEGORY_ID) VALUES ('S-2', '맛집관련', '맛집정보관련 QNA게시물 보기', 'F-3' );
INSERT INTO SECOND_CATEGORY (SECOND_CATEGORY_ID,  SECOND_CATEGORY_NAME, SECOND_CATEGORY_INFO, FIRST_CATEGORY_ID) VALUES ('S-3', '리뷰관련', '맛집리뷰관련 QNA게시물 보기', 'F-3' );

INSERT INTO SECOND_CATEGORY (SECOND_CATEGORY_ID,  SECOND_CATEGORY_NAME, SECOND_CATEGORY_INFO, FIRST_CATEGORY_ID) VALUES ('S-12', '음담패설', null, 'F-2' );
INSERT INTO SECOND_CATEGORY (SECOND_CATEGORY_ID,  SECOND_CATEGORY_NAME, SECOND_CATEGORY_INFO, FIRST_CATEGORY_ID) VALUES ('S-13', '폭언욕설', null, 'F-2' );
INSERT INTO SECOND_CATEGORY (SECOND_CATEGORY_ID,  SECOND_CATEGORY_NAME, SECOND_CATEGORY_INFO, FIRST_CATEGORY_ID) VALUES ('S-14', '인격모독', null, 'F-2' );
INSERT INTO SECOND_CATEGORY (SECOND_CATEGORY_ID,  SECOND_CATEGORY_NAME, SECOND_CATEGORY_INFO, FIRST_CATEGORY_ID) VALUES ('S-15', '영리추구', null, 'F-2' );
INSERT INTO SECOND_CATEGORY (SECOND_CATEGORY_ID,  SECOND_CATEGORY_NAME, SECOND_CATEGORY_INFO, FIRST_CATEGORY_ID) VALUES ('S-16', '악성코드', null, 'F-2' );
INSERT INTO SECOND_CATEGORY (SECOND_CATEGORY_ID,  SECOND_CATEGORY_NAME, SECOND_CATEGORY_INFO, FIRST_CATEGORY_ID) VALUES ('S-17', '맹목적비난', null, 'F-2' );
INSERT INTO SECOND_CATEGORY (SECOND_CATEGORY_ID,  SECOND_CATEGORY_NAME, SECOND_CATEGORY_INFO, FIRST_CATEGORY_ID) VALUES ('S-18', '사회갈등유발', null, 'F-2' );
INSERT INTO SECOND_CATEGORY (SECOND_CATEGORY_ID,  SECOND_CATEGORY_NAME, SECOND_CATEGORY_INFO, FIRST_CATEGORY_ID) VALUES ('S-19', '도배글', null, 'F-2' );

INSERT INTO SECOND_CATEGORY (SECOND_CATEGORY_ID,  SECOND_CATEGORY_NAME, SECOND_CATEGORY_INFO, FIRST_CATEGORY_ID) VALUES ('S-4', '한식', null, 'F-1' );
INSERT INTO SECOND_CATEGORY (SECOND_CATEGORY_ID,  SECOND_CATEGORY_NAME, SECOND_CATEGORY_INFO, FIRST_CATEGORY_ID) VALUES ('S-5', '양식', null, 'F-1' );
INSERT INTO SECOND_CATEGORY (SECOND_CATEGORY_ID,  SECOND_CATEGORY_NAME, SECOND_CATEGORY_INFO, FIRST_CATEGORY_ID) VALUES ('S-6', '중식', null, 'F-1' );
INSERT INTO SECOND_CATEGORY (SECOND_CATEGORY_ID,  SECOND_CATEGORY_NAME, SECOND_CATEGORY_INFO, FIRST_CATEGORY_ID) VALUES ('S-7', '일식', null, 'F-1' );
INSERT INTO SECOND_CATEGORY (SECOND_CATEGORY_ID,  SECOND_CATEGORY_NAME, SECOND_CATEGORY_INFO, FIRST_CATEGORY_ID) VALUES ('S-8', '가족', null, 'F-4' );
INSERT INTO SECOND_CATEGORY (SECOND_CATEGORY_ID,  SECOND_CATEGORY_NAME, SECOND_CATEGORY_INFO, FIRST_CATEGORY_ID) VALUES ('S-9', '연인', null, 'F-4' );
INSERT INTO SECOND_CATEGORY (SECOND_CATEGORY_ID,  SECOND_CATEGORY_NAME, SECOND_CATEGORY_INFO, FIRST_CATEGORY_ID) VALUES ('S-10', '친구', null, 'F-4' );
INSERT INTO SECOND_CATEGORY (SECOND_CATEGORY_ID,  SECOND_CATEGORY_NAME, SECOND_CATEGORY_INFO, FIRST_CATEGORY_ID) VALUES ('S-11', '회식', null, 'F-4' );

INSERT INTO SECOND_CATEGORY (SECOND_CATEGORY_ID,  SECOND_CATEGORY_NAME, SECOND_CATEGORY_INFO, FIRST_CATEGORY_ID) VALUES ('S-20', 'title', null, 'F-5' );
INSERT INTO SECOND_CATEGORY (SECOND_CATEGORY_ID,  SECOND_CATEGORY_NAME, SECOND_CATEGORY_INFO, FIRST_CATEGORY_ID) VALUES ('S-21', 'nickname', null, 'F-5' );
INSERT INTO SECOND_CATEGORY (SECOND_CATEGORY_ID,  SECOND_CATEGORY_NAME, SECOND_CATEGORY_INFO, FIRST_CATEGORY_ID) VALUES ('S-22', 'id', null, 'F-5' );





INSERT INTO SECOND_CATEGORY (SECOND_CATEGORY_ID,  SECOND_CATEGORY_NAME, SECOND_CATEGORY_INFO, FIRST_CATEGORY_ID) VALUES ('S-20', 'title', null, 'F-5' );
INSERT INTO SECOND_CATEGORY (SECOND_CATEGORY_ID,  SECOND_CATEGORY_NAME, SECOND_CATEGORY_INFO, FIRST_CATEGORY_ID) VALUES ('S-21', 'nickname', null, 'F-5' );
INSERT INTO SECOND_CATEGORY (SECOND_CATEGORY_ID,  SECOND_CATEGORY_NAME, SECOND_CATEGORY_INFO, FIRST_CATEGORY_ID) VALUES ('S-22', 'id', null, 'F-5' );






insert into location values(location_no_seq.nextval, '유스페이스 1동', '3');
insert into location values(location_no_seq.nextval, '유스페이스 1동', '2');
insert into location values(location_no_seq.nextval, '유스페이스 1동', '1');
insert into location values(location_no_seq.nextval, '유스페이스 1동', 'B1');
insert into location values(location_no_seq.nextval, '유스페이스 2동', '2');
insert into location values(location_no_seq.nextval, '유스페이스 2동', '1');
insert into location values(location_no_seq.nextval, '유스페이스 2동', 'B1');
insert into location values(location_no_seq.nextval, 'H스퀘어 N동', '1');
insert into location values(location_no_seq.nextval, 'H스퀘어 N동', 'B1');
insert into location values(location_no_seq.nextval, 'H스퀘어 S동', '2');
insert into location values(location_no_seq.nextval, 'H스퀘어 S동', '1');
insert into location values(location_no_seq.nextval, 'H스퀘어 S동', 'B1');
insert into location values(location_no_seq.nextval, '삼환하이펙스 A동', '2');
insert into location values(location_no_seq.nextval, '삼환하이펙스 A동', '1');
insert into location values(location_no_seq.nextval, '삼환하이펙스 A동', 'B1');
insert into location values(location_no_seq.nextval, '삼환하이펙스 B동', '2');
insert into location values(location_no_seq.nextval, '삼환하이펙스 B동', '1');
insert into location values(location_no_seq.nextval, '삼환하이펙스 B동', 'B1');

--유스페이스2동2층
insert into restaurant values(restaurant_no_seq.nextval, '새마을식당', 'S-4', '031-628-6694', '백주부의 새마을식당이쥬', '1111111111111,1111111111112,1111111111113,1111111111114,1111111111115', 0, 222, 'S-8,S-9,S-10,S-11', '20150530', 0, 5);
insert into food values(food_no_seq.nextval, '열탄불고기', 8000, '5330원/100g', 1);
insert into food values(food_no_seq.nextval, '새마을불고기', 8000, '5330원/100g', 1);
insert into food values(food_no_seq.nextval, '소금구이', 9000, '6000원/100g', 1);
insert into food values(food_no_seq.nextval, '만신창삼겹살', 9000, '(오리지날/마늘/간장) 6000원/100g', 1);
insert into food values(food_no_seq.nextval, '차돌박이', 13000, '8670원/100g', 1);
insert into food values(food_no_seq.nextval, '껍데기', 6000, '4000원/100g', 1);
insert into food values(food_no_seq.nextval, '7분돼지김치', 5000, null, 1);
insert into food values(food_no_seq.nextval, '새마을된장찌개', 6000, null, 1);
insert into food values(food_no_seq.nextval, '냉김치말이국수', 4000, null, 1);
insert into food values(food_no_seq.nextval, '옛날도시락', 3000, null, 1);
insert into restaurant values(restaurant_no_seq.nextval, '육회드림', 'S-4', '031-628-7354', '육회드림림', '11111111111121', 0, 136, 'S-11', '20150530', 0, 5);
insert into food values(food_no_seq.nextval, '육회비빔밥', 6000, null, 2);
insert into food values(food_no_seq.nextval, '시골국밥', 5000, null, 2);
insert into restaurant values(restaurant_no_seq.nextval, '원할머니보쌈', 'S-4', '031-628-6755', '원할머니보쌈입니다<br>할매의손맛을봐라', '11111111111131', 0, 12, 'S-8,S-10,S-11', '20150530', 0, 5);
insert into food values(food_no_seq.nextval, '보쌈정식', 8000, null, 3);
insert into food values(food_no_seq.nextval, '오리보쌈정식', 9000, null, 3);
insert into food values(food_no_seq.nextval, '원쌈버섯육개장', 6000, null, 3);
insert into restaurant values(restaurant_no_seq.nextval, '봉추찜닭', 'S-4', '031-628-6981', '봉<br>추<br>찜<br>닭', '11111111111141', 0, 45, 'S-10,S-11', '20150530', 0, 5);
insert into food values(food_no_seq.nextval, '찜닭-小', 20000, '2인분 (닭:국산)', 4);
insert into food values(food_no_seq.nextval, '찜닭-中', 30000, '3~4인분 (닭:국산)', 4);
insert into food values(food_no_seq.nextval, '찜닭-大', 40000, '4~5인분 (닭:국산)', 4);
insert into restaurant values(restaurant_no_seq.nextval, '얼큰이 찌개마을', 'S-4', '031-628-2222', '얼큰이<br>찌개마을', '11111111111181', 0, 78, 'S-8', '20150531', 0, 5);
insert into food values(food_no_seq.nextval, '돼지김치찌개', 6000, null, 5);
insert into food values(food_no_seq.nextval, '동태탕', 6000, null, 5);
insert into food values(food_no_seq.nextval, '부대찌개', 12000, '2인분', 5);
insert into restaurant values(restaurant_no_seq.nextval, '평안도찹쌀순대', 'S-4', '031-739-8900', '평안도<br>찹쌀순대', '11111111111191', 0, 31, 'S-8,S-10,S-11', '20150531', 0, 5);
insert into food values(food_no_seq.nextval, '순대국밥', 6500, '순대+고기', 6);
insert into food values(food_no_seq.nextval, '순대만국밥', 6500, null, 6);
insert into food values(food_no_seq.nextval, '고기만국밥', 6500, null, 6);
insert into restaurant values(restaurant_no_seq.nextval, '이치류', 'S-7', '031-739-0706', '일류', '11111111111201', 0, 34, 'S-8,S-9', '20150531', 0, 5);
insert into restaurant values(restaurant_no_seq.nextval, '선어', 'S-7', '031-739-1585', '횟집입니다', '11111111111211', 0, 78, 'S-8,S-9,S-11', '20150531', 0, 5);
insert into food values(food_no_seq.nextval, '무한리필코스', 33000, null, 8);
insert into food values(food_no_seq.nextval, '정식코스', 26000, '회/스끼다시 리필 안되요', 8);
insert into restaurant values(restaurant_no_seq.nextval, '머구리', 'S-7', '031-628-6766', '횟집입니다', '11111111111221', 0, 98, 'S-8,S-9,S-11', '20150531', 0, 5);
insert into food values(food_no_seq.nextval, '머구리사시미', 40000, null, 9);
insert into food values(food_no_seq.nextval, '특사시미', 50000, null, 9);
insert into food values(food_no_seq.nextval, '회덮밥', 8000, null, 9);
insert into restaurant values(restaurant_no_seq.nextval, '홍스쭈꾸미', 'S-4', '031-628-1222', '쭈꾸미', '11111111111231', 0, 55, 'S-8,S-10', '20150531', 0, 5);
insert into restaurant values(restaurant_no_seq.nextval, '후니네 생선굽네', 'S-4', '031-628-1223', '생선', '11111111111241', 0, 64, 'S-8,S-10', '20150531', 0, 5);
insert into restaurant values(restaurant_no_seq.nextval, 'PUZZLE', 'S-5', '031-628-1224', '피자', '11111111111251', 0, 64, 'S-9,S-10', '20150531', 0, 5);
insert into restaurant values(restaurant_no_seq.nextval, '정원오리부추구이', 'S-4', '031-628-1225', '오리', '11111111111261', 0, 25, 'S-8,S-11', '20150531', 0, 5);
insert into restaurant values(restaurant_no_seq.nextval, '교동전선생', 'S-4', '031-628-1226', '전집', '11111111111271', 0, 17, 'S-9,S-10', '20150531', 0, 5);
insert into restaurant values(restaurant_no_seq.nextval, '고메부인', 'S-4', '031-628-1227', '고메고메', '11111111111281', 0, 36, 'S-8,S-9,S-10,S-11', '20150531', 0, 5);
insert into restaurant values(restaurant_no_seq.nextval, '토속상황삼계탕', 'S-4', '031-628-1228', '삼계탕', '11111111111291', 0, 83, 'S-8,S-9,S-10,S-11', '20150531', 0, 5);
insert into restaurant values(restaurant_no_seq.nextval, '복불복', 'S-4', '031-628-1229', '복집', '11111111111301', 0, 23, 'S-8,S-11', '20150531', 0, 5);

--유스페이스2동1층
insert into restaurant values(restaurant_no_seq.nextval, '본스치킨', 'S-5', '031-628-2362', '본스본스', '11111111111151', 0, 22, 'S-9', '20150530', 0, 6);
insert into food values(food_no_seq.nextval, '스파이시감자튀김', 13000, 'SPICY POTATO', 18);
insert into food values(food_no_seq.nextval, '본스소세지', 17000, 'SAUSAGE COMBO', 18);
insert into food values(food_no_seq.nextval, '무뼈닭발', 16000, 'BONELESS CHICKEN FEET', 18);
insert into restaurant values(restaurant_no_seq.nextval, '종로김밥', 'S-4', '031-628-6969', '김밥집', '11111111111161', 0, 127, 'S-9,S-10', '20150530', 0, 6);
insert into food values(food_no_seq.nextval, '종로김밥', 2500, null, 19);
insert into food values(food_no_seq.nextval, '치즈김밥', 3000, null, 19);
insert into food values(food_no_seq.nextval, '참치김밥', 3500, null, 19);
insert into food values(food_no_seq.nextval, '신라면', 3000, null, 19);
insert into food values(food_no_seq.nextval, '떡라면', 3500, null, 19);
insert into food values(food_no_seq.nextval, '제육덮밥', 5500, null, 19);
insert into restaurant values(restaurant_no_seq.nextval, 'SUBWAY', 'S-5', '031-739-8300', '샌드위치집', '11111111111171', 0, 58, 'S-8,S-9,S-10', '20150530', 0, 6);
insert into food values(food_no_seq.nextval, '베지샐러드', 5000, null, 20);
insert into food values(food_no_seq.nextval, '에그마요샐러드', 5400, null, 20);
insert into restaurant values(restaurant_no_seq.nextval, '전주현대옥', 'S-4', '031-739-8301', '전주현대옥', '1111111111841', 0, 63, 'S-8,S-9,S-10,S-11', '20150530', 0, 6);
insert into restaurant values(restaurant_no_seq.nextval, '누들박스', 'S-5', '031-739-8302', '누들박스', '1111111111851', 0, 83, 'S-8,S-9,S-10,S-11', '20150530', 0, 6);

--유스페이스2동 B1층
insert into restaurant values(restaurant_no_seq.nextval, '홍짜장', 'S-6', '031-739-8303', '홍짜장', '1111111111861', 0, 35, 'S-9,S-10', '20150530', 0, 7);
insert into restaurant values(restaurant_no_seq.nextval, '짱가네포크포크', 'S-5', '031-628-6629', '짱가네포크포크', '1111111111871', 0, 33, 'S-9,S-10', '20150530', 0, 7);
insert into restaurant values(restaurant_no_seq.nextval, '이가네양꼬치', 'S-6', '031-724-2688', '이가네양꼬치', '1111111111881', 0, 27, 'S-10,S-11', '20150530', 0, 7);
insert into restaurant values(restaurant_no_seq.nextval, '안동국시 소호정', 'S-4', '031-628-6678', '안동국시 소호정', '1111111111891', 0, 33, 'S-8,S-9,S-10', '20150530', 0, 7);
insert into restaurant values(restaurant_no_seq.nextval, '이태원천상', 'S-7', '031-739-8335', '이태원천상', '1111111111901', 0, 37, 'S-8,S-9,S-10,S-11', '20150530', 0, 7);
insert into restaurant values(restaurant_no_seq.nextval, '됐소', 'S-4', '031-628-6092', '됐소', '1111111111911', 0, 42, 'S-8,S-9,S-11', '20150530', 0, 7);

--H스퀘어S동 B1층
insert into restaurant values(restaurant_no_seq.nextval, '재크와콩나물', 'S-4', '031-789-3799', '재크와콩나물', '1111111111181', 0, 85, 'S-8,S-9,S-10', '20150530', 0, 12);
insert into restaurant values(restaurant_no_seq.nextval, '하코야', 'S-7', '031-789-3800', '하코야', '1111111111191', 0, 55, 'S-8,S-9,S-10', '20150530', 0, 12);
insert into restaurant values(restaurant_no_seq.nextval, '미정국수0410', 'S-4', '031-789-3669', '미정국수0410', '1111111111201,1111111111202,1111111111203,1111111111204,1111111111205', 0, 187, 'S-8,S-9,S-10', '20150530', 0, 12);
insert into food values(food_no_seq.nextval, '멸치국수', 3000, '국내산 멸치로 36시간 우려낸 멸치국수의 지존', 31);
insert into food values(food_no_seq.nextval, '간비국수', 4000, '푸짐한 고명과 따뜻한 면을 간장양념에 비벼 드시는 담백한 간비국수', 31);
insert into food values(food_no_seq.nextval, '(계절) 미정냉국수', 4000, '정성스레 우려낸 진한 육수를 시원하게 드시는 냉국수', 31);
insert into food values(food_no_seq.nextval, '비빔국수', 4000, '매콤달콤한 김치소스에 버무린 환상의 비빔국수', 31);
insert into food values(food_no_seq.nextval, '(계절) 냉콩국수', 4000, '즉석에서 갈아 만들어 주는 영양덩어리 콩국수', 31);
insert into food values(food_no_seq.nextval, '고추기름물만두', 4000, '한입에 쏙쏙 매콤하고 부드러운 고추기름물만두', 31);
insert into restaurant values(restaurant_no_seq.nextval, '판교토종순대국', 'S-4', '031-789-3670', '판교토종순대국', '1111111111211', 0, 64, 'S-8,S-10', '20150530', 0, 12);
insert into restaurant values(restaurant_no_seq.nextval, '와플반트', 'S-5', '031-789-3671', '와플', '1111111111221', 0, 32, 'S-9,S-10', '20150530', 0, 12);
insert into restaurant values(restaurant_no_seq.nextval, '다온', 'S-4', '031-8018-4800', '다온', '1111111111231', 0, 22, 'S-8,S-10,S-11', '20150530', 0, 12);
insert into restaurant values(restaurant_no_seq.nextval, '별별치킨', 'S-5', '031-789-3672', '별별치킨', '1111111111241', 0, 15, 'S-9,S-10,S-11', '20150530', 0, 12);
insert into restaurant values(restaurant_no_seq.nextval, '김밥천국', 'S-4', '031-789-3673', '김밥', '1111111111251', 0, 74, 'S-9,S-10', '20150530', 0, 12);
insert into restaurant values(restaurant_no_seq.nextval, '죠샌드위치', 'S-5', '031-789-3939', '샌드위치', '1111111111261', 0, 52, 'S-9,S-10', '20150530', 0, 12);
insert into restaurant values(restaurant_no_seq.nextval, '스마일쿡', 'S-4', '031-789-3940', '안녕하세요 스마일쿡입니다.<br>저희 집은 단돈 5천원으로 날마다 다른 메뉴를 먹을수 있답니다.<br>H스퀘어 S동 지하1층 제일 구석땡이에 있어요^^', '1111111112171,1111111112172,1111111112173,1111111112174,1111111112175', 0, 777, 'S-10', '20150530', 0, 12);
insert into food values(food_no_seq.nextval, '정식', 5000, null, 38);
insert into restaurant values(restaurant_no_seq.nextval, '명동칼국수', 'S-4', '031-696-7499', '명동칼국수', '1111111111281', 0, 42, 'S-8,S-9,S-10,S-11', '20150530', 0, 12);
insert into restaurant values(restaurant_no_seq.nextval, '신기소', 'S-7', '031-696-7500', '신기소', '1111111111291', 0, 137, 'S-8,S-9,S-10', '20150530', 0, 12);
insert into restaurant values(restaurant_no_seq.nextval, '백만불', 'S-4', '031-696-7501', '백만불', '1111111111301', 0, 52, 'S-8,S-9,S-10,S-11', '20150530', 0, 12);

--H스퀘어S동 1층
insert into restaurant values(restaurant_no_seq.nextval, '병천황토방순대', 'S-4', '031-696-7502', '순대', '1111111111311', 0, 53, 'S-8,S-10,S-11', '20150530', 0, 11);
insert into restaurant values(restaurant_no_seq.nextval, '한우공간', 'S-4', '031-696-7503', '한우공간', '1111111111321', 0, 22, 'S-8,S-10,S-11', '20150530', 0, 11);
insert into restaurant values(restaurant_no_seq.nextval, '담소사골순대', 'S-4', '031-696-7504', '담소사골순대', '1111111111331', 0, 74, 'S-8,S-11', '20150530', 0, 11);
insert into restaurant values(restaurant_no_seq.nextval, '알촌', 'S-4', '031-789-3533', '알촌', '1111111111341', 0, 62, 'S-9,S-10', '20150530', 0, 11);
insert into restaurant values(restaurant_no_seq.nextval, '한솥도시락', 'S-4', '031-789-3534', '한솥', '1111111111351', 0, 52, 'S-9,S-10', '20150530', 0, 11);
insert into restaurant values(restaurant_no_seq.nextval, '조마루감자탕', 'S-4', '031-789-3535', '감자탕', '1111111111361', 0, 23, 'S-8,S-9,S-10,S-11', '20150530', 0, 11);
insert into restaurant values(restaurant_no_seq.nextval, 'THE진국', 'S-4', '031-789-3536', '진국', '1111111111371', 0, 16, 'S-8,S-9,S-10,S-11', '20150530', 0, 11);

--H스퀘어S동 2층
insert into restaurant values(restaurant_no_seq.nextval, '미각', 'S-6', '031-789-3537', '미각', '1111111111381', 0, 85, 'S-8,S-9,S-10,S-11', '20150530', 0, 10);
insert into restaurant values(restaurant_no_seq.nextval, '본가', 'S-4', '031-789-3538', '본가', '1111111111391', 0, 32, 'S-8,S-9,S-10,S-11', '20150530', 0, 10);
insert into restaurant values(restaurant_no_seq.nextval, '청자家', 'S-4', '031-789-3539', '청자가', '1111111111401', 0, 53, 'S-8,S-9,S-10,S-11', '20150530', 0, 10);
insert into restaurant values(restaurant_no_seq.nextval, '이꾸', 'S-7', '031-789-3540', '이꾸', '1111111111411', 0, 33, 'S-8,S-9,S-10,S-11', '20150530', 0, 10);

--H스퀘어N동 B1층
insert into restaurant values(restaurant_no_seq.nextval, '진수성찬', 'S-4', '031-789-3541', '진수성찬', '1111111111421', 0, 74, 'S-8,S-9,S-10,S-11', '20150530', 0, 9);
insert into restaurant values(restaurant_no_seq.nextval, '두부가보쌈애', 'S-4', '031-789-3542', '두부가보쌈애', '1111111111431', 0, 85, 'S-8,S-10', '20150530', 0, 9);
insert into restaurant values(restaurant_no_seq.nextval, '커먼키친', 'S-5', '031-789-3543', '커먼키친', '1111111111441', 0, 58, 'S-9,S-10', '20150530', 0, 9);

--H스퀘어N동 1층
insert into restaurant values(restaurant_no_seq.nextval, '강호동육칠팔', 'S-4', '031-789-3544', '강호동', '1111111111451', 0, 52, 'S-8,S-9,S-10,S-11', '20150530', 0, 8);
insert into restaurant values(restaurant_no_seq.nextval, '미소한우소고기국밥', 'S-4', '031-789-3545', '미소한우소고기국밥', '1111111111461', 0, 37, 'S-8,S-10,S-11', '20150530', 0, 8);
insert into restaurant values(restaurant_no_seq.nextval, '홍대교동짬뽕', 'S-6', '031-789-3546', '홍대교동짬뽕', '1111111111471', 0, 184, 'S-9,S-10', '20150530', 0, 8);
insert into restaurant values(restaurant_no_seq.nextval, '러브미텐더', 'S-5', '031-789-3547', '러브미텐더', '1111111111481', 0, 44, 'S-8,S-9,S-10,S-11', '20150530', 0, 8);
insert into restaurant values(restaurant_no_seq.nextval, '메콩타이', 'S-5', '031-789-3549', '메콩타이', '1111111111491', 0, 36, 'S-8,S-9,S-10,S-11', '20150530', 0, 8);
insert into restaurant values(restaurant_no_seq.nextval, '만복국수', 'S-4', '031-789-3548', '만복국수', '1111111111501', 0, 57, 'S-8,S-9,S-10,S-11', '20150530', 0, 8);

--삼환하이펙스A동 2층
insert into restaurant values(restaurant_no_seq.nextval, '외고집설렁탕', 'S-4', '031-698-4877', '설렁탕', '1111111111511', 0, 89, 'S-8,S-10,S-11', '20150530', 0, 13);
insert into restaurant values(restaurant_no_seq.nextval, '킹콩부대찌개', 'S-4', '031-698-3240', '부대찌개', '1111111111521', 0, 57, 'S-8,S-10,S-11', '20150530', 0, 13);
insert into restaurant values(restaurant_no_seq.nextval, '하나스시', 'S-7', '031-696-1795', '하나스시', '1111111111531', 0, 33, 'S-9,S-11', '20150530', 0, 13);
insert into restaurant values(restaurant_no_seq.nextval, '캠뜰', 'S-4', '031-698-2925', '캠뜰', '1111111111541', 0, 17, 'S-9', '20150530', 0, 13);

--삼환하이펙스A동 1층
insert into restaurant values(restaurant_no_seq.nextval, '스위트럭', 'S-5', '031-698-2926', '스위트럭', '1111111111551', 0, 57, 'S-9,S-10', '20150530', 0, 14);
insert into restaurant values(restaurant_no_seq.nextval, '영심이떡볶이김밥', 'S-4', '031-698-2927', '분식', '1111111111561', 0, 36, 'S-9,S-10', '20150530', 0, 14);
insert into restaurant values(restaurant_no_seq.nextval, '치킨플러스', 'S-5', '031-698-2928', '치킨플러스', '1111111111571', 0, 55, 'S-9,S-10', '20150530', 0, 14);
insert into restaurant values(restaurant_no_seq.nextval, '꼬꼬와톡', 'S-5', '031-698-3256', '꼬꼬와톡', '1111111111581', 0, 27, 'S-8,S-9,S-10,S-11', '20150530', 0, 14);
insert into restaurant values(restaurant_no_seq.nextval, '라빠네', 'S-5', '031-698-3257', '라빠네', '1111111111591', 0, 32, 'S-8,S-9,S-10,S-11', '20150530', 0, 14);
insert into restaurant values(restaurant_no_seq.nextval, '강창구찹쌀진순대', 'S-4', '031-698-3969', '순대', '1111111111601', 0, 36, 'S-9,S-10,S-11', '20150530', 0, 14);
insert into restaurant values(restaurant_no_seq.nextval, '양바위', 'S-4', '031-698-3592', '양바위', '1111111111611', 0, 41, 'S-9,S-11', '20150530', 0, 14);

--삼환하이펙스A동 B1층
insert into restaurant values(restaurant_no_seq.nextval, '키친사이', 'S-7', '031-698-3593', '키친사이', '1111111111621', 0, 27, 'S-10,S-11', '20150530', 0, 15);
insert into restaurant values(restaurant_no_seq.nextval, '그남자네떡볶이', 'S-4', '031-698-3594', '그남자네떡볶이', '1111111111631', 0, 25, 'S-8,S-11', '20150530', 0, 15);
insert into restaurant values(restaurant_no_seq.nextval, '소공동뚝배기', 'S-4', '031-698-4548', '소공동뚝배기', '1111111111641', 0, 37, 'S-8,S-9', '20150530', 0, 15);
insert into restaurant values(restaurant_no_seq.nextval, '식객', 'S-5', '031-698-4549', '식객', '1111111111651', 0, 25, 'S-10,S-11', '20150530', 0, 15);
insert into restaurant values(restaurant_no_seq.nextval, '옛날그집', 'S-4', '031-709-0176', '옛날그집', '1111111111661', 0, 52, 'S-9,S-11', '20150530', 0, 15);
insert into restaurant values(restaurant_no_seq.nextval, '우리셀프식당', 'S-4', '031-709-0177', '우리셀프식당', '1111111111671', 0, 47, 'S-10,S-11', '20150530', 0, 15);
insert into restaurant values(restaurant_no_seq.nextval, '까로치아', 'S-5', '031-698-2816', '까로치아', '1111111111681', 0, 46, 'S-8,S-9', '20150530', 0, 15);

--삼환하이펙스B동 2층
insert into restaurant values(restaurant_no_seq.nextval, '제주돌담촌', 'S-4', '031-698-3292', '제주돌담촌', '1111111111691', 0, 15, 'S-9,S-10', '20150530', 0, 16);
insert into restaurant values(restaurant_no_seq.nextval, '369부대찌개생삼겹살', 'S-4', '031-698-3293', '369', '1111111111701', 0, 32, 'S-11', '20150530', 0, 16);
insert into restaurant values(restaurant_no_seq.nextval, '달구소', 'S-4', '031-698-3294', '달구소', '1111111111711', 0, 58, 'S-8,S-11', '20150530', 0, 16);
insert into restaurant values(restaurant_no_seq.nextval, '홍천원조닭갈비야', 'S-4', '031-698-3295', '닭갈비', '1111111111721', 0, 32, 'S-10,S-11', '20150530', 0, 16);
insert into restaurant values(restaurant_no_seq.nextval, '통통낙지마을', 'S-4', '031-709-1851', '통통낙지마을', '1111111111731', 0, 26, 'S-9,S-11', '20150530', 0, 16);
insert into restaurant values(restaurant_no_seq.nextval, '오늘한점', 'S-4', '031-709-1852', '오늘한점', '1111111111741', 0, 63, 'S-8,S-9,S-10', '20150530', 0, 16);

--삼환하이펙스B동 1층
insert into restaurant values(restaurant_no_seq.nextval, '슈퍼스테이크', 'S-5', '031-698-4443', '슈퍼스테이크', '1111111111751,1111111111752,1111111111753,1111111111754,1111111111755', 0, 192, 'S-9', '20150530', 0, 17);
insert into food values(food_no_seq.nextval, '슈퍼 스테이크', 9900, '호주산 청정우 / 250g', 86);
insert into food values(food_no_seq.nextval, '버크셔K 스테이크', 8900, '지리산 순종 흰코흑돼지 / 250g', 86);
insert into food values(food_no_seq.nextval, '함박 스테이크', 7900, '국내산 돼지고기 / 100% 수제 / 300g', 86);
insert into food values(food_no_seq.nextval, '연어 스테이크', 8900, '노르웨이산 / 200g', 86);
insert into restaurant values(restaurant_no_seq.nextval, '한국인의팥집', 'S-5', '031-698-4444', '한국인의팥집', '1111111111761', 0, 48, 'S-9', '20150530', 0, 17);
insert into restaurant values(restaurant_no_seq.nextval, '베이징스토리', 'S-6', '031-696-0306', '베이징스토리', '1111111111771', 0, 52, 'S-8,S-11', '20150530', 0, 17);
insert into restaurant values(restaurant_no_seq.nextval, '한그릇한사발', 'S-4', '031-696-0307', '한그릇한사발', '1111111111781', 0, 32, 'S-8,S-11', '20150530', 0, 17);

--삼환하이펙스B동 B1층
insert into restaurant values(restaurant_no_seq.nextval, '비타민민물장어', 'S-4', '031-698-2831', '비타민민물장어', '1111111111791', 0, 38, 'S-10,S-11', '20150530', 0, 18);
insert into restaurant values(restaurant_no_seq.nextval, '메양꼬치', 'S-6', '031-698-3557', '메양꼬치', '1111111111801', 0, 57, 'S-8,S-11', '20150530', 0, 18);
insert into restaurant values(restaurant_no_seq.nextval, '양평해장국', 'S-4', '031-698-4500', '양평해장국', '1111111111811', 0, 33, 'S-8,S-11', '20150530', 0, 18);
insert into restaurant values(restaurant_no_seq.nextval, '마미밥', 'S-4', '031-698-4501', '마미밥', '1111111111821', 0, 26, 'S-8,S-9', '20150530', 0, 18);
insert into restaurant values(restaurant_no_seq.nextval, '빙스퐁', 'S-5', '031-698-4502', '빙스퐁', '1111111111831', 0, 21, 'S-8', '20150530', 0, 18);

-- 유스페이스1동 3층
insert into restaurant values(restaurant_no_seq.nextval, '강남교자', 'S-6', '031-628-4000', '강남교자', '1111111111921', 0, 28, 'S-11', '20150530', 0, 1);
insert into restaurant values(restaurant_no_seq.nextval, '군산오징어', 'S-4', '031-628-1979', '군산오징어', '1111111111931', 0, 47, 'S-10,S-11', '20150530', 0, 1);
insert into restaurant values(restaurant_no_seq.nextval, '명품직화', 'S-4', '031-628-1933', '명품직화', '1111111111941', 0, 88, 'S-9,S-11', '20150530', 0, 1);
insert into restaurant values(restaurant_no_seq.nextval, '참소', 'S-4', '031-628-1200', '참소', '1111111111951', 0, 43, 'S-8,S-11', '20150530', 0, 1);
insert into restaurant values(restaurant_no_seq.nextval, '천지양꺼먹돼지', 'S-4', '031-628-1878', '천지양꺼먹돼지', '1111111111961', 0, 32, 'S-9,S-10', '20150530', 0, 1);
insert into restaurant values(restaurant_no_seq.nextval, '포메인', 'S-5', '031-628-6712', '포메인', '1111111111971', 0, 37, 'S-8,S-9', '20150530', 0, 1);
insert into restaurant values(restaurant_no_seq.nextval, '흑돈가', 'S-4', '031-724-2700', '흑돈가', '1111111111981', 0, 54, 'S-9,S-10', '20150530', 0, 1);

-- 유스페이스1동 2층
insert into restaurant values(restaurant_no_seq.nextval, '돈세이지', 'S-5', '031-724-2701', '돈세이지', '1111111111991', 0, 56, 'S-8,S-11', '20150530', 0, 2);
insert into restaurant values(restaurant_no_seq.nextval, '미스터쫀득이', 'S-4', '031-724-2702', '미스터쫀득이', '1111111112001', 0, 58, 'S-11', '20150530', 0, 2);
insert into restaurant values(restaurant_no_seq.nextval, '삼대곱창', 'S-4', '031-724-2777', '삼대곱창', '1111111112011', 0, 32, 'S-10,S-11', '20150530', 0, 2);
insert into restaurant values(restaurant_no_seq.nextval, '소담애', 'S-4', '031-628-1055', '소담애', '1111111112021', 0, 16, 'S-8,S-11', '20150530', 0, 2);
insert into restaurant values(restaurant_no_seq.nextval, '찌개애감동', 'S-4', '031-628-1479', '찌개애감동', '1111111112031', 0, 113, 'S-8,S-10,S-11', '20150530', 0, 2);
insert into restaurant values(restaurant_no_seq.nextval, '참치지기', 'S-7', '031-628-1480', '참치지기', '1111111112041', 0, 36, 'S-9', '20150530', 0, 2);
insert into restaurant values(restaurant_no_seq.nextval, '청구칼국수', 'S-4', '031-628-1481', '청구칼국수', '1111111112051', 0, 63, 'S-11', '20150530', 0, 2);
insert into restaurant values(restaurant_no_seq.nextval, '육전면사무소', 'S-4', '031-628-1002', '육전면사무소', '1111111112181,1111111112182,1111111112183,1111111112184,1111111112185', 0, 200, 'S-8,S-9', '20150530', 0, 2);
insert into food values(food_no_seq.nextval, '소고기생면', 6000, '소뼈를 우려만든 육수로 싱싱한 야채와 소고기를 넣어 담백한맛', 109);
insert into food values(food_no_seq.nextval, '해물생면', 6000, '소뼈를 우려만든 육수로 싱싱한 야채와 해산물을 넣어 담백한맛', 109);
insert into food values(food_no_seq.nextval, '불짬뽕생면', 6000, '각종 해산물과 싱싱한 야채가 얼큰하게 어우러진 정통 짬뽕', 109);
insert into food values(food_no_seq.nextval, '육전', 11000, '청정 호주산 소고기를 얇게 썰어 담백하고 고소한 맛', 109);
insert into food values(food_no_seq.nextval, '육전번', 11000, '완자와 특제소스를 섞어 직화로 구운 요리', 109);
insert into food values(food_no_seq.nextval, '섞어전', 20000, '다양한 전을 고루담은 모듬전 스페셜', 109);
insert into food values(food_no_seq.nextval, '소고기고추전', 6000, '(소고기:호주산/돼지고기:국내산)', 109);
insert into food values(food_no_seq.nextval, '소고기완자전', 6000, '(소고기:호주산/돼지고기:국내산)', 109);
insert into food values(food_no_seq.nextval, '젤라틴대왕닭발', 13000, '(매콤한맛/아주매운맛)', 109);
insert into food values(food_no_seq.nextval, '미니족발', 16000, '(매콤한맛/아주매운맛)', 109);



-- 유스페이스1동 1층
insert into restaurant values(restaurant_no_seq.nextval, 'THE MORE', 'S-5', '031-628-1177', '더모어', '1111111112061', 0, 35, 'S-10,S-11', '20150530', 0, 3);
insert into restaurant values(restaurant_no_seq.nextval, 'THE PICNIC', 'S-5', '031-628-1178', 'THE PICNIC', '1111111112071', 0, 62, 'S-8,S-11', '20150530', 0, 3);
insert into restaurant values(restaurant_no_seq.nextval, '조이포', 'S-5', '070-7769-2602', '조이포', '1111111112081', 0, 73, 'S-11', '20150530', 0, 3);

-- 유스페이스1동 B1층
insert into restaurant values(restaurant_no_seq.nextval, '앙샹떼', 'S-5', '031-628-2603', '앙샹떼', '1111111112091', 0, 22, 'S-8', '20150530', 0, 4);
insert into restaurant values(restaurant_no_seq.nextval, '요거트캐슬', 'S-5', '031-628-4555', '요거트캐슬', '1111111112101', 0, 37, 'S-8,S-10,S-11', '20150530', 0, 4);
insert into restaurant values(restaurant_no_seq.nextval, '유나인', 'S-5', '031-628-1966', '유나인', '1111111112111', 0, 43, 'S-10,S-11', '20150530', 0, 4);
insert into restaurant values(restaurant_no_seq.nextval, '육백과진챠이', 'S-6', '031-628-1967', '육백과진챠이', '1111111112121', 0, 46, 'S-8,S-10,S-11', '20150530', 0, 4);
insert into restaurant values(restaurant_no_seq.nextval, '진챠이객잔', 'S-6', '031-628-1930', '진챠이객잔', '1111111112131', 0, 48, 'S-8,S-9', '20150530', 0, 4);
insert into restaurant values(restaurant_no_seq.nextval, '찰스숯불김밥', 'S-4', '031-628-1931', '찰스숯불김밥', '1111111112141', 0, 51, 'S-8,S-9,S-10', '20150530', 0, 4);
insert into restaurant values(restaurant_no_seq.nextval, '코벤트가든', 'S-5', '031-628-1883', '코벤트가든', '1111111112151', 0, 52, 'S-9,S-10,S-11', '20150530', 0, 4);
insert into restaurant values(restaurant_no_seq.nextval, '하누랑돈이랑', 'S-4', '031-628-1944', '하누랑돈이랑', '1111111112161', 0, 42, 'S-11', '20150530', 0, 4);



insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'코스타 불고기','1','299','34','1972-02-04 11:00:00','user13');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'코스타 순대국','1','19','643','1972-02-04 11:00:01','user04');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'코스타 순대국','1','19','643','1972-02-04 11:00:02','user08');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'코스타 순대국','1','19','643','1972-02-04 11:00:11','user10');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'코스타 순대국','1','19','643','1972-02-04 11:00:12','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'코스타 순대국','1','19','643','1972-02-04 11:00:13','user07');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'코스타 순대국','1','29','744','1972-03-04 11:00:11','user07');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'코스타 순대국','1','29','744','1972-03-04 11:00:12','user06');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'코스타 치킨','1','29','744','1972-03-04 11:00:13','user03');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'코스타 치킨','1','29','744','1972-03-04 11:00:14','user09');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'코스타 치킨','1','29','744','1972-03-04 11:00:15','user15');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'코스타 치킨','1','39','644','1972-04-04 11:00:10','user06');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'코스타 치킨','1','39','644','1972-04-04 11:00:11','user02');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'코스타 치킨','1','39','644','1972-04-04 11:00:12','user08');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'코스타 치킨','1','39','644','1972-04-04 11:00:13','user05');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'코스타 치킨','1','100','52','1972-04-04 11:00:14','user06');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'코스타 치킨','1','39','644','1972-04-04 11:00:15','user14');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'코스타 피자','1','49','544','1972-05-04 11:00:10','user05');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'코스타 피자','1','49','544','1972-05-04 11:00:11','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'코스타 피자','1','49','544','1972-05-04 11:00:12','user13');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'코스타 피자','1','49','544','1972-05-04 11:00:13','user07');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'코스타 피자','1','49','544','1972-05-04 11:00:14','user04');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'코스타 피자','1','59','444','1972-06-04 11:00:10','user04');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'코스타 피자','1','59','444','1972-06-04 11:00:11','user06');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'코스타 피자','1','59','444','1972-06-04 11:00:12','user10');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'코스타 족발','1','59','444','1972-06-04 11:00:13','user12');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'코스타 족발','1','59','444','1972-06-04 11:00:14','user03');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'코스타 족발','1','69','344','1972-07-04 11:00:10','user02');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'코스타 족발','1','69','344','1972-07-04 11:00:11','user05');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'코스타 족발','1','69','344','1972-07-04 11:00:12','user03');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'코스타 족발','1','69','344','1972-07-04 11:00:13','user11');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'코스타 족발','1','69','344','1972-07-04 11:00:14','user09');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'코스타 족발','1','79','244','1972-08-04 11:00:10','user02');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'코스타 횟집','1','89','144','1972-09-04 11:00:10','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'코스타 횟집','1','99','14','1972-10-04 11:00:10','user15');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'코스타 횟집','1','199','24','1972-11-04 11:00:10','user14');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'코스타 횟집','1','399','44','1973-04-04 11:00:10','user12');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'코스타 횟집','1','499','54','1974-04-04 11:00:10','user11');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'코스타 횟집','1','599','64','1975-04-04 11:00:10','user10');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'코스타 횟집','1','699','74','1976-04-04 11:00:10','user09');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'코스타 횟집','1','799','84','1977-04-04 11:00:10','user08');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'코스타 곱창','1','899','94','1978-04-04 11:00:10','user07');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'코스타 곱창','1','99','221','1979-04-04 11:00:10','user06');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'코스타 곱창','1','99','233','1980-04-04 11:00:10','user05');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'코스타 곱창','1','99','321','1981-04-04 11:00:10','user04');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'코스타 곱창','1','99','194','1982-04-04 11:00:10','user03');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'코스타 곱창','1','90','111','1983-04-04 11:00:10','user02');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'코스타 곱창','1','91','121','1984-04-04 11:00:10','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'코스타 곱창','1','92','142','1985-04-04 11:00:10','user15');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'코스타 분식','1','93','123','1986-04-04 11:00:10','user14');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'코스타 분식','1','94','92','1987-04-04 11:00:10','user13');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'코스타 분식','1','95','88','1988-04-04 11:00:10','user12');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'코스타 분식','1','96','63','1989-04-04 11:00:10','user11');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'코스타 분식','1','96','36','1990-04-04 11:00:10','user10');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'코스타 분식','1','97','44','1991-04-04 11:00:10','user09');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'코스타 랍스타','1','98','32','1992-04-04 11:00:10','user08');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'코스타 랍스타','1','99','31','1993-04-04 11:00:10','user07');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'코스타 랍스타','1','440','24','1995-04-04 11:00:10','user05');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'코스타 랍스타','1','441','22','1996-04-04 11:00:10','user04');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'코스타 랍스타','1','442','13','1997-04-04 11:00:10','user03');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'코스타 죽집','1','443','12','1998-04-04 11:00:10','user02');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'코스타 죽집','1','444','11','1999-04-04 11:00:10','user01');

insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'미스터피자','1','831','84','2004-12-25 11:12:20','user02');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'파파존스','1','97','34','2008-02-11 11:12:20','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'도미노피자','1','774','66','2009-12-31 11:12:20','user15');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'차지치킨','1','444','6','2010-11-11 11:12:20','user14');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'중국성','1','454','14','2010-12-12 11:12:20','user13');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'면사무소','1','311','38','2011-11-14 11:12:20','user12');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'대게나라','1','245','44','2012-09-28 11:12:20','user11');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'파리바게트','1','111','4','2013-01-01 11:12:20','user10');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'코스타국밥','1','53','0','2013-02-03 11:12:20','user09');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'한솥도시락','1','12','2','2013-12-08 11:12:20','user08');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'재스기네치킨','1','333','31','2014-11-27 11:12:20','user07');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'차지족발','1','412','6','2015-06-01 01:12:20','user06');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'롯데리아','1','542','22','2015-06-01 03:12:20','user05');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'맥도날드','1','15','11','2015-06-01 05:12:20','user04');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'버거킹','1','221','0','2015-06-02 07:12:20','user03');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'새마을식당','1','1','1','2015-06-02 09:12:20','user02');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'수지의 맛있는 스테이크','<img src="/WTP05_YMZ/se2/multiupload/20150531094326493d07d5-6040-49f7-8ddd-8f9bec730a4e.jpg" title="suzy.jpg"><br style="clear:both;">','1234','150','2015-06-08 11:12:20','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'광고글 올리면 강퇴처리 됩니다!!','1','1','1','2015-06-02 01:11:12','master01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'사진이 없는 글은 삭제됩니다.','1','1','1','2015-06-02 09:10:20','master02');


insert into review_reply values(review_reply_no_seq.nextval, '2015-05-28 01:10:20', '노맛', 'user01', 79);
insert into review_reply values(review_reply_no_seq.nextval, '2015-05-29 01:11:20', '짱짱', 'user02', 79);
insert into review_reply values(review_reply_no_seq.nextval, '2015-05-30 01:12:20', '구려', 'user03', 79);
insert into review_reply values(review_reply_no_seq.nextval, '2015-06-01 01:13:20', '겁나 비싸넹', 'user04', 79);
insert into review_reply values(review_reply_no_seq.nextval, '2015-06-02 01:14:20', '추추추추강추', 'user05', 79);
insert into review_reply values(review_reply_no_seq.nextval, '2015-06-01 01:15:20', '차지가 쐈어요', 'user04', 79);
insert into review_reply values(review_reply_no_seq.nextval, '2015-06-02 01:16:20', '비싸....', 'user05', 78);
insert into review_reply values(review_reply_no_seq.nextval, '2015-05-28 01:17:20', '맛있엉!!', 'user06', 78);
insert into review_reply values(review_reply_no_seq.nextval, '2015-05-29 01:18:20', '알바 쩌네요...', 'user07', 78);
insert into review_reply values(review_reply_no_seq.nextval, '2015-05-30 01:19:20', 'ㅋㅋㅋㅋ', 'user08', 77);
insert into review_reply values(review_reply_no_seq.nextval, '2015-05-31 01:19:20', 'ㅋㅋㅋㅋㅋㅋㅋ', 'user07', 76);
insert into review_reply values(review_reply_no_seq.nextval, '2015-04-30 01:19:20', 'ㅋㅋㅋㅋㅋ', 'user06', 76);
insert into review_reply values(review_reply_no_seq.nextval, '2015-03-30 01:19:20', 'ㅋㅋㅋㅋㅋㅋㅋ', 'user05', 76);
insert into review_reply values(review_reply_no_seq.nextval, '2015-02-30 01:19:20', 'ㅋㅋㅋㅋㅋ', 'user04', 75);
insert into review_reply values(review_reply_no_seq.nextval, '2015-03-30 01:19:20', 'ㅋㅋㅋㅋㅋㅋ', 'user03', 75);
insert into review_reply values(review_reply_no_seq.nextval, '2015-04-30 01:19:20', 'ㅋㅋㅋㅋㅋㅋㅋ', 'user02', 74);
insert into review_reply values(review_reply_no_seq.nextval, '2015-01-30 01:19:20', 'ㅋㅋㅋㅋㅋㅋㅋㅋ', 'user01', 73);


insert into FAQ (faq_no, faq_title, faq_content) values(faq_no_seq.nextval, '개명으로 인한 이름을 변경하고 싶습니다.', 
'개명으로 인한 회원 이름을 변경하고자 할 경우에는 로그인 후, 회원정보 수정란에서 성명 표기 우측에 표시되어 있는 "개명에 의한 이름 변경"을 클릭하시어 변경하시면 됩니다. 
개명으로 인해 회원명을 변경하고 하시는 회원님은 반드시 실명인증 사이트에서 본인 실명확인을 거치셔야 합니다.
현재 메뉴판닷컴은 네임체크(www.namecheck.co.kr)를 통해서 실명인증 확인 서비스를 진행하고 있습니다.');

insert into FAQ (faq_no, faq_title, faq_content) values(faq_no_seq.nextval, '음식점 사진이나 정보를 사용하면 안될까요?', 
'저희 사이트에 등록되어있는 사진의 저작권은 메뉴판닷컴에 있어서 메뉴판닷컴의 동의없이는 정보를 사용할 수 없습니다. 사용을 원하시면 일정의 대여료를 지급하신 후 사용하셔야 합니다. 
관련된 문의는 02-547-0372 내선 402 로 연락주세요');

insert into FAQ (faq_no, faq_title, faq_content) values(faq_no_seq.nextval, 'ID와 Password가 맞는데 로그인 화면이 나와요.', 
'아이디와 패스워드가 맞는데도 로그인이 되지 않는다면, 프로그램의 오류가 아니라, 익스플로어 설정의 문제입니다. 
사용하시는 익스플로어가 6.0 버전이라면 도구->인터넷 옵션->개인정보-> "보통"을 "낮음"으로 설정해 주시고, 
5.5 버전이라면 도구->인터넷 옵션->보안->사용자 정의 수준->쿠키 부분의 세션 단위 쿠키 허용을 "사용" 으로 컴퓨터에 저장된 쿠키 허용을 "사용" 으로 변경해 주시면 바로 로그인이 되실꺼에요.');

insert into FAQ (faq_no, faq_title, faq_content) values(faq_no_seq.nextval, '아이디를 변경하고 싶어요.', 
'죄송하지만 저희 메뉴판에서는 아이디의 변경은 불가능합니다. 아이디를 변경하시려면 탈퇴후 다시 재가입해야 합니다. (탈퇴후 한달간 가입이 불가능합니다)');

insert into FAQ (faq_no, faq_title, faq_content) values(faq_no_seq.nextval, '회원 탈퇴를 하고 싶은데요?', 
'탈퇴 방법. 1. 메뉴판 로그인 2. 마이메뉴판 클릭 3. 회원정보관리 클릭 4. 회원탈퇴 요청 을 하시면 됩니다. 다만 2006년 10월 개편 이후 최초 접속이라면 회원정보변경 페이지로 이동하게 되는데 회원님의 정보를 수정을 해주신 다음 위와 같은 절차를 밟으시면 됩니다. 
탈퇴후 한달간은 가입을 불가능하며 자세한 문의를 원하면 meg@menupan.com 으로 문의 바랍니다.');

insert into FAQ (faq_no, faq_title, faq_content) values(faq_no_seq.nextval, '회원가입시의 정보를 변경하고 싶은데요.', 
'1. 로그인 2. 마이메뉴판 메뉴 선택 3. 회원정보관리 선택 4. 회원정보변경 클릭 원하는 회원 정보를 변경하시면 됩니다.');

insert into FAQ (faq_no, faq_title, faq_content) values(faq_no_seq.nextval, '비밀번호를 변경하고 싶어요', 
'1. 로그인 2. 마이메뉴판 접속 3. 회원정보관리 4. 비밀번호 변경 더 자세한 사항은 아래로 문의 주시기 바랍니다 meg@menupan.com');

insert into FAQ (faq_no, faq_title, faq_content) values(faq_no_seq.nextval, '게시물이 본인 동의 없이 삭제된것 같아요.', 
'저희 메뉴판 닷컴에 음식점 관련 게시판이 두개가 있습니다.
다른 회원님과의 좋은 정보를 공유하는 성격의 "추천 맛집" 이라는 게시판이 있으며 서비스나 맛의 질이 개선되어야 하는 음식점의 고발이나 따끔한 지적을 할 수 있는 "맛집신문고"라는 게시판이 있습니다.
회원님께서 "추천맛집"에 음식점에 대한 불평글을 올리셨다면 메일을 보냄과 동시에 "불량 식품" 게시판으로 옮겨졌으며, 회원님들이 홍보성글로 신고되어진 글 역시 메일과 함께
자동 삭제됩니다. 게시판 이용에 착오없으시길 바랍니다.');

insert into FAQ (faq_no, faq_title, faq_content) values(faq_no_seq.nextval, '게시물을 삭제 하고 싶은데 처리되지 않아요.', 
'회원님께서 등록하신 게시물 하단에 한줄답변이 등록되어 삭제가 되지 않는 것입니다. 이 경우에는 음식점 담당자(meg@menupan.com)에게 메일을 보내주시면 신속하게 처리해드리겠습니다.');

insert into FAQ (faq_no, faq_title, faq_content) values(faq_no_seq.nextval, '쿠폰 어떻게 사용하면 되는거죠?', 
'음식점 페이지에 가시면 쿠폰 옆에 출력하기라는 버튼이 있습니다. 그 버튼을 클릭하셔서 프린트 하시면 되며, 흑백 또는 칼라로 출력하셔서 사용하세요.');


insert into QNA (qna_no, qna_refamily, qna_restep, qna_relevel, qna_title, qna_category, qna_registration_date, qna_hits, qna_content, member_id) 
values(qna_no_seq.nextval, qna_no_seq.currval, 0, 0, '유스페이스A 건물이 어디에 있나요?', '맛집관련', '20150505', 1, '1안녕하세요! 관리자님 제가 회원탈퇴를 하려고 하는데 어떻게 해야되나요?', 'user01');

insert into QNA (qna_no, qna_refamily, qna_restep, qna_relevel, qna_title, qna_category, qna_registration_date, qna_hits, qna_content, member_id) 
values(qna_no_seq.nextval, qna_no_seq.currval, 0, 0, '회원탈퇴 어떻게 해요?', '회원관련', '20150405', 2, '2안녕하세요! 관리자님 제가 회원탈퇴를 하려고 하는데 어떻게 해야되나요?', 'user01');

insert into QNA (qna_no, qna_refamily, qna_restep, qna_relevel, qna_title, qna_category, qna_registration_date, qna_hits, qna_content, member_id) 
values(qna_no_seq.nextval, qna_no_seq.currval, 0, 0, '유스페이스B 건물이 어디에 있나요?', '맛집관련', '20150405', 3, '3안녕하세요! 관리자님 제가 회원탈퇴를 하려고 하는데 어떻게 해야되나요?', 'user01');

insert into QNA (qna_no, qna_refamily, qna_restep, qna_relevel, qna_title, qna_category, qna_registration_date, qna_hits, qna_content, member_id) 
values(qna_no_seq.nextval, qna_no_seq.currval, 0, 0,  'H스퀘어 건물이 어디에 있나요?', '맛집관련', '20150205', 14, '4안녕하세요! 관리자님 제가 회원탈퇴를 하려고 하는데 어떻게 해야되나요?', 'user01');

insert into QNA (qna_no, qna_refamily, qna_restep, qna_relevel, qna_title, qna_category, qna_registration_date, qna_hits, qna_content, member_id) 
values(qna_no_seq.nextval, qna_no_seq.currval, 0, 0, '포스텍 건물이 어디에 있나요?', '맛집관련', '20150105', 15, '5안녕하세요! 관리자님 제가 회원탈퇴를 하려고 하는데 어떻게 해야되나요?', 'user01');

insert into QNA (qna_no, qna_refamily, qna_restep, qna_relevel, qna_title, qna_category, qna_registration_date, qna_hits, qna_content, member_id) 
values(qna_no_seq.nextval, qna_no_seq.currval, 0, 0, '리뷰 게시물 양식은 어떻게 써요?', '리뷰관련', '20150501', 16, '6안녕하세요! 관리자님 제가 회원탈퇴를 하려고 하는데 어떻게 해야되나요?', 'user01');

insert into QNA (qna_no, qna_refamily, qna_restep, qna_relevel, qna_title, qna_category, qna_registration_date, qna_hits, qna_content, member_id) 
values(qna_no_seq.nextval, qna_no_seq.currval, 0, 0, '회원탈퇴 어떻게 해요?', '회원관련', '20150502', 17, '7안녕하세요! 관리자님 제가 회원탈퇴를 하려고 하는데 어떻게 해야되나요?', 'user01');

insert into QNA (qna_no, qna_refamily, qna_restep, qna_relevel, qna_title, qna_category, qna_registration_date, qna_hits, qna_content, member_id) 
values(qna_no_seq.nextval, qna_no_seq.currval, 0, 0, '유스페이스 건물이 어디에 있나요?', '맛집관련', '20150503', 18, '8안녕하세요! 관리자님 제가 회원탈퇴를 하려고 하는데 어떻게 해야되나요?', 'user01');

insert into QNA (qna_no, qna_refamily, qna_restep, qna_relevel, qna_title, qna_category, qna_registration_date, qna_hits, qna_content, member_id) 
values(qna_no_seq.nextval, qna_no_seq.currval, 0, 0, '리뷰 게시물 양식은 어떻게 써요?', '리뷰관련', '20150504', 19, '9안녕하세요! 관리자님 제가 회원탈퇴를 하려고 하는데 어떻게 해야되나요?', 'user01');

insert into QNA (qna_no, qna_refamily, qna_restep, qna_relevel, qna_title, qna_category, qna_registration_date, qna_hits, qna_content, member_id) 
values(qna_no_seq.nextval, qna_no_seq.currval, 0, 0, '리뷰 게시물 양식은 어떻게 써요?', '리뷰관련', '20150506', 20, '10안녕하세요! 관리자님 제가 회원탈퇴를 하려고 하는데 어떻게 해야되나요?', 'user01');

insert into QNA (qna_no, qna_refamily, qna_restep, qna_relevel, qna_title, qna_category, qna_registration_date, qna_hits, qna_content, member_id) 
values(qna_no_seq.nextval, qna_no_seq.currval, 0, 0, '유스페이스A 건물이 어디에 있나요?', '맛집관련', '20150506', 20, '10안녕하세요! 관리자님 제가 회원탈퇴를 하려고 하는데 어떻게 해야되나요?', 'user02');

insert into QNA (qna_no, qna_refamily, qna_restep, qna_relevel, qna_title, qna_category, qna_registration_date, qna_hits, qna_content, member_id) 
values(qna_no_seq.nextval, qna_no_seq.currval, 0, 0, '유스페이스B 건물이 어디에 있나요', '맛집관련', '20150506', 20, '10안녕하세요! 관리자님 제가 회원탈퇴를 하려고 하는데 어떻게 해야되나요?', 'user02');

insert into QNA (qna_no, qna_refamily, qna_restep, qna_relevel, qna_title, qna_category, qna_registration_date, qna_hits, qna_content, member_id) 
values(qna_no_seq.nextval, qna_no_seq.currval, 0, 0, '유스페이스C 건물이 어디에 있나요?', '맛집관련', '20150506', 20, '10안녕하세요! 관리자님 제가 회원탈퇴를 하려고 하는데 어떻게 해야되나요?', 'user02');

insert into QNA (qna_no, qna_refamily, qna_restep, qna_relevel, qna_title, qna_category, qna_registration_date, qna_hits, qna_content, member_id) 
values(qna_no_seq.nextval, qna_no_seq.currval, 0, 0, '회원탈퇴 어떻게 해요?', '회원관련', '20150418', 2, '2안녕하세요! 관리자님 제가 회원탈퇴를 하려고 하는데 어떻게 해야되나요?', 'user03');

insert into QNA (qna_no, qna_refamily, qna_restep, qna_relevel, qna_title, qna_category, qna_registration_date, qna_hits, qna_content, member_id) 
values(qna_no_seq.nextval, qna_no_seq.currval, 0, 0, '회원탈퇴 어떻게 해요?', '회원관련', '20150418', 2, '2안녕하세요! 관리자님 제가 회원탈퇴를 하려고 하는데 어떻게 해야되나요?', 'user03');

insert into QNA (qna_no, qna_refamily, qna_restep, qna_relevel, qna_title, qna_category, qna_registration_date, qna_hits, qna_content, member_id) 
values(qna_no_seq.nextval, qna_no_seq.currval, 0, 0, '회원탈퇴 어떻게 해요?', '회원관련', '20150418', 2, '2안녕하세요! 관리자님 제가 회원탈퇴를 하려고 하는데 어떻게 해야되나요?', 'user01');

insert into QNA (qna_no, qna_refamily, qna_restep, qna_relevel, qna_title, qna_category, qna_registration_date, qna_hits, qna_content, member_id) 
values(qna_no_seq.nextval, qna_no_seq.currval, 0, 0, '회원탈퇴 어떻게 해요?', '회원관련', '20150418', 2, '2안녕하세요! 관리자님 제가 회원탈퇴를 하려고 하는데 어떻게 해야되나요?', 'user01');

insert into QNA (qna_no, qna_refamily, qna_restep, qna_relevel, qna_title, qna_category, qna_registration_date, qna_hits, qna_content, member_id) 
values(qna_no_seq.nextval, qna_no_seq.currval, 0, 0, '정보수정 어떻게 해요?', '회원관련', '20150418', 2, '2안녕하세요! 관리자님 제가 회원탈퇴를 하려고 하는데 어떻게 해야되나요?', 'user03');

insert into QNA (qna_no, qna_refamily, qna_restep, qna_relevel, qna_title, qna_category, qna_registration_date, qna_hits, qna_content, member_id) 
values(qna_no_seq.nextval, qna_no_seq.currval, 0, 0, '정보수정 어떻게 해요?', '회원관련', '20150418', 2, '2안녕하세요! 관리자님 제가 회원탈퇴를 하려고 하는데 어떻게 해야되나요?', 'user01');

insert into QNA (qna_no, qna_refamily, qna_restep, qna_relevel, qna_title, qna_category, qna_registration_date, qna_hits, qna_content, member_id) 
values(qna_no_seq.nextval, qna_no_seq.currval, 0, 0, '정보수정 어떻게 해요?', '회원관련', '20150418', 2, '2안녕하세요! 관리자님 제가 회원탈퇴를 하려고 하는데 어떻게 해야되나요?', 'user03');

insert into reported_review values(reported_no_seq.nextval, '리뷰', 1, '안녕하세요1','처리중', '음담패설', '20150505', 'user01');
insert into reported_review values(reported_no_seq.nextval, '리뷰', 2, '미처리', '음담패설', '20150505', 'user03');
insert into reported_review values(reported_no_seq.nextval, '리뷰', 3, '미처리', '폭언욕설', '20150505', 'user04');
insert into reported_review values(reported_no_seq.nextval, '리뷰', 4, '처리중', '폭언욕설', '20150505', 'user06');
insert into reported_review values(reported_no_seq.nextval, '리뷰', 5, '미처리', '인격모독', '20150505', 'user07');
insert into reported_review values(reported_no_seq.nextval, '리뷰', 6, '미처리', '인격모독', '20150505', 'user09');
insert into reported_review values(reported_no_seq.nextval, '리뷰', 7, '처리중', '영리추구', '20150505', 'user03');
insert into reported_review values(reported_no_seq.nextval, '리뷰', 8, '처리중', '영리추구', '20150505', 'user03');
insert into reported_review values(reported_no_seq.nextval, '리뷰', 9, '처리중', '악성코드', '20150505', 'user04');
insert into reported_review values(reported_no_seq.nextval, '리뷰', 10, '처리중', '악성코드', '20150505', 'user04');
insert into reported_review values(reported_no_seq.nextval, '리뷰', 1, '처리중', '맹목적비난', '20150505', 'user03');
insert into reported_review values(reported_no_seq.nextval, '리뷰', 2, '처리중', '맹목적비난', '20150505', 'user03');
insert into reported_review values(reported_no_seq.nextval, '리뷰', 3, '처리중', '사회갈등유발', '20150505', 'user03');
insert into reported_review values(reported_no_seq.nextval, '리뷰', 4, '처리중', '사회갈등유발', '20150505', 'user03');
insert into reported_review values(reported_no_seq.nextval, '리뷰', 5, '미처리', '도배글', '20150505', 'user01');
insert into reported_review values(reported_no_seq.nextval, '리뷰', 6, '처리중', '도배글', '20150505', 'user02');

insert into reported_reply values(reportedreply_no_seq.nextval, '리뷰', 1, 2,  '안녕하세요1', '처리중', '도배글', '20150505', 'user02');
insert into reported_reply values(reportedreply_no_seq.nextval, '리뷰', 1, 3,  '안녕하세요2', '처리중', '도배글', '20150505', 'user02');
