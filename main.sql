---------------variables Declaration ---------------------------
-----x=1 y=1 create patient--------x=1 y=2 create bill---
---x=1 y=3 create doctor-----x=1 y=4 create nurse--
---x=2 y=1 delete patient ------ x=2 y=2 delete doctor --- x=2 y=3 delete nurse
---x=3 y=1 update patient ---- x=3 y=2 update doctor ---- x=3 y=3 update nurse
---x=4 y=1 view bill----- x=4 y=2 view patient ----- x=4 y=3 view doctor 
---x=4 y=4 view nurse ----- x=5 y=5 view room-details
declare 
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


procedure updateDoctor
is 
begin
dbms_output.put_line('Enter id of Doctor : '); 
 --d_id := &d_id; 
declare
  any_rows_found number;
begin
  select count(*)
  into   any_rows_found
  from   Doctor
  where  doctor_id = d_id;

  if any_rows_found = 1 then
    dbms_output.put_line('Enter age of Doctor : '); 
     --age:=&u_age; 
    if(age>0) then
     update Employee
      set Eage = u_age
     where Eid=d_id;
    end if;
    
else 
dbms_output.put_line('No such Doctor Found');
end if;
end;
end;
 
-------------------------------------------------------------------------------------------------------------------------------------------------- 
-------------------------------------------------------------------------------------------------------------------------------------------------- 



procedure updateNurse
is 
begin
dbms_output.put_line('Enter id of Nurse : '); 
 --d_id := &d_id; 
 declare
  any_rows_found number;
begin
  select count(*)
  into   any_rows_found
  from   Nurse
  where  nurse_id = d_id;

  if any_rows_found = 1 then
   
    dbms_output.put_line('Enter age of Nurse : '); 
     --age:=&u_age; 

    if(age>0) then
     update Employee
      set Eage = u_age
     where Eid=d_id;
    end if;
else 
dbms_output.put_line('No such Nurse Found');
end if;
end;
end;


-------------------------------------------------------------------------------------------------------------------------------------------------- 
-------------------------------------------------------------------------------------------------------------------------------------------------- 
-------------------Creation
-------------------------------------------------------------------------------------------------------------------------------------------------- 
--------------------------------------------------------------------------------------------------------------------------------------------------
procedure createPatient 
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
-------------------------------------------------------------------------------------------------------------------------------------------------- 
-------------------------------------------------------------------------------------------------------------------------------------------------- 
 
 
function createBill 
return varchar2 is 
msg varchar(20):='done'; 
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
dbms_output.put_line('Enter bill no. : '); 
 --bill_no := &bill_no; 
dbms_output.put_line('Enter doctor fee : '); 
 --doctorfee:=&doctorfee; 
dbms_output.put_line('Enter room fee  : '); 
 --roomfee := &roomfee; 
dbms_output.put_line('Enter no_of_days  : ');  
 --no_of_days  := &no_of_days ; 
dbms_output.put_line('Enter lab charge : '); 
  --lab_charge:= &lab_charge; 
total := lab_charge+roomfee+doctorfee; 
insert into Bill values(bill_no,p_id,doctorfee,roomfee,no_of_days,lab_charge,total); 
else
dbms_output.put_line('no such Patient exists');
end if;
end; 
return msg; 
 end;
-------------------------------------------------------------------------------------------------------------------------------------------------- 
-------------------------------------------------------------------------------------------------------------------------------------------------- 
 

 
 
function createDoctor 
return varchar2 is 
msg varchar(20):='done'; 
begin 
dbms_output.put_line('Enter id of doctor : '); 
 --d_id := &d_id;
declare
  any_rows_found number;
begin
  select count(*)
  into   any_rows_found
  from   Doctor
  where  doctor_id = d_id;
  if any_rows_found = 1 then
    dbms_output.put_line('Doctor is already present');
 else
dbms_output.put_line('Enter name of Doctor : '); 
 --names := &names; 
