begin transaction;
create table nodes(
  id     int  not null primary key,
  name   text not null,
  parent int  not null
);
insert into nodes values(1, 'root', 0);
insert into nodes values(2, 'n1', 1);
insert into nodes values(3, 'n11', 2);
insert into nodes values(4, 'n2', 1);
commit;

.headers on

with recursive 
  paths(id, path) as (
    select id, name from nodes where parent=0
    union all
    select n.id, p.path || '/' || n.name 
      from nodes n inner join paths p on n.parent=p.id
  )
select * from paths;

with recursive 
  paths(id, path, id_path) as (
    select id, name, id from nodes where parent=0
    union all
    select n.id, p.path || '/' || n.name, p.id_path || '/' || n.id 
      from nodes n inner join paths p on n.parent=p.id
  )
select * from paths;

