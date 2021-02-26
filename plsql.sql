
declare 
-------------variables
x number:=4; 
y number:=1; 
r_no number:=101;
res varchar(20):='yo'; 
p_id varchar(20):='p1'; 
names varchar(20):='himanshu'; 
age number:=21; 
gender varchar(20):='male'; 
address varchar(50):='kr'; 
d_id varchar(10):='n2'; 
r_id varchar(10):='r4'; 
disease varchar(50):='CORONA'; 
bill_no number:=4; 
roomfee number:=10000; 
doctorfee number:=100; 
no_of_days number:=1; 
lab_charge number:=100; 
total number:=2000; 
dep varchar(20):='general';
u_age number := 23;

-------------------------------------------------------------------------------------------------------------------------------------------------- 
-------------------------------------------------------------------------------------------------------------------------------------------------- 
          -----Updates 
-------------------------------------------------------------------------------------------------------------------------------------------------- 
-------------------------------------------------------------------------------------------------------------------------------------------------- 



procedure updatePatient
is 
begin
dbms_output.put_line('Enter id of patient : '); 

 --p_id := &p_id;

declare
  any_rows_found number;
begin
  select count(*)
  into   any_rows_found
  from   Patient
  where  patient_id = p_id;

  if any_rows_found = 1 then
    dbms_output.put_line('Enter age of patient : '); 
     --u_age:=&u_age; 
   if(age>0) then
     update Patient
     set age = u_age
     where patient_id=p_id;
    end if;
   
else 
dbms_output.put_line('No such Patient Found');
end if;
end;
end;
-------------------------------------------------------------------------------------------------------------------------------------------------- 
-------------------------------------------------------------------------------------------------------------------------------------------------- 
-------------Creation
-------------------------------------------------------------------------------------------------------------------------------------------------- 
--------------------------------------------------------------------------------------------------------------------------------------------------
procedure createPatient 
is 
begin 
dbms_output.put_line('Enter id of patient : '); 

 --p_id := &p_id;
 ---p_id is a variable;

 declare
  any_rows_found number;
begin
  select count(*)
  into   any_rows_found
  from   Patient
  where  patient_id = p_id;

  if any_rows_found = 1 then
    dbms_output.put_line('Patient is already present');
 else
dbms_output.put_line('Enter name : '); 
 --name := &name; 
dbms_output.put_line('Enter age of patient : '); 
 --age:=&age; 
dbms_output.put_line('Enter gender of patient : '); 
 --gender := &gender; 
dbms_output.put_line('Enter doctor id : '); 
  --d_id := &d_id; 
dbms_output.put_line('Enter room no. : '); 
  --r_no := &r_no; 
dbms_output.put_line('Enter record id : '); 
  --r_id := &r_id; 
dbms_output.put_line('Enter desease of patient : '); 
 --disease := &disease; 
insert into Patient values(p_id,names,age,gender,d_id,r_no); 
insert into MedRecord values(r_id,disease,p_id);
 end if;
 end;
end;
-
-------------------------------------------------------------------------------------------------------------------------------------------------- 
-------------------------------------------------------------------------------------------------------------------------------------------------- 
 ----View Data
 -------------------------------------------------------------------------------------------------------------------------------------------------- 
-------------------------------------------------------------------------------------------------------------------------------------------------- 
 

procedure viewBill
is
begin
dbms_output.put_line('Enter the id of Patient');
--p_id := &p_id; ----patientid --column
declare
  any_rows_found number;
begin
  select count(*)
  into   any_rows_found
  from   Patient
  where  patient_id = p_id;

  if any_rows_found = 1 then
  declare 
  cursor data is
  select Patient.patient_id,Patient.name,doctor_fee,room_fee,lab_fee,total from Patient 
  inner join Bill on Patient.patient_id = Bill.patient_id;
  begin
  for i in data
  loop
  if(i.patient_id=p_id) then
  
   dbms_output.put_line('name         : '|| i.name);
   dbms_output.put_line('Doctor fee   : '|| i.doctor_fee);
   dbms_output.put_line('Room fee     : '|| i.room_fee);
   dbms_output.put_line('Lab fee      : '|| i.lab_fee);
   dbms_output.put_line('Total amount : '|| i.total );
   
  end if;
  end loop;
  end;

  else
  dbms_output.put_line('No Such Patient is found');
  end if;
  end;
  end;





-------------------------------------------------------------------------------------------------------------------------------------------------- 
----end of procedures---
-------------------------------------------------------------------------------------------------------------------------------------------------- 


 
begin 
 
dbms_output.put_line('Menu : '); 
dbms_output.put_line('1. Insert Data'); 
dbms_output.put_line('2. Update Data');
dbms_output.put_line('3. View Data'); 

dbms_output.put_line('Enter your choice : '); 

--x := &x; ---input value of x from user

  if(x=1) then 
    dbms_output.put_line('insert details of Patient'); 
        createPatient();  
      end if; 

  --------------------------------------------------------------
  --------------------------------------------------------------     

       
 elsif(x=2)then 
    dbms_output.put_line(' Update details of Patient'); 
     updatePatient();
     end if;

    --------------------------------------------------------------
    --------------------------------------------------------------

elsif(x=3)then 
    dbms_output.put_line(' View Bill detail of Patient');
     viewBill();
     end if;


  else 
    dbms_output.put_line('NOT A VALID INPUT INPUT AGAIN'); 
  end if; 
     
end; 
/

----------------------------------------------------------------------------------------------------------------
--------------------------------------------END-----------------------------------------------------------------
