begin transaction;
-- 買い物かご
create table cart(
  id  int not null primary key,
  gid int not null,
  num int not null default(1),
  foreign key(gid) references goods(id)
);
-- 商品
create table goods(
  id    int  not null primary key,
  name  text not null,
  price int  not null
);
insert into goods values(1,'おにぎり',100);
insert into goods values(2,'そば',240);
insert into goods values(3,'日替わり弁当',480);
commit;

.headers on
.mode column

with shopping_cart(gid, num) as (select 1, 7 union select 2, 5 union select 3, 2)
select 
 goods.name, 
 shopping_cart.num, 
 (goods.price*shopping_cart.num) as price 
from goods, shopping_cart
where shopping_cart.gid=goods.id;

select 
 goods.name, 
 shopping_cart.num, 
 (goods.price*shopping_cart.num) as price 
from goods, (select 1 as gid, 7 as num union select 2, 5 union select 3, 2) as shopping_cart
where shopping_cart.gid=goods.id;

