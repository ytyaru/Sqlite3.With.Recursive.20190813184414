begin transaction;
create table nodes(
    id   int  not null primary key,
    name text not null
);
create table edges(
    id   int  not null primary key,
    name text not null
);
create table triples(
    id        int not null primary key,
    subject   int not null references nodes(id),
    predicate int not null references edges(id),
    object    int not null references nodes(id)
);
insert into nodes values(1,'I');
insert into nodes values(2,'PI3B+');
insert into nodes values(3,'PI4B');
insert into edges values(1,'love');
insert into edges values(2,'broke');
insert into edges values(3,'buy');
insert into triples values(1,1,1,2);
insert into triples values(2,1,2,2);
insert into triples values(3,1,1,3);
insert into triples values(4,1,3,3);
commit;

-- 目的語が`PI3B+`である述語をすべて取得する
select e.name 
from (
  select predicate 
  from triples t 
  where t.object=2
) as s inner join edges e 
on s.predicate=e.id;

-- 述語が`love`の目的語をすべて取得する
select n.name 
from (
  select object 
  from triples 
  where predicate=1 
) as o inner join nodes n 
on o.object=n.id;

