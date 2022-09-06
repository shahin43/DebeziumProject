
create table public.users (
    id           int,
    name         varchar(100),
    start_date   date,
    country_code varchar(10)
);


select  *
  from  public.users;

-- enable replica identity for required CDC Tables 
alter table public.users replica identity full;

-- check replication slot created or not 
select  * 
  from  pg_catalog.pg_replication_slots;
  
-- inserts 
insert into public.users 
       values(101, 'shahin', current_date, 'UAE');
insert into public.users 
       values(101, 'simna', current_date, 'UAE');
insert into public.users 
       values(101, 'eshal', current_date, 'UAE');
insert into public.users    
       values(101, 'raziya', current_date, 'IND');

