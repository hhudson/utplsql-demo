
select * 
from all_users
order by created desc
/
alter user ut3 identified by Or$doc_db0310;
grant connect to ut3;
grant create procedure to ut3;
grant create table to ut3;
grant create view to ut3;
grant create synonym to ut3;
GRANT UNLIMITED TABLESPACE TO ut3;
/

grant execute on dbms_crypto to ut3;
/