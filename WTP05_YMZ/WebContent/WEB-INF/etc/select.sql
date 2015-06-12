select * from Member;

select * from RESTAURANT;
select * from RESTAURANT_REPLY 
select * from  FOOD;
select * from LOCATION ;

select * from review;
select * from REVIEW_REPLY 
select * from REVIEW_RECOMMEND;

select * from REPORTED_REVIEW;
select * from REPORTED_REPLY;

select * from qna;
select * from faq;

select * from first_catefory
select * from second_category;


select SECOND_CATEGORY_NAME from SECOND_CATEGORY where FIRST_CATEGORY_ID='F-1';
select SECOND_CATEGORY_ID, SECOND_CATEGORY_NAME from SECOND_CATEGORY where FIRST_CATEGORY_ID='F-1';
select SECOND_CATEGORY_NAME from SECOND_CATEGORY where FIRST_CATEGORY_ID='F-1';
select * from SECOND_CATEGORY where FIRST_CATEGORY_ID='F-1';