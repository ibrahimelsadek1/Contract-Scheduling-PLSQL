--- main code as a procedure

create or replace procedure installments_of_contracts 
is 
cursor cont is  
select CLIENT_ID , nvl(CONTRACT_DEPOSIT_FEES,0) as CONTRACT_DEPOSIT , 
CONTRACT_ENDDATE,              
CONTRACT_ID   ,         
CONTRACT_PAYMENT_TYPE,            
CONTRACT_STARTDATE  ,        
CONTRACT_TOTAL_FEES ,        
NOTES  from contracts;
val number(8);
num_of_installs number(3);
date_inst date;
flag number(1);

begin
for c in cont loop
num_of_installs := num_of_inst(val,c.contract_startdate , c.contract_enddate , c.contract_total_fees , c.CONTRACT_DEPOSIT, c.contract_payment_type); 
for  i in 1..num_of_installs loop
date_inst := date_of_installment(c.contract_startdate  ,i , c.contract_payment_type);
flag := paid_flag(date_inst);
insert into installments_paid(contract_ID,installment_Date,installment_amount,paid)
values (c.contract_ID,date_inst,val, flag);
end loop;
end loop;
end;
