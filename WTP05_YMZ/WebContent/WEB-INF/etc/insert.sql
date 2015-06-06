delete from member CASCADE CONSTRAINTS;
delete from restaurant CASCADE CONSTRAINTS;
delete from location CASCADE CONSTRAINTS;
delete from review CASCADE CONSTRAINTS;
delete from faq CASCADE CONSTRAINTS;
delete from qna CASCADE CONSTRAINTS;



insert into member values('master01', 1111, '관리자1', '관리자1', '20100505', '남', '472-901', '경기도 성남시 분당구', '삼평동 유스페이스', 'master1@naver.com', '010-1111-1111', '한식', 99999, 'master', '20140514');
insert into member values('master02', 2222, '관리자2', '관리자2', '20100504', '남', '472-901', '경기도 성남시 분당구', '삼평동 유스페이스', 'master2@naver.com', '010-1111-1111', '한식', 99999, 'master', '20140515');
insert into member values('master03', 3333, '관리자3', '관리자3', '20100503', '남', '472-901', '경기도 성남시 분당구', '삼평동 유스페이스', 'master3@naver.com', '010-1111-1111', '한식', 99999, 'master', '20140516');
insert into member values('master04', 3333, '관리자4', '관리자4', '20100502', '남', '472-901', '경기도 성남시 분당구', '삼평동 유스페이스', 'master4@naver.com', '010-1111-1111', '한식', 99999, 'master', '20140517');
insert into member values('user01', 1111, '피카츄', '피카츄', '20100505', '남', '472-901', '경기도 성남시 분당구', '삼평동 유스페이스', 'user01@naver.com', '010-1111-1111', '양식', 10, 'user', '20140513');
insert into member values('user02', 5555, '라이츄', '라이츄', '20100505', '남', '472-901', '경기도 성남시 분당구', '삼평동 유스페이스', 'user02@naver.com', '010-1111-1111', '한식', 100000, 'user', '20140512');
insert into member values('user03', 5555, '파이리', '파이리', '20100505', '남', '472-901', '경기도 성남시 분당구', '삼평동 유스페이스', 'user03@naver.com', '010-1111-1111', '일식', 100000, 'user', '20140511');
insert into member values('user04', 5555, '꼬부기', '꼬부기', '20100505', '남', '472-901', '경기도 성남시 분당구', '삼평동 유스페이스', 'user04@naver.com', '010-1111-1111', '한식', 100000, 'user', '20140510');
insert into member values('user05', 5555, '버터플', '버터플', '20100505', '남', '472-901', '경기도 성남시 분당구', '삼평동 유스페이스', 'user05@naver.com', '010-1111-1111', '양식', 100000, 'user', '20140519');
insert into member values('user06', 5555, '야도란', '야도란', '20100505', '남', '472-901', '경기도 성남시 분당구', '삼평동 유스페이스', 'user06@naver.com', '010-1111-1111', '한식', 100000, 'user', '20140518');
insert into member values('user07', 5555, '피존투', '피존투', '20100505', '남', '472-901', '경기도 성남시 분당구', '삼평동 유스페이스', 'user07@naver.com', '010-1111-1111', '중식', 100000, 'user', '20140517');
insert into member values('user08', 5555, '또가스', '또가스', '20100505', '남', '472-901', '경기도 성남시 분당구', '삼평동 유스페이스', 'user08@naver.com', '010-1111-1111', '한식', 100000, 'user', '20140516');
insert into member values('user09', 5555, '리자드', '리자드', '20100505', '남', '472-901', '경기도 성남시 분당구', '삼평동 유스페이스', 'user09@naver.com', '010-1111-1111', '중식', 100000, 'user', '20140515');
insert into member values('user10', 5555, '리자몽', '리자몽', '20100505', '남', '472-901', '경기도 성남시 분당구', '삼평동 유스페이스', 'user10@naver.com', '010-1111-1111', '한식', 100000, 'user', '20140514');
insert into member values('user11', 5555, '어니부기', '어니부기', '20100505', '남', '472-901', '경기도 성남시 분당구', '삼평동 유스페이스', 'user11@naver.com', '010-1111-1111', '일식', 100000, 'user', '20140513');
insert into member values('user12', 5555, '거북왕', '거북왕', '20100505', '남', '472-901', '경기도 성남시 분당구', '삼평동 유스페이스', 'user12@naver.com', '010-1111-1111', '양식', 100000, 'user', '20140512');
insert into member values('user13', 5555, '아상해씨', '이상해씨', '20100505', '남', '472-901', '경기도 성남시 분당구', '삼평동 유스페이스', 'user13@naver.com', '010-1111-1111', '한식', 100000, 'user', '20140511');
insert into member values('user14', 5555, '이상해풀', '이상해풀', '20100505', '남', '472-901', '경기도 성남시 분당구', '삼평동 유스페이스', 'user14@naver.com', '010-1111-1111', '한식', 100000, 'user', '20140510');
insert into member values('user15', 5555, '이상해꽃', '이상해꽃', '20100505', '남', '472-901', '경기도 성남시 분당구', '삼평동 유스페이스', 'user15@naver.com', '010-1111-1111', '한식', 100000, 'user', '20140501');