dbms_output.put_line('Enter age of  doctor: '); 
 --age:=&age; 
dbms_output.put_line('Enter Gender  : '); 
 --gender := &gender; 
dbms_output.put_line('Enter Address  : ');  
 --address  := &address ; 
dbms_output.put_line('Enter Department/speciality  : ');  
 --dep  := &dep ; 
insert into Employee values(d_id,names,age,gender,address,'Doctor'); 
insert into Doctor values(d_id,dep); 
end if;
end; 
return msg; 
end;
-------------------------------------------------------------------------------------------------------------------------------------------------- 
-------------------------------------------------------------------------------------------------------------------------------------------------- 
function createNurse
return varchar2 is 
msg varchar(20):='done'; 
begin 
dbms_output.put_line('Enter id of Nurse : '); 
 --d_id := &d_id;
declare
  any_rows_found number;
begin
  select count(*)
  into   any_rows_found
  from   Nurse
  where  nurse_id = d_id;
  if any_rows_found = 1 then
    dbms_output.put_line('Nurse is already present');
 else
dbms_output.put_line('Enter name of Nurse : '); 
 --names := &names; 
dbms_output.put_line('Enter age of  Nurse: '); 
 --age:=&age; 
dbms_output.put_line('Enter Gender  : '); 
 --gender := &gender; 
dbms_output.put_line('Enter Address  : ');  
 --address  := &address ; 
dbms_output.put_line('Enter Type  : ');  
 --dep  := &dep ; 
insert into Employee values(d_id,names,age,gender,address,'Nurse'); 
insert into Nurse values(d_id,dep); 
end if;
end; 
return msg; 
end;


 -------------------------------------------------------------------------------------------------------------------------------------------------- 
-------------------------------------------------------------------------------------------------------------------------------------------------- 
--------------------Deletion
-------------------------------------------------------------------------------------------------------------------------------------------------- 
-------------------------------------------------------------------------------------------------------------------------------------------------- 


procedure delete_doctor 
is 
begin 
dbms_output.put_line('Enter id of doctor : '); 
 --d_id := &d_id; 
declare
  any_rows_found number;
begin
  select count(*)
  into   any_rows_found
  from   Doctor
  where  doctor_id = d_id;

  if any_rows_found = 1 then

delete from Doctor
where doctor_id=d_id;
delete from Employee
where Eid=d_id;
dbms_output.put_line('Deleted');
else 
dbms_output.put_line('No such Doctor Found');
end if;
end;
end;


-------------------------------------------------------------------------------------------------------------------------------------------------- 
-------------------------------------------------------------------------------------------------------------------------------------------------- 


procedure delete_nurse 
is 
begin 
dbms_output.put_line('Enter id of nurse : '); 
 --d_id := &d_id; 
declare
  any_rows_found number;
begin
  select count(*)
  into   any_rows_found
  from   Nurse
  where  nurse_id = d_id;

  if any_rows_found = 1 then
delete from Nurse
where nurse_id=d_id;
delete from Employee
where Eid=d_id;
dbms_output.put_line('Deleted');
else 
dbms_output.put_line('No such Nurse Found');
end if;
end;
end; 
-------------------------------------------------------------------------------------------------------------------------------------------------- 
-------------------------------------------------------------------------------------------------------------------------------------------------- 


procedure delete_patient 
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

delete from MedRecord
where patient_id=p_id;
delete from Bill
where patient_id=p_id;
delete from Patient
where patient_id=p_id;
dbms_output.put_line('Deleted');
else 
dbms_output.put_line('No such Patient Found');
end if;
end;
end; 
-------------------------------------------------------------------------------------------------------------------------------------------------- 
-------------------------------------------------------------------------------------------------------------------------------------------------- 
 ----View Data
 -------------------------------------------------------------------------------------------------------------------------------------------------- 
-------------------------------------------------------------------------------------------------------------------------------------------------- 
 

