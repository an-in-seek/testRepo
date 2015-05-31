delete from member CASCADE CONSTRAINTS;
delete from restaurant CASCADE CONSTRAINTS;
delete from location CASCADE CONSTRAINTS;
delete from review CASCADE CONSTRAINTS;
delete from faq CASCADE CONSTRAINTS;
delete from qna CASCADE CONSTRAINTS;

insert into member values('user01', 1111, '관리자', '피카츄', '20100505', '남', '472-901', '경기도 성남시 분당구', '삼평동 유스페이스', 'user01@naver.com', '010-1111-1111', '한식', 10, '관리자', '20140514');

insert into location values(1, '유스페이스 1A동', '1');
insert into location values(2, '유스페이스 1B동', '1');
insert into location values(3, '유스페이스 2A동', '1');
insert into location values(4, '유스페이스 2B동', '1');
insert into location values(5, 'H스퀘어 N동', '1');
insert into location values(6, 'H스퀘어 S동', '1');
insert into location values(7, '삼환하이펙스 A동', '1');
insert into location values(8, '삼환하이펙스 B동', '1');
insert into location values(9, '아브뉴프랑', '1');
insert into location values(10, '유스페이스 2B동', '2');

insert into restaurant values(1, '새마을식당', '한식', '031-111-2222', '경기도 성남시 분당구 삼평동', '백주부의 새마을식당이쥬', '111111111111111,111111111111112,111111111111113,111111111111114,', 0, 0, '회식,', '20150530', 0, 10);
insert into food values(food_no_seq.nextval, '7분김치찌개', 5000, '7분만 끓이면 된다해', 1);
insert into food values(food_no_seq.nextval, '된장찌개', 6000, '미소된장 쓰면 맛없쥬', 1);
insert into food values(food_no_seq.nextval, '열탄불고기', 8000, '6월 1일 50% 세일', 1);

insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values('90','수지의 맛있는 스테이크','<img src="/WTP05_YMZ/se2/multiupload/20150531094326493d07d5-6040-49f7-8ddd-8f9bec730a4e.jpg" title="suzy.jpg"><br style="clear:both;">','1234','150','20150530','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values('91','새마을식당','1','1','1','20150528','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values('92','버거킹','1','221','0','20140420','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values('93','맥도날드','1','15','11','20130311','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values('94','롯데리아','1','542','22','20120715','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values('95','차지족발','1','412','6','20110622','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values('96','재스기네치킨','1','333','31','20101127','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values('97','한솥도시락','1','12','2','20061208','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values('98','코스타국밥','1','53','0','20040203','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values('99','파리바게트','1','111','4','20070101','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values('100','대게나라','1','245','44','20090928','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values('101','면사무소','1','311','38','20001114','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values('102','중국성','1','454','14','19981212','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values('103','차지치킨','1','444','6','19941111','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values('104','도미노피자','1','774','66','19921231','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values('105','파파존스','1','97','34','20020211','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values('106','미스터피자','1','831','84','20041225','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values('1000','프로듀사롤하느라못봄','1','444','44','19940404','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values('1001','프로듀사롤하느라못봄','1','444','44','19940404','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values('1002','프로듀사롤하느라못봄','1','444','44','19940404','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values('1003','프로듀사롤하느라못봄','1','444','44','19940404','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values('1004','프로듀사롤하느라못봄','1','444','44','19940404','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values('1005','프로듀사롤하느라못봄','1','444','44','19940404','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values('1006','프로듀사롤하느라못봄','1','444','44','19940404','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values('1007','프로듀사롤하느라못봄','1','444','44','19940404','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values('1008','프로듀사롤하느라못봄','1','444','44','19940404','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values('1009','프로듀사롤하느라못봄','1','444','44','19940404','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values('1010','프로듀사롤하느라못봄','1','444','44','19940404','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values('1011','프로듀사롤하느라못봄','1','444','44','19940404','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values('1012','프로듀사롤하느라못봄','1','444','44','19940404','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values('1013','프로듀사롤하느라못봄','1','444','44','19940404','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values('1014','프로듀사롤하느라못봄','1','444','44','19940404','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values('1015','프로듀사롤하느라못봄','1','444','44','19940404','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values('1016','프로듀사롤하느라못봄','1','444','44','19940404','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values('1017','프로듀사롤하느라못봄','1','444','44','19940404','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values('1018','프로듀사롤하느라못봄','1','444','44','19940404','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values('1019','프로듀사롤하느라못봄','1','444','44','19940404','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values('1020','프로듀사롤하느라못봄','1','444','44','19940404','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values('1021','프로듀사롤하느라못봄','1','444','44','19940404','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values('1022','프로듀사롤하느라못봄','1','444','44','19940404','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values('1023','프로듀사롤하느라못봄','1','444','44','19940404','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values('1024','프로듀사롤하느라못봄','1','444','44','19940404','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values('1025','프로듀사롤하느라못봄','1','444','44','19940404','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values('1026','프로듀사롤하느라못봄','1','444','44','19940404','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values('1027','프로듀사롤하느라못봄','1','444','44','19940404','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values('1028','프로듀사롤하느라못봄','1','444','44','19940404','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values('1029','프로듀사롤하느라못봄','1','444','44','19940404','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values('1030','프로듀사롤하느라못봄','1','444','44','19940404','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values('1031','프로듀사롤하느라못봄','1','444','44','19940404','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values('1032','프로듀사롤하느라못봄','1','444','44','19940404','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values('1033','프로듀사롤하느라못봄','1','444','44','19940404','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values('1034','프로듀사롤하느라못봄','1','444','44','19940404','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values('1035','프로듀사롤하느라못봄','1','444','44','19940404','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values('1036','프로듀사롤하느라못봄','1','444','44','19940404','user01');
insert into review(review_no, title, content, hits, recommend, reg_date, member_id) values('1037','프로듀사롤하느라못봄','1','444','44','19940404','user01');

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


insert into QNA (qna_no, qna_title, qna_category, qna_registration_date, qna_hits, qna_content, member_id) 
values(qna_no_seq.nextval, '유스페이스A 건물이 어디에 있나요?', '맛집관련', '20150505', 1, '1안녕하세요! 관리자님 제가 회원탈퇴를 하려고 하는데 어떻게 해야되나요?', 'user01');

insert into QNA (qna_no, qna_title, qna_category, qna_registration_date, qna_hits, qna_content, member_id) 
values(qna_no_seq.nextval, '회원탈퇴 어떻게 해요?', '회원관련', '20150405', 2, '2안녕하세요! 관리자님 제가 회원탈퇴를 하려고 하는데 어떻게 해야되나요?', 'user01');

insert into QNA (qna_no, qna_title, qna_category, qna_registration_date, qna_hits, qna_content, member_id) 
values(qna_no_seq.nextval, '유스페이스B 건물이 어디에 있나요?', '맛집관련', '20150405', 3, '3안녕하세요! 관리자님 제가 회원탈퇴를 하려고 하는데 어떻게 해야되나요?', 'user01');

insert into QNA (qna_no, qna_title, qna_category, qna_registration_date, qna_hits, qna_content, member_id) 
values(qna_no_seq.nextval, 'H스퀘어 건물이 어디에 있나요?', '맛집관련', '20150205', 14, '4안녕하세요! 관리자님 제가 회원탈퇴를 하려고 하는데 어떻게 해야되나요?', 'user01');

insert into QNA (qna_no, qna_title, qna_category, qna_registration_date, qna_hits, qna_content, member_id) 
values(qna_no_seq.nextval, '포스텍 건물이 어디에 있나요?', '맛집관련', '20150105', 15, '5안녕하세요! 관리자님 제가 회원탈퇴를 하려고 하는데 어떻게 해야되나요?', 'user01');

insert into QNA (qna_no, qna_title, qna_category, qna_registration_date, qna_hits, qna_content, member_id) 
values(qna_no_seq.nextval, '리뷰 게시물 양식은 어떻게 써요?', '리뷰관련', '20150501', 16, '6안녕하세요! 관리자님 제가 회원탈퇴를 하려고 하는데 어떻게 해야되나요?', 'user01');

insert into QNA (qna_no, qna_title, qna_category, qna_registration_date, qna_hits, qna_content, member_id) 
values(qna_no_seq.nextval, '회원탈퇴 어떻게 해요?', '회원관련', '20150502', 17, '7안녕하세요! 관리자님 제가 회원탈퇴를 하려고 하는데 어떻게 해야되나요?', 'user01');

insert into QNA (qna_no, qna_title, qna_category, qna_registration_date, qna_hits, qna_content, member_id) 
values(qna_no_seq.nextval, '회원탈퇴 어떻게 해요?', '맛집관련', '20150503', 18, '8안녕하세요! 관리자님 제가 회원탈퇴를 하려고 하는데 어떻게 해야되나요?', 'user01');

insert into QNA (qna_no, qna_title, qna_category, qna_registration_date, qna_hits, qna_content, member_id) 
values(qna_no_seq.nextval, '회원탈퇴 어떻게 해요?', '리뷰관련', '20150504', 19, '9안녕하세요! 관리자님 제가 회원탈퇴를 하려고 하는데 어떻게 해야되나요?', 'user01');

insert into QNA (qna_no, qna_title, qna_category, qna_registration_date, qna_hits, qna_content, member_id) 
values(qna_no_seq.nextval, '회원탈퇴 어떻게 해요?', '회원관련', '20150506', 20, '10안녕하세요! 관리자님 제가 회원탈퇴를 하려고 하는데 어떻게 해야되나요?', 'user01');
