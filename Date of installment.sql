
create or replace function date_of_installment(st_date date ,i number , pay_type varchar2)
return date
is
inst_date date;
begin
if (pay_type = 'ANNUAL') THEN 
inst_date:= add_months(st_date ,12*(i-1));
elsif  (pay_type = 'HALF_ANNUAL') THEN 
inst_date:= add_months(st_date ,6*(i-1));
elsif  (pay_type = 'MONTHLY') THEN 
inst_date:= add_months(st_date ,1*(i-1));
elsif  (pay_type = 'QUARTER') THEN 
inst_date:= add_months(st_date ,3*(i-1));
end if;
return inst_date;
end;