procedure viewBill
is
begin
dbms_output.put_line('Enter the id of Patient');
--p_id := &p_id;
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




-- -------------------------------------------------------------------------------------------------------------------------------------------------- 

-- -------------------------------------------------------------------------------------------------------------------------------------------------- 

procedure viewPatient
is
begin
dbms_output.put_line('Enter the id of Patient');
--p_id := &p_id;
declare
  any_rows_found number;
begin
  select count(*)
  into   any_rows_found
  from   Patient
  where  patient_id = p_id;

  if any_rows_found = 1 then
  declare 
  p_name Patient.name%type;
  p_age Patient.age%type;
  p_gender Patient.gender%type;
  p_room_no Patient.room_no%type;
  p_Disease MedRecord.disease%type;
  begin
  select name,age,gender,room_no into p_name,p_age,p_gender,p_room_no from Patient where patient_id = p_id;
  select disease into p_Disease 
   from MedRecord where MedRecord.patient_id = p_id;
   dbms_output.put_line('name     : '|| p_name);
   dbms_output.put_line('age      : '|| p_age);
   dbms_output.put_line('Gender   : '|| p_gender);
   dbms_output.put_line('Room No. : '|| p_room_no);
   dbms_output.put_line('Disease  : '|| p_Disease );
   
  end;
   
  else
  dbms_output.put_line('No Such Patient is found');
  end if;
  end;
  end;


-------------------------------------------------------------------------------------------------------------------------------------------------- 
-------------------------------------------------------------------------------------------------------------------------------------------------- 

procedure viewDoctor
is
begin
dbms_output.put_line('Enter the id of Doctor');
--d_id := &d_id;
declare
  any_rows_found number;
begin
  select count(*)
  into   any_rows_found
  from   Doctor
  where  doctor_id = d_id;

  if any_rows_found = 1 then
  declare 
  d_name  Employee.Ename%type;
  d_age  Employee.Eage%type;
  d_gender  Employee.Egender%type;
  d_dep  Doctor.department%type;
  d_address Employee.Eaddress%type;
  begin
  select Ename,Eage,Egender,Eaddress into d_name,d_age,d_gender,d_address from Employee where Eid = d_id;
  select department into d_dep 
   from Doctor where doctor_id = d_id;
   dbms_output.put_line('name        : '|| d_name);
   dbms_output.put_line('age         : '|| d_age);
   dbms_output.put_line('Gender      : '|| d_gender);
   dbms_output.put_line('address.    : '|| d_address);
   dbms_output.put_line('Department  : '|| d_dep );
   
  end;
   
  else
  dbms_output.put_line('No Such Doctor is found');
  end if;
  end;
  end;


-------------------------------------------------------------------------------------------------------------------------------------------------- 
-------------------------------------------------------------------------------------------------------------------------------------------------- 

procedure viewNurse
is
begin
dbms_output.put_line('Enter the id of Nurse');
--d_id := &d_id;
declare
  any_rows_found number;
begin
  select count(*)
  into   any_rows_found
  from   Nurse
  where  nurse_id = d_id;

  if any_rows_found = 1 then
  declare 
  d_name  Employee.Ename%type;
  d_age  Employee.Eage%type;
  d_gender  Employee.Egender%type;
  d_dep  Nurse.nurse_type%type;
  d_address Employee.Eaddress%type;
  begin
  select Ename,Eage,Egender,Eaddress into d_name,d_age,d_gender,d_address from Employee where Eid = d_id;
  select nurse_type into d_dep 
   from Nurse where nurse_id = d_id;
   dbms_output.put_line('name        : '|| d_name);
   dbms_output.put_line('age         : '|| d_age);
   dbms_output.put_line('Gender      : '|| d_gender);
   dbms_output.put_line('address.    : '|| d_address);
   dbms_output.put_line('Department  : '|| d_dep );
   
  end;
   
  else
  dbms_output.put_line('No Such Nurse is found');
  end if;
  end;
  end;


