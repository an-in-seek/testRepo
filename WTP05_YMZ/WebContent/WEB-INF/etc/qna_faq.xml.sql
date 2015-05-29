create sequence faq_no_seq;
drop sequence faq_no_seq;

insert into FAQ (faq_no, faq_title, faq_content) values(1, '1마일리지 충전하는 방법', '11마일리지를 충전하려면 어떻게 해야되나요?');
insert into FAQ (faq_no, faq_title, faq_content) values(faq_no_seq.nextval, '1마일리지 충전하는 방법', '11마일리지를 충전하려면 어떻게 해야되나요?');
insert into FAQ (faq_no, faq_title, faq_content) values(faq_no_seq.nextval, '2마일리지 충전하는 방법', '22마일리지를 충전하려면 어떻게 해야되나요?');
insert into FAQ (faq_no, faq_title, faq_content) values(faq_no_seq.nextval, '3마일리지 충전하는 방법', '33마일리지를 충전하려면 어떻게 해야되나요?');
insert into FAQ (faq_no, faq_title, faq_content) values(faq_no_seq.nextval, '4마일리지 충전하는 방법', '44마일리지를 충전하려면 어떻게 해야되나요?');
insert into FAQ (faq_no, faq_title, faq_content) values(faq_no_seq.nextval, '5마일리지 충전하는 방법', '55마일리지를 충전하려면 어떻게 해야되나요?');
insert into FAQ (faq_no, faq_title, faq_content) values(faq_no_seq.nextval, '6마일리지 충전하는 방법', '66마일리지를 충전하려면 어떻게 해야되나요?');
insert into FAQ (faq_no, faq_title, faq_content) values(faq_no_seq.nextval, '7마일리지 충전하는 방법', '77마일리지를 충전하려면 어떻게 해야되나요?');
insert into FAQ (faq_no, faq_title, faq_content) values(faq_no_seq.nextval, '8마일리지 충전하는 방법', '88마일리지를 충전하려면 어떻게 해야되나요?');
insert into FAQ (faq_no, faq_title, faq_content) values(faq_no_seq.nextval, '9마일리지 충전하는 방법', '99마일리지를 충전하려면 어떻게 해야되나요?');
insert into FAQ (faq_no, faq_title, faq_content) values(faq_no_seq.nextval, '10마일리지 충전하는 방법', '1010마일리지를 충전하려&lt;br>면 어떻게 해야되나요?');

delete from faq
delete from faq where faq_no=10;

select * from FAQ


create sequence faq_no_qna;
delete from qna

insert into QNA (qna_no, qna_title, qna_category, qna_registration_date, qna_hits, qna_content, member_id) 
values(1, '회원탈퇴 어떻게 해요?', '회원관련', '20150505', 1, '1안녕하세요! 관리자님 제가 회원탈퇴를 하려고 하는데 어떻게 해야되나요?', 'user01');
insert into QNA (qna_no, qna_title, qna_category, qna_registration_date, qna_hits, qna_content, member_id) 
values(2, '회원탈퇴 어떻게 해요?', '회원관련', '20150405', 2, '2안녕하세요! 관리자님 제가 회원탈퇴를 하려고 하는데 어떻게 해야되나요?', 'user02');
insert into QNA (qna_no, qna_title, qna_category, qna_registration_date, qna_hits, qna_content, member_id) 
values(3, '회원탈퇴 어떻게 해요?', '맛집관련', '20150405', 3, '3안녕하세요! 관리자님 제가 회원탈퇴를 하려고 하는데 어떻게 해야되나요?', 'user03');
insert into QNA (qna_no, qna_title, qna_category, qna_registration_date, qna_hits, qna_content, member_id) 
values(4, '회원탈퇴 어떻게 해요?', '맛집관련', '20150205', 14, '4안녕하세요! 관리자님 제가 회원탈퇴를 하려고 하는데 어떻게 해야되나요?', 'user04');
insert into QNA (qna_no, qna_title, qna_category, qna_registration_date, qna_hits, qna_content, member_id) 
values(5, '회원탈퇴 어떻게 해요?', '리뷰관련', '20150105', 15, '5안녕하세요! 관리자님 제가 회원탈퇴를 하려고 하는데 어떻게 해야되나요?', 'user05');
insert into QNA (qna_no, qna_title, qna_category, qna_registration_date, qna_hits, qna_content, member_id) 
values(6, '회원탈퇴 어떻게 해요?', '리뷰관련', '20150501', 16, '6안녕하세요! 관리자님 제가 회원탈퇴를 하려고 하는데 어떻게 해야되나요?', 'user06');
insert into QNA (qna_no, qna_title, qna_category, qna_registration_date, qna_hits, qna_content, member_id) 
values(7, '회원탈퇴 어떻게 해요?', '회원관련', '20150502', 17, '7안녕하세요! 관리자님 제가 회원탈퇴를 하려고 하는데 어떻게 해야되나요?', 'user07');
insert into QNA (qna_no, qna_title, qna_category, qna_registration_date, qna_hits, qna_content, member_id) 
values(8, '회원탈퇴 어떻게 해요?', '맛집관련', '20150503', 18, '8안녕하세요! 관리자님 제가 회원탈퇴를 하려고 하는데 어떻게 해야되나요?', 'user08');
insert into QNA (qna_no, qna_title, qna_category, qna_registration_date, qna_hits, qna_content, member_id) 
values(9, '회원탈퇴 어떻게 해요?', '리뷰관련', '20150504', 19, '9안녕하세요! 관리자님 제가 회원탈퇴를 하려고 하는데 어떻게 해야되나요?', 'user09');
insert into QNA (qna_no, qna_title, qna_category, qna_registration_date, qna_hits, qna_content, member_id) 
values(11, '회원탈퇴 어떻게 해요?', '회원관련', '20150506', 20, '10안녕하세요! 관리자님 제가 회원탈퇴를 하려고 하는데 어떻게 해야되나요?', 'user10');
