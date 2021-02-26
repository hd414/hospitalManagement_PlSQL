
insert into Employee values('d1','Ashish',35,'male','Delhi','Doctor');
insert into Employee values('d2','Kavita',30,'female','Jodhpur','Doctor');
insert into Employee values('n1','Arjun',45,'male','Ajmer','Nurse');
insert into Employee values('n2','Keshav',35,'male','Surat','Nurse');

insert into Doctor values('d1','Surgeon');
insert into Doctor values('d2','Surgeon');

insert into Nurse values('n1','Medical-surgical');
insert into Nurse values('n2','Emergency room');

insert into Room values(101,'General','n1');
insert into Room values(102,'ICU','n2');


insert into Patient values('p1','Arvind',34,'male','d1','101');
insert into Patient values('p2','Arun',36,'male','d2','101');
insert into Patient values('p3','Ankita',25,'female','d2','102');


insert into MedRecord values('r1','Asthma','p1');
insert into MedRecord values('r2','Depression','p2');
insert into MedRecord values('r3','Corona','p3');


insert into Bill values(1,'p1',20000,10000,10,20000,50000);
insert into Bill values(2,'p2',20000,20000,10,20000,60000);
insert into Bill values(3,'p3',20000,15000,10,20000,55000);