update member set grade='master' where member_id='master'

update member set grade='master' 	where member_id='2';
update member set mileage=11111 	where member_id='2';
select * from member;
delete member where member_id='1';
insert into CATEGORY values('회원관련', '회원관련');
insert into CATEGORY values('맛집관련', '맛집관련');
insert into CATEGORY values('리뷰관련', '리뷰관련');

insert into location values(location_no_seq.nextval, '유스페이스 1동', '3');
insert into location values(location_no_seq.nextval, '유스페이스 1동', '2');
insert into location values(location_no_seq.nextval, '유스페이스 1동', '1');
insert into location values(location_no_seq.nextval, '유스페이스 1동', 'B1');
insert into location values(location_no_seq.nextval, '유스페이스 2동', '2');
insert into location values(location_no_seq.nextval, '유스페이스 2동', '1');
insert into location values(location_no_seq.nextval, '유스페이스 2동', 'B1');
insert into location values(location_no_seq.nextval, 'H스퀘어 N동', '2');
insert into location values(location_no_seq.nextval, 'H스퀘어 N동', '1');
insert into location values(location_no_seq.nextval, 'H스퀘어 N동', 'B1');
insert into location values(location_no_seq.nextval, 'H스퀘어 S동', '2');
insert into location values(location_no_seq.nextval, 'H스퀘어 S동', '1');
insert into location values(location_no_seq.nextval, 'H스퀘어 S동', 'B1');