-------------------------------------------------------------------------------------------------------------------------------------------------- 
----end of procedures---
-------------------------------------------------------------------------------------------------------------------------------------------------- 


 
begin 
dbms_output.put_line('--------------------------------------------------------------------------------------------------------------------------------------'); 
dbms_output.put_line('--------------------------------------------------------------------------------------------------------------------------------------'); 
dbms_output.put_line('                                                    Welcome To Hospital Management System'); 
dbms_output.put_line('--------------------------------------------------------------------------------------------------------------------------------------'); 
dbms_output.put_line('--------------------------------------------------------------------------------------------------------------------------------------'); 
 
dbms_output.put_line('Menu : '); 
dbms_output.put_line('1. Insert Data'); 
dbms_output.put_line('2. Delete Data');
dbms_output.put_line('3. Update Data');
dbms_output.put_line('4. View Data'); 

dbms_output.put_line('Enter your choice : '); 

--x := &x; ---input value of x from user

  if(x=1) then 
    dbms_output.put_line('1. insert details of Patient'); 
    dbms_output.put_line('2. insert bill details of Patient'); 
    dbms_output.put_line('3. insert details of Doctor'); 
    dbms_output.put_line('4. insert details of Nurse'); 

    dbms_output.put_line('Enter your choice : '); 

    --y := &y; ----input value of y from user

      if(y=1) then 
        createPatient(); 
      elsif(y=2) then 
        res := createBill(); 
        dbms_output.put_line(res); 
      elsif(y=3) then 
       res := createDoctor(); 
        dbms_output.put_line(res); 
       elsif(y=4) then 
       res := createNurse(); 
        dbms_output.put_line(res); 
      else 
       dbms_output.put_line('not valid input'); 
        
      end if; 

  --------------------------------------------------------------
  --------------------------------------------------------------     

  elsif(x=2) then 
    dbms_output.put_line('1. Delete details of Patient'); 
    dbms_output.put_line('2. Delete details of Doctor');
    dbms_output.put_line('3. Delete details of Nurse');

    dbms_output.put_line('Enter your choice : '); 
    
    --y := &y;----input value of y from user

     if(y=1) then
       delete_patient();
     elsif(y=2) then
      delete_doctor();
     elsif(y=3) then
      delete_nurse();
     else
       dbms_output.put_line('not valid input');
     end if;

  ----------------------------------------------------------------
  ----------------------------------------------------------------
       
 elsif(x=3)then 
    dbms_output.put_line('1. Update details of Patient'); 
    dbms_output.put_line('2. Update details of Doctor'); 
    dbms_output.put_line('2. Update details of Nurse'); 
    
    dbms_output.put_line('Enter your choice : '); 
    
    --y := &y;----input value of y from user

    if(y=1) then
     updatePatient();
    elsif(y=2) then
     updateDoctor();
    elsif(y=3) then
     updateNurse();
    else
      dbms_output.put_line('not valid input');
     end if;

    --------------------------------------------------------------
    --------------------------------------------------------------

elsif(x=4)then 
    dbms_output.put_line('1. View Bill detail of Patient');
    dbms_output.put_line('2. View personal detail of Patient');
    dbms_output.put_line('3. View details of Doctor'); 
    dbms_output.put_line('4. View details of Nurse'); 
    dbms_output.put_line('5. View Room details');
    
    dbms_output.put_line('Enter your choice : '); 
    
    --y := &y;----input value of y from user

    if(y=1) then
     viewBill();
    elsif(y=2) then
     viewPatient();
    elsif(y=3) then
     viewDoctor();
    elsif(y=4) then
     viewNurse();
    else
     dbms_output.put_line('not a valid input');
     end if;


  else 
    dbms_output.put_line('NOT A VALID INPUT INPUT AGAIN'); 
  end if; 
     
end; 
/

----------------------------------------------------------------------------------------------------------------
--------------------------------------------END-----------------------------------------------------------------
