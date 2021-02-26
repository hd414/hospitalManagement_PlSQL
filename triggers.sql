CREATE OR REPLACE TRIGGER display_changes_p
After insert or update ON Patient
FOR EACH ROW 
WHEN (NEW.age > 0) 
BEGIN 
   dbms_output.put_line('After Insertion Patient Data is following :'); 
   dbms_output.put_line('ID        : ' || :NEW.patient_id);
   dbms_output.put_line('Name      : ' || :NEW.name);
   dbms_output.put_line('Age       : ' || :NEW.age); 
   dbms_output.put_line('gender    : ' || :NEW.gender); 
   dbms_output.put_line('doctor_id : ' || :NEW.doctor_id);  
END; 
/

------------------------------------------------------------------------------------------------

CREATE OR REPLACE TRIGGER display_changes_e
After insert or update ON Employee
FOR EACH ROW 
WHEN (NEW.Eage > 0) 
BEGIN 
   dbms_output.put_line('After Insertion Employee Data is following :'); 
   dbms_output.put_line('ID        : ' || :NEW.Eid);
   dbms_output.put_line('Name      : ' || :NEW.Ename);
   dbms_output.put_line('Age       : ' || :NEW.Eage); 
   dbms_output.put_line('gender    : ' || :NEW.Egender); 
   dbms_output.put_line('Address   : ' || :NEW.Eaddress); 

END; 
/
CREATE OR REPLACE TRIGGER display_changes_d
After insert ON Doctor
FOR EACH ROW 
WHEN (NEW.department is not NULL) 
BEGIN 
   
   dbms_output.put_line('Department: ' || :NEW.department); 

END; 
/

---------------------------------------------------------------------------------------------------

CREATE OR REPLACE TRIGGER display_changes_m
After insert or update ON MedRecord
FOR EACH ROW 
WHEN (NEW.record_id is not NULL) 
BEGIN 
   dbms_output.put_line('ID        : ' || :NEW.record_id);
   dbms_output.put_line('Disease   : ' || :NEW.Disease);
  
END; 
/

---------------------------------------------------------------------------------------------------

CREATE OR REPLACE TRIGGER display_changes_b
After insert or update ON Bill
FOR EACH ROW 
WHEN (NEW.bill_no > 0) 
BEGIN 
   dbms_output.put_line('After Insertion Bill Data is following :'); 
   dbms_output.put_line('Patient ID     : ' || :NEW.patient_id);
   dbms_output.put_line('bill No        : ' || :NEW.bill_no);
   dbms_output.put_line('no_of_days     : ' || :NEW.no_of_days); 
   dbms_output.put_line('doctor_charge  : ' || :NEW.doctor_fee);
   dbms_output.put_line('room_charge    : ' || :NEW.room_fee); 
   dbms_output.put_line('lab_charge     : ' || :NEW.lab_fee); 
   dbms_output.put_line('total          : ' || :NEW.total); 
     
END; 
/