--유스페이스2동2층
insert into restaurant values(restaurant_no_seq.nextval, '새마을식당', '한식', '031-628-6694', '경기도 성남시 분당구 삼평동', '백주부의 새마을식당이쥬', '11111111111111,11111111111112,11111111111113,11111111111114,', 0, 0, '가족,연인,친구,회식,', '20150530', 0, 5);
insert into food values(food_no_seq.nextval, '열탄불고기', 8000, '5330원/100g', 1);
insert into food values(food_no_seq.nextval, '소금구이', 9000, '6000원/100g', 1);
insert into food values(food_no_seq.nextval, '만신창삼겹살', 9000, '(오리지날/마늘/간장) 6000원/100g', 1);
insert into food values(food_no_seq.nextval, '차돌박이', 13000, '8670원/100g', 1);
insert into food values(food_no_seq.nextval, '껍데기', 6000, '4000원/100g', 1);
insert into food values(food_no_seq.nextval, '7분돼지김치', 5000, null, 1);
insert into food values(food_no_seq.nextval, '새마을된장찌개', 6000, null, 1);
insert into food values(food_no_seq.nextval, '냉김치말이국수', 4000, null, 1);
insert into food values(food_no_seq.nextval, '옛날도시락', 3000, null, 1);
insert into restaurant values(restaurant_no_seq.nextval, '육회드림', '한식', '031-628-7354', '경기도 성남시 분당구 삼평동', '육회드림림', '11111111111121,', 0, 0, '회식,', '20150530', 0, 5);
insert into food values(food_no_seq.nextval, '육회비빔밥', 6000, null, 2);
insert into food values(food_no_seq.nextval, '시골국밥', 5000, null, 2);
insert into restaurant values(restaurant_no_seq.nextval, '원할머니보쌈', '한식', '031-628-6755', '경기도 성남시 분당구 삼평동', '원할머니보쌈입니다<br>할매의손맛을봐라', '11111111111131,', 0, 0, '가족,친구,회식,', '20150530', 0, 5);
insert into food values(food_no_seq.nextval, '보쌈정식', 8000, null, 3);
insert into food values(food_no_seq.nextval, '오리보쌈정식', 9000, null, 3);
insert into food values(food_no_seq.nextval, '원쌈버섯육개장', 6000, null, 3);
insert into restaurant values(restaurant_no_seq.nextval, '봉추찜닭', '한식', '031-628-6981', '경기도 성남시 분당구 삼평동', '봉<br>추<br>찜<br>닭', '11111111111141,', 0, 0, '친구,회식,', '20150530', 0, 5);
insert into food values(food_no_seq.nextval, '찜닭-小', 20000, '2인분 (닭:국산)', 4);
insert into food values(food_no_seq.nextval, '찜닭-中', 30000, '3~4인분 (닭:국산)', 4);
insert into food values(food_no_seq.nextval, '찜닭-大', 40000, '4~5인분 (닭:국산)', 4);
insert into restaurant values(restaurant_no_seq.nextval, '얼큰이 찌개마을', '한식', '031-628-2222', '경기도 성남시 분당구 삼평동', '얼큰이<br>찌개마을', '11111111111181,', 0, 0, '가족,', '20150531', 0, 5);
insert into food values(food_no_seq.nextval, '돼지김치찌개', 6000, null, 5);
insert into food values(food_no_seq.nextval, '동태탕', 6000, null, 5);
insert into food values(food_no_seq.nextval, '부대찌개', 12000, '2인분', 5);
insert into restaurant values(restaurant_no_seq.nextval, '평안도찹쌀순대', '한식', '031-739-8900', '경기도 성남시 분당구 삼평동', '평안도<br>찹쌀순대', '11111111111191,', 0, 0, '가족,친구,회식,', '20150531', 0, 5);
insert into food values(food_no_seq.nextval, '순대국밥', 6500, '순대+고기', 6);
insert into food values(food_no_seq.nextval, '순대만국밥', 6500, null, 6);
insert into food values(food_no_seq.nextval, '고기만국밥', 6500, null, 6);
insert into restaurant values(restaurant_no_seq.nextval, '이치류', '일식', '031-739-0706', '경기도 성남시 분당구 삼평동', '일류', '11111111111201,', 0, 0, '가족,연인,', '20150531', 0, 5);
insert into restaurant values(restaurant_no_seq.nextval, '선어', '일식', '031-739-1585', '경기도 성남시 분당구 삼평동', '횟집입니다', '11111111111211,', 0, 0, '가족,연인,회식,', '20150531', 0, 5);
insert into food values(food_no_seq.nextval, '무한리필코스', 33000, null, 8);
insert into food values(food_no_seq.nextval, '정식코스', 26000, '회/스끼다시 리필 안되요', 8);
insert into restaurant values(restaurant_no_seq.nextval, '머구리', '일식', '031-628-6766', '경기도 성남시 분당구 삼평동', '횟집입니다', '11111111111221,', 0, 0, '가족,연인,회식,', '20150531', 0, 5);
insert into food values(food_no_seq.nextval, '머구리사시미', 40000, null, 9);
insert into food values(food_no_seq.nextval, '특사시미', 50000, null, 9);
insert into food values(food_no_seq.nextval, '회덮밥', 8000, null, 9);
insert into restaurant values(restaurant_no_seq.nextval, '홍스쭈꾸미', '한식', '031-628-1222', '경기도 성남시 분당구 삼평동', '쭈꾸미', '11111111111231,', 0, 0, '가족,친구,', '20150531', 0, 5);
insert into restaurant values(restaurant_no_seq.nextval, '후니네 생선굽네', '한식', '031-628-1223', '경기도 성남시 분당구 삼평동', '생선', '11111111111241,', 0, 0, '가족,친구,', '20150531', 0, 5);
insert into restaurant values(restaurant_no_seq.nextval, 'PUZZLE', '양식', '031-628-1224', '경기도 성남시 분당구 삼평동', '피자', '11111111111251,', 0, 0, '연인,친구,', '20150531', 0, 5);
insert into restaurant values(restaurant_no_seq.nextval, '정원오리부추구이', '한식', '031-628-1225', '경기도 성남시 분당구 삼평동', '오리', '11111111111261,', 0, 0, '가족,회식,', '20150531', 0, 5);
insert into restaurant values(restaurant_no_seq.nextval, '교동전선생', '한식', '031-628-1226', '경기도 성남시 분당구 삼평동', '전집', '11111111111271,', 0, 0, '연인,친구,', '20150531', 0, 5);
insert into restaurant values(restaurant_no_seq.nextval, '고메부인', '한식', '031-628-1227', '경기도 성남시 분당구 삼평동', '고메고메', '11111111111281,', 0, 0, '가족,연인,친구,회식,', '20150531', 0, 5);
insert into restaurant values(restaurant_no_seq.nextval, '토속상황삼계탕', '한식', '031-628-1228', '경기도 성남시 분당구 삼평동', '삼계탕', '11111111111291,', 0, 0, '가족,연인,친구,회식,', '20150531', 0, 5);
insert into restaurant values(restaurant_no_seq.nextval, '복불복', '한식', '031-628-1229', '경기도 성남시 분당구 삼평동', '복집', '11111111111301,', 0, 0, '가족,회식,', '20150531', 0, 5);

