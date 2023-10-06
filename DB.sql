/*
drop sequence seq_category_category_idx;

  drop sequence seq_product_p_idx;
  
   drop sequence seq_member_mem_idx;
   
    drop sequence seq_owner_o_idx;
    
     drop sequence seq_cart_cart_idx;
     
      drop sequence seq_category_category_idx;
      
       drop sequence seq_comment_board_c_b_idx;
       
        drop sequence seq_pay_pay_idx;
        
         drop sequence seq_admin_admin_idx;
-------------------------------------------------------------------------------------------------
drop table board
drop table cart
drop table category
drop table pay
drop table admin
drop table owner
drop table product
drop table member

drop table comment_board




SELECT 'DROP TABLE "' || TABLE_NAME || '" CASCADE CONSTRAINTS;' FROM user_tables;

DROP MEMBER FROM USER

DROP owner FROM USER;

DROP board FROM USER;

DROP admin FROM USER;

DROP product FROM USER;

DROP cart FROM USER;

DROP category FROM USER;

DROP comment_board FROM USER;

DROP pay FROM USER;



         
-------------------------------------------------------------------------------------------------      
select * from category
select * from product
select * from CATEGORY
select * from Board
select * from owner
select * from member
select * from pay
select * from delivery
select * from admin



SELECT * FROM  WHERE category_name = '';

SELECT * FROM category WHERE category_idx = '3';





create sequence seq_delivery_d_idx;


create table delivery
(
d_idx   int ,      --주문자일련번호
d_name  varchar2(50) not null,  --주문자이름
d_zipcode  varchar2  (100) not null,   --주문자우편번호
d_addr     varchar2  (200) not null,   --주문자주소
d_tel      varchar2  (100) not null,  --주문자연락처
pay_num    int                    --결제일련번호(FK)    
)

alter table delivery
    add constraint pk_delivery_d_idx primary key(d_idx);

alter table delivery
    add constraint fk_pay_num foreign key(pay_num) references pay(pay_num);

delete from pay
select * from pay
select * from delivery


create table delivery
(
  d_idx   int ,                          --주문자일련번호
  d_name  varchar2(50) not null,         --주문자이름
  d_zipcode  varchar2  (100) not null,   --주문자우편번호
  d_addr     varchar2  (200) not null,   --주문자주소
  d_tel      varchar2  (100) not null,   --주문자연락처
  pay_num int                            --결제일련번호(FK)    
);

  	ALTER TABLE delivery
	ADD o_idx int;

alter table delivery add constraint pk_delivery_d_idx primary key(d_idx);
alter table delivery add constraint fk_pay_num foreign key(pay_num) references pay(pay_num);

alter table delivery
    add constraint fk_o_idx foreign key(o_idx) references owner(o_idx);





-------------------------------------------------------------------------------------------------
         
----owner TABLE------

create sequence seq_owner_o_idx

create table owner
    (
        o_idx int,
        o_name varchar2(50),
        o_email varchar2(100),
        o_id varchar2(50),
        o_pwd varchar2(50),
        o_addr varchar2(100),
        o_tel varchar2(50),
        approvalStatus VARCHAR(255),
        o_zipcode varchar2(100)
    )
    
    ALTER TABLE owner
	ADD approvalStatus VARCHAR(255);
	
	alter table owner
  add o_zipcode varchar2(100);
    
    alter table owner 
	add constraint pk_owner_o_idx primary key(o_idx);
    
    alter table owner
	add constraint unique_owner_o_id unique(o_id);

  INSERT INTO owner VALUES(
    SEQ_owner_o_idx.NEXTVAL,
    '홍길동',
    '1234@1234.com',
    '1234',
    '1234',
    '1234',
    '010-1234-1234'
);

---------------------------------------------------------------------------------------

------CATEGORY TABLE-------------


create sequence seq_category_category_idx

create table category
(
category_idx int ,
category_code int,
category_name varchar2(100)

);

alter table category
  add constraint  pk_category_category_idx primary key(category_idx);

INSERT INTO category VALUES(
    SEQ_CATEGORY_CATEGORY_IDX.NEXTVAL,
    1,
    'TYPE-1(단상))'
);

INSERT INTO category VALUES(
    SEQ_CATEGORY_CATEGORY_IDX.NEXTVAL,
    1,
    'TYPE-2(3상))'
);

INSERT INTO category VALUES(
    SEQ_CATEGORY_CATEGORY_IDX.NEXTVAL,
    2,
    'DC COMBO(TYPE-1)'
);

INSERT INTO category VALUES(
    SEQ_CATEGORY_CATEGORY_IDX.NEXTVAL,
    2,
    'DC COMBO(TYPE-2)'
);

INSERT INTO category VALUES(
    SEQ_CATEGORY_CATEGORY_IDX.NEXTVAL,
    2,
    'CHAdeMO'
);


-----------------------------------------------------------------------------------------------

--------product TABLE-------------

CREATE SEQUENCE SEQ_PRODUCT_P_IDX;

CREATE TABLE PRODUCT
(
P_IDX INT,
P_NUMBER INT,
P_NAME VARCHAR2(100),
P_PRICE INT,
P_SALEPRICE INT,
P_IMAGE_S VARCHAR2(100),
P_IMAGE_L VARCHAR2(100),
P_CONTENT VARCHAR2(100),
P_REGDATE VARCHAR2(100),
P_MODIFYDATE VARCHAR2(100),
CATEGORY_IDX INT,
O_IDX INT
);

ALTER TABLE PRODUCT
  ADD CONSTRAINT PK_PRODUCT_P_IDX PRIMARY KEY(P_IDX);

--외래키
alter table product
  add constraint fk_product_o_idx foreign key(o_idx) 
                               references owner(o_idx)
                               on delete cascade

ALTER TABLE PRODUCT ADD CONSTRAINT FK_CATEGORY_CATEGORY_IDX FOREIGN KEY(CATEGORY_IDX) REFERENCES CATEGORY(CATEGORY_IDX);

//
ALTER TABLE PRODUCT ADD CONSTRAINT FK_PRODUCT_O_IDX FOREIGN KEY(O_IDX) REFERENCES OWNER(O_IDX);
//






-----------------------------------------------------------------------------------------------


--------BOARD TABLE----------


--게시판 일련번호
create sequence seq_board_b_idx;

--게시판 테이블
create table board
(
    b_idx       int,                --일련번호
    b_subject     varchar2(500),    --제목
    b_content     varchar2(2000),   --내용
    b_ip          varchar2(100),    --아이피
    b_regdate     date,             --작성일자
    mem_idx      int,               --회원번호
    mem_name     varchar2(200),     --작성자명
    b_ref        int ,              --글번호
    b_step       int ,              --글순서
    b_readhit     int default 0    --조회수

)

--기본키
alter table board add constraint pk_board_b_idx primary key(b_idx);

--외래키
alter table board
  add constraint fk_board_mem_idx foreign key(mem_idx) 
                                  references member(mem_idx)
                                  on delete cascade;


--sample date

insert into board values(

    seq_board_b_idx.nextVal,
    '시작합니다',
    '프로젝트',
    '192.168.0.239',
    sysdate,
    1,
    '김파이널',
    41,
    0,
    20
);

select * from member
-----------------------------------------------------------------------------------------------


--------CART TABLE----------

--장바구니 일련번호
create sequence seq_cart_cart_idx;

--장바구니 테이블
create table cart
(
  cart_idx  int,
  cart_num  int  not null,
  p_idx  int,
  mem_idx int
);

alter table cart
  add constraint pk_cart_cart_idx primary key(cart_idx);

--상품테이블(product)의 idx와 p_idx간의 외래키 설정

alter table cart
  add constraint fk_cart_p_idx foreign key(p_idx) 
                               references product(p_idx)
                               on delete cascade;  
                                              

alter table cart
  add constraint fk_cart_mem_idx foreign key(mem_idx) 
                               references member(mem_idx)
                               on delete cascade;


select * from product
select * from member


insert into cart values(seq_cart_cart_idx.nextVal,1,1,1);


select * from cart

select * from all_tables

commit
select * from owner

-- Join을 통해서 조회정보를 추출
create or replace view cart_view
as
	select
	   p.p_idx,cart_idx, p_number,p_name,p_price,p_saleprice,
	   cart_num, cart_num* p_saleprice amount, mem_idx
	from product p inner join  cart c on p.p_idx = c.p_idx  

select * from cart_view where mem_idx=22

select * from BOARD

--장바구니 상품의 총계
select nvl(sum(amount),0) from cart_view where mem_idx=21


-----------------------------------------------------------------------------------------------


--------F-Charger TABLE----------

--즐겨찾기 시퀀스
create sequence seq_f_charger_f_idx;

--즐겨찾기 테이블 생성
create table f_charger
(
   f_idx       int,                  --즐겨찾기 일련번호
   marker_idx  int,                  --즐겨찾기 마커 일련번호
   csId        int, 	                --충전소 ID
   csNm        varchar2(100),        --충전소명
   addr        varchar2(100),        --충전소주소
   cpTp        int,                  --충전방식
   chargeTp    int,                  --충전기타입
   cpStat      int,                  --충전기상태코드
   statUpdateDatetime varchar2(100), --충전기상태갱신시각
   f_lat       NUMBER(15,8),         --즐겨찾기 충전소 위도
   f_longi     NUMBER(15,8),         --즐겨찾기 충전소 경도
   mem_idx     int                   --회원번호
);

INSERT INTO f_charger VALUES(
    seq_f_charger_f_idx.NEXTVAL,
    1,
    333,
    '석천빌딩',
    '경기도 부천시 길주로 210',
    1,
    1,
    1,
    '오늘',
    37.156156112,
    128.16874153,
    1
);

select * from member


select * from f_charger

--즐겨찾기 테이블 기본키 설정(f_idx)
alter table f_charger
   add constraint pk_f_charger_f_idx primary key(f_idx);

--즐겨찾기 테이블 외래키 설정()
alter table f_charger
  add constraint fk_f_charger_mem_idx foreign key(mem_idx) REFERENCES MEMBER(mem_idx);
  
  
  
  
  -----------------------------------------------------------------------------------------------
  


--------MEMBER TABLE--------

create sequence seq_member_mem_idx

create table member
(
    mem_idx     int,                        --회원번호
    mem_name    varchar2(100) not null,     --회원이름
    mem_id      varchar2(100) not null,     --회원아이디
    mem_email   varchar2(100) not null,     --회원이메일
    mem_pwd     varchar2(100) not null,     --회원비밀번호
    mem_addr    varchar2(500) not null,     --회원주소
    mem_type    int not null,     	      --충전타입
    mem_zipcode varchar2(100) not null,     --회원우편번호
    mem_regdate date default sysdate,       --가입일자
    mem_tel     varchar2(500) not null,     --전화번호
    mem_ip      varchar2(100) not null      --아이피
)



--기본키
alter table member
    add constraint pk_member_mem_idx primary key(mem_idx);

--유니크 제약
alter table member
    add constraint unique_member_mem_id unique(mem_id);

--sample data
insert into member values( seq_member_mem_idx.nextVal,
                            '강',
                            '1234',
                            'kang@gmail.com',
                            '1234',
                            '경기도 부천시 길주로 210',
                            1,
                            '12345',
                            sysdate,
                            '010-1234-1234',
                            '192.168.0.23'
                            );
                            
                            
 -----------------------------------------------------------------------------------------------
  


--------Comment_Board TABLE----------



create sequence seq_comment_board_c_b_idx;

--댓글테이블
create table comment_board
(
    c_b_idx     int,                      
    c_b_content varchar2(1000),           
    c_b_ip      varchar2(200),            
    c_b_regdate date,                    
    b_idx           int,                      
    mem_idx         int,                      
    mem_id          varchar2(100),            
    mem_name        varchar2(100)             
);

alter table comment_board 
add constraint pk_comment_board_c_b_idx primary key(c_b_idx);

alter table comment_board 
add constraint fk_comment_board_b_idx foreign key(b_idx) references board(b_idx) on delete cascade;

alter table comment_board 
add constraint fk_comment_board_mem_idx foreign key(mem_idx) references member(mem_idx) on delete cascade;





 -----------------------------------------------------------------------------------------------
  


--------ADMIN TABLE----------


create sequence seq_admin_admin_idx

create table admin
(
    admin_idx     int,                        --회원번호
    admin_name    varchar2(100) not null,     --회원이름
    admin_id      varchar2(100) not null,     --회원아이디
    admin_pwd     varchar2(100) not null,     --회원비밀번호
    admin_ip      varchar2(100) not null      --아이피
    
)

--기본키
alter table admin
    add constraint pk_admin_admin_idx primary key(admin_idx);

--유니크 제약
alter table admin
    add constraint unique_admin_admin_id unique(admin_id);

--sample data
insert into admin values( seq_admin_admin_idx.nextVal,
                            '김상현',
                            '2222',
                            '2222',
                            '192.168.0.23'
                            );




 -----------------------------------------------------------------------------------------------
  


--------PAY TABLE----------


create sequence seq_pay_pay_idx

create table pay
(
    pay_idx int,                    --결제일련번호 
    pay_num int,                    --결제번호    
    pay_p_num int,                  --결제상품번호
    pay_count int,                  --결제상품갯수                  
    pay_price int,                  --상품 가격
    pay_type varchar2(100),         --결제 방식
    pay_regdate varchar2(100),      --판매 일자
    p_idx int,                      --상품일련번호(FK)
    mem_idx int                     --회원번호(FK)
)

--기본키 
alter table pay
    add constraint pk_pay_pay_idx primary key(pay_idx);

--외래키
alter table pay
    add constraint fk_p_idx foreign key(p_idx) 
    references product(p_idx);

—외래키
alter table pay
    add constraint fk_mem_idx foreign key(mem_idx) 
    references member(mem_idx);
    
    alter table pay
    add item_name varchar2(100);
    
ALTER TABLE pay
DROP COLUMN pay_p_num;


select * from pay


*/


*/



  
  
