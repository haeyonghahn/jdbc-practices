show tables;

-- 1. 회원 리스트
insert into member values (null, "한해용", "010-5567-7317", "yong80211@gmail.com", "1234");
select * from member;

-- 2. 카테고리 리스트
insert into category values (null, "수필");
select * from category;

-- 3. 서적(상품) 리스트
insert into book values (null, "마시멜로 이야기", 10000, 1);
select * from book;

-- 4. 카트 리스트 : 카트의 가격은 총 갯수, 수량은 총 수량
insert into cart values (1, 1, 3);
select * from cart;

select title, count, price
from cart, book
where cart.book_no = book.no; 

-- 5. 주문 리스트 : 주문의 결제금액은 책의 결제금액
insert into orders values (null, 10000, "서울", "20200114-00001", 1);
select * from orders;

select a.book_no, a.title, a.count, b.order_no, b.info, b.price, b.location
from (select order_book.orders_no, book_no, title, count
		from book, order_book
		where book.no = order_book.book_no) a, (select orders.no, order_no, concat(name, '/', email) as info, price, location
												from member, orders
												where member.no = orders.member_no) b
where a.orders_no = b.no;


-- 주문도서 리스트
insert into order_book values (1, 1, 1);
insert into order_book values (1, 2, 2);
select * from order_book;

drop table memeber;
drop table cart;
drop table book;
drop table orders;
drop table order_book;
drop table category;