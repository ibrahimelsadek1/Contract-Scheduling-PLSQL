create or replace function paid_flag(install_date date)
return number
is
begin
if (install_date <= sysdate) THEN 
return 1;
else 
return 0;
end if;
end;