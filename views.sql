 

--------------------------------------------------------------------------------------------------------------------

 create or replace view Room_status as
   select room_no,count(*) as Patients
      from Patient 
       group by room_no
       order by room_no;
       
   select * from Room_status;    


  ----------------------------------------------------------------------------------------------------

 create or replace view doctor_status as
      with ttable(ID,count) as
      (select doctor_id ,count(*)
       from Patient group by doctor_id)
     select distinct ttable.ID as ID , Ename as Name ,ttable.count as Patients,department
       from ttable inner join Patient on Patient.doctor_id = ttable.ID inner join Doctor on Patient.doctor_id = Doctor.doctor_id 
       inner join Employee on Eid = Patient.doctor_id;
          
select * from doctor_status;

      
