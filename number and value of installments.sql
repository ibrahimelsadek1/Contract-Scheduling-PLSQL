create or replace function num_of_inst( value_of_inst  out number,  st_date date , end_date date ,total number , deposite number, pay_type varchar2)
return number
is
months_num number(3);
inst_nums number(3);
begin
months_num:=months_between(end_date,st_date);
if (pay_type = 'ANNUAL') THEN 

value_of_inst := (total-deposite)/(months_num/12);
inst_nums := months_num/12;
elsif  (pay_type = 'HALF_ANNUAL') THEN 
value_of_inst := (total-deposite)/(months_num/6);
inst_nums := months_num/6;
elsif  (pay_type = 'MONTHLY') THEN 
value_of_inst := (total-deposite)/months_num;
inst_nums := months_num;
elsif  (pay_type = 'QUARTER') THEN 
value_of_inst := (total-deposite)/(months_num/3);
inst_nums := months_num/3;
end if;
return inst_nums;
end;