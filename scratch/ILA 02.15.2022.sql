create user ut3 identified by Oradoc_db1;
grant connect to ut3;
grant create procedure to ut3;
grant create table to ut3;
grant create view to ut3;
grant create synonym to ut3;
GRANT UNLIMITED TABLESPACE TO ut3;


Set serveroutput on
Begin
   ut.run();
end;