--유스페이스2동1층
insert into restaurant values(restaurant_no_seq.nextval, '본스치킨', '양식', '031-628-2362', '경기도 성남시 분당구 삼평동', '본스본스', '11111111111151,', 0, 0, '연인,', '20150530', 0, 6);
insert into food values(food_no_seq.nextval, '스파이시감자튀김', 13000, 'SPICY POTATO', 18);
insert into food values(food_no_seq.nextval, '본스소세지', 17000, 'SAUSAGE COMBO', 18);
insert into food values(food_no_seq.nextval, '무뼈닭발', 16000, 'BONELESS CHICKEN FEET', 18);
insert into restaurant values(restaurant_no_seq.nextval, '종로김밥', '한식', '031-628-6969', '경기도 성남시 분당구 삼평동', '김밥집', '11111111111161,', 0, 0, '연인,친구,', '20150530', 0, 6);
insert into food values(food_no_seq.nextval, '종로김밥', 2500, null, 19);
insert into food values(food_no_seq.nextval, '치즈김밥', 3000, null, 19);
insert into food values(food_no_seq.nextval, '참치김밥', 3500, null, 19);
insert into food values(food_no_seq.nextval, '신라면', 3000, null, 19);
insert into food values(food_no_seq.nextval, '떡라면', 3500, null, 19);
insert into food values(food_no_seq.nextval, '제육덮밥', 5500, null, 19);
insert into restaurant values(restaurant_no_seq.nextval, 'SUBWAY', '양식', '031-739-8300', '경기도 성남시 분당구 삼평동', '샌드위치집', '11111111111171,', 0, 0, '가족,연인,친구,', '20150530', 0, 6);
insert into food values(food_no_seq.nextval, '베지샐러드', 5000, null, 20);
insert into food values(food_no_seq.nextval, '에그마요샐러드', 5400, null, 20);

insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'수지의 맛있는 스테이크','<img src="/WTP05_YMZ/se2/multiupload/20150531094326493d07d5-6040-49f7-8ddd-8f9bec730a4e.jpg" title="suzy.jpg"><br style="clear:both;">','1234','150','2015-06-03 11:12:20','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'새마을식당','1','1','1','2015-06-02 09:12:20','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'버거킹','1','221','0','2015-06-02 07:12:20','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'맥도날드','1','15','11','2015-06-01 05:12:20','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'롯데리아','1','542','22','2015-06-01 03:12:20','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'차지족발','1','412','6','2015-06-01 01:12:20','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'재스기네치킨','1','333','31','2014-11-27 11:12:20','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'한솥도시락','1','12','2','2013-12-08 11:12:20','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'코스타국밥','1','53','0','2013-02-03 11:12:20','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'파리바게트','1','111','4','2013-01-01 11:12:20','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'대게나라','1','245','44','2012-09-28 11:12:20','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'면사무소','1','311','38','2011-11-14 11:12:20','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'중국성','1','454','14','2010-12-12 11:12:20','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'차지치킨','1','444','6','2010-11-11 11:12:20','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'도미노피자','1','774','66','2009-12-31 11:12:20','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'파파존스','1','97','34','2008-02-11 11:12:20','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'미스터피자','1','831','84','2004-12-25 11:12:20','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'프로듀사롤하느라못봄','1','444','11','1999-04-04 11:00:10','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'프로듀사롤하느라못봄','1','443','12','1998-04-04 11:00:10','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'프로듀사롤하느라못봄','1','442','13','1997-04-04 11:00:10','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'프로듀사롤하느라못봄','1','441','22','1996-04-04 11:00:10','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'프로듀사롤하느라못봄','1','440','24','1995-04-04 11:00:10','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'프로듀사롤하느라못봄','1','100','52','1972-04-04 11:00:10','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'프로듀사롤하느라못봄','1','99','31','1993-04-04 11:00:10','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'프로듀사롤하느라못봄','1','98','32','1992-04-04 11:00:10','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'프로듀사롤하느라못봄','1','97','44','1991-04-04 11:00:10','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'프로듀사롤하느라못봄','1','96','36','1990-04-04 11:00:10','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'프로듀사롤하느라못봄','1','96','63','1989-04-04 11:00:10','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'프로듀사롤하느라못봄','1','95','88','1988-04-04 11:00:10','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'프로듀사롤하느라못봄','1','94','92','1987-04-04 11:00:10','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'프로듀사롤하느라못봄','1','93','123','1986-04-04 11:00:10','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'프로듀사롤하느라못봄','1','92','142','1985-04-04 11:00:10','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'프로듀사롤하느라못봄','1','91','121','1984-04-04 11:00:10','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'프로듀사롤하느라못봄','1','90','111','1983-04-04 11:00:10','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'프로듀사롤하느라못봄','1','99','194','1982-04-04 11:00:10','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'프로듀사롤하느라못봄','1','99','321','1981-04-04 11:00:10','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'프로듀사롤하느라못봄','1','99','233','1980-04-04 11:00:10','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'프로듀사롤하느라못봄','1','99','221','1979-04-04 11:00:10','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'프로듀사롤하느라못봄','1','899','94','1978-04-04 11:00:10','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'프로듀사롤하느라못봄','1','799','84','1977-04-04 11:00:10','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'프로듀사롤하느라못봄','1','699','74','1976-04-04 11:00:10','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'프로듀사롤하느라못봄','1','599','64','1975-04-04 11:00:10','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'프로듀사롤하느라못봄','1','499','54','1974-04-04 11:00:10','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'프로듀사롤하느라못봄','1','399','44','1973-04-04 11:00:10','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'프로듀사롤하느라못봄','1','299','34','1972-12-04 11:00:10','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'프로듀사롤하느라못봄','1','199','24','1972-11-04 11:00:10','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'프로듀사롤하느라못봄','1','99','14','1972-10-04 11:00:10','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'프로듀사롤하느라못봄','1','89','144','1972-09-04 11:00:10','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'프로듀사롤하느라못봄','1','79','244','1972-08-04 11:00:10','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'프로듀사롤하느라못봄','1','69','344','1972-07-04 11:00:10','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'프로듀사롤하느라못봄','1','59','444','1972-06-04 11:00:10','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'프로듀사롤하느라못봄','1','49','544','1972-05-04 11:00:10','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'프로듀사롤하느라못봄','1','39','644','1972-04-04 11:00:10','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'프로듀사롤하느라못봄','1','29','744','1972-03-04 11:00:10','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'프로듀사롤하느라못봄','1','19','643','1972-02-04 11:00:10','user01');
--
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'프로듀사롤하느라못봄','1','69','344','1972-07-04 11:00:10','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'프로듀사롤하느라못봄','1','59','444','1972-06-04 11:00:10','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'프로듀사롤하느라못봄','1','49','544','1972-05-04 11:00:10','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'프로듀사롤하느라못봄','1','39','644','1972-04-04 11:00:10','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'프로듀사롤하느라못봄','1','29','744','1972-03-04 11:00:10','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'프로듀사롤하느라못봄','1','19','643','1972-02-04 11:00:10','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'프로듀사롤하느라못봄','1','69','344','1972-07-04 11:00:10','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'프로듀사롤하느라못봄','1','59','444','1972-06-04 11:00:10','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'프로듀사롤하느라못봄','1','49','544','1972-05-04 11:00:10','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'프로듀사롤하느라못봄','1','39','644','1972-04-04 11:00:10','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'프로듀사롤하느라못봄','1','29','744','1972-03-04 11:00:10','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'프로듀사롤하느라못봄','1','19','643','1972-02-04 11:00:10','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'프로듀사롤하느라못봄','1','69','344','1972-07-04 11:00:10','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'프로듀사롤하느라못봄','1','59','444','1972-06-04 11:00:10','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'프로듀사롤하느라못봄','1','49','544','1972-05-04 11:00:10','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'프로듀사롤하느라못봄','1','39','644','1972-04-04 11:00:10','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'프로듀사롤하느라못봄','1','29','744','1972-03-04 11:00:10','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'프로듀사롤하느라못봄','1','19','643','1972-02-04 11:00:10','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'프로듀사롤하느라못봄','1','69','344','1972-07-04 11:00:10','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'프로듀사롤하느라못봄','1','59','444','1972-06-04 11:00:10','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'프로듀사롤하느라못봄','1','49','544','1972-05-04 11:00:10','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'프로듀사롤하느라못봄','1','39','644','1972-04-04 11:00:10','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'프로듀사롤하느라못봄','1','29','744','1972-03-04 11:00:10','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values(review_no_seq.nextval,'프로듀사롤하느라못봄','1','19','643','1972-02-04 11:00:10','user01');


insert into review_reply values(review_reply_no_seq.nextval, '20150530111220', '노맛', 'user01', 1);
insert into review_reply values(review_reply_no_seq.nextval, '2015-05-30 11:12:20', '짱짱', 'user01', 1);
insert into review_reply values(review_reply_no_seq.nextval, '2015-05-30 11:12:20', '구려', 'user01', 1);
insert into review_reply values(review_reply_no_seq.nextval, '2015-05-30 11:12:20', '차지가 쐈어요', 'user01', 2);
insert into review_reply values(review_reply_no_seq.nextval, '2015-05-30 11:12:20', '비싸....', 'user01', 2);
insert into review_reply values(review_reply_no_seq.nextval, '2015-05-30 11:12:20', '맛있엉!!', 'user01', 3);
insert into review_reply values(review_reply_no_seq.nextval, '2015-05-30 11:12:20', '알바 쩌네요...', 'user01', 3);
insert into review_reply values(review_reply_no_seq.nextval, '2015-05-30 11:12:20', 'ㅋㅋㅋㅋㅋㅋㅋㅋ', 'user01', 3);


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
values(qna_no_seq.nextval, qna_no_seq.currval, 0, 0, '회원탈퇴 어떻게 해요?', '맛집관련', '20150503', 18, '8안녕하세요! 관리자님 제가 회원탈퇴를 하려고 하는데 어떻게 해야되나요?', 'user01');

insert into QNA (qna_no, qna_refamily, qna_restep, qna_relevel, qna_title, qna_category, qna_registration_date, qna_hits, qna_content, member_id) 
values(qna_no_seq.nextval, qna_no_seq.currval, 0, 0, '회원탈퇴 어떻게 해요?', '리뷰관련', '20150504', 19, '9안녕하세요! 관리자님 제가 회원탈퇴를 하려고 하는데 어떻게 해야되나요?', 'user01');

insert into QNA (qna_no, qna_refamily, qna_restep, qna_relevel, qna_title, qna_category, qna_registration_date, qna_hits, qna_content, member_id) 
values(qna_no_seq.nextval, qna_no_seq.currval, 0, 0, '회원탈퇴 어떻게 해요?', '회원관련', '20150506', 20, '10안녕하세요! 관리자님 제가 회원탈퇴를 하려고 하는데 어떻게 해야되나요?', 'user01');
