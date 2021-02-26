 create table Employee(
  Eid varchar(10) primary key,
  Ename varchar(30) NOT NULL ,
  Eage number NOT NULL,
  Egender varchar(10) NOT NULL,
  Eaddress varchar(50) NOT NULL,
  Ejob varchar(20) NOT NULL
 );

create table Doctor(
 doctor_id varchar(10) primary key,
 department varchar(30) NOT NULL
);


create table Nurse(
 nurse_id varchar(10) primary key,
 nurse_type varchar(20) NOT NULL
);

create table room (
  Rno number primary key,
  Rtype varchar(10) NOT NULL,
  nurse_id varchar(10) ,
  FOREIGN KEY (nurse_id) REFERENCES Nurse(nurse_id)
  
);
 
create table Patient(
patient_id varchar(10) primary key,
name varchar(30) NOT NULL,
age  number NOT NULL,
gender varchar(10) NOT NULL,
doctor_id varchar(10) ,
room_no number ,
FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id),
FOREIGN KEY (room_no) REFERENCES room(Rno)

);





 create table MedRecord(
   record_id varchar(10) primary key,
   disease varchar(50) NOT NULL,
   patient_id varchar(10),
   FOREIGN KEY(patient_id) REFERENCES Patient(patient_id)
 );


create table Bill (
   bill_no number primary key,
   patient_id varchar(10), 
   doctor_fee number NOT NULL,
   room_fee number NOT NULL ,
   no_of_days number NOT NULL,
   lab_fee number NOT NULL,
   total number NOT NULL,
   FOREIGN KEY(patient_id) REFERENCES Patient(patient_id)
);


