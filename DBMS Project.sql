create database ManageShopOnline;
use ManageShopOnline;

create table product(
ProId varchar(10) primary key,
ProName varchar(50) not null,
ProDescription varchar(500),
ProPrice int check(ProPrice>0),
Stock int check (Stock>0 or Stock=0)
);

create table Categories(
CateID varchar(10) primary key,
CateName varchar(50) not null,
ProID varchar(10),
CateDescription varchar(500) not null,
foreign key (ProID) references Product(ProID)
);

create table Customer(
CusID varchar(10) primary key,
CusName varchar(50) not  null,
Cusphone varchar(10) not null,
CusEmail varchar(50) unique,
CusAddress varchar(100)not null
);

create table Invoice(
InvoiceID varchar(10) primary key,
CusID varchar(10),
Invoice_Date datetime,
foreign key (CusID) references Customer(CusID)
);

create table Invoice_Product(
InvoiceID varchar(10),
ProID varchar(10),
Quantity int check(Quantity>0),
foreign key (InvoiceID) references Invoice(InvoiceID),
foreign key (ProID) references Product(ProID)
);

create table Feedback(
CusID varchar(10),
ProID varchar(10),
comment varchar(300)unique,
FD_Date datetime,
foreign key (CusID) references Customer(CusID),
foreign key (ProID) references Product(ProID)
);

create table ManageAccount(
AccName varchar(30) not null,
AccPass varchar(20) not null,
AccPhone varchar(11)not null,
AccAddress varchar(50) not null,
AccEmail varchar(50) unique,
 AC_Status varchar(20) check (AC_Status ='activate' or  AC_Status = 'deactivate')
);



select * from ManageAccount;

insert into Product values ('P001','Book','New',500,100);
insert into Product values ('P111','Laptop Dell','New',1500,50);
insert into Product values ('P801','Pen','New',3,1000);
insert into Product values ('P246','SmartPhone Iphone','New',1000,25);
insert into Product values ('P456','Fan','New',35,100);
insert into Product values ('P852','Notebook','New',10,500);


insert into Categories values('Cat03','Laptop','P111','sales up30%');
insert into Categories values('Cat08','Fan','P456','sales upto 20%');
insert into Categories values('Cat13','Laptop','P111','sales up30%');
insert into Categories values('Cat30','Laptop','P111','sales up30%');
insert into Categories values('Cat32','Laptop','P111','sales up30%');


insert into Customer values('Cus111','Naman','2416546465','naman@gmail.com','Bihar');
insert into Customer values('Cus123','Nipun','2416421465','nipun@gmail.com','Uttarakhand');
insert into Customer values('Cus114','Nitin','1116546465','nitin@gmail.com','Haridwar');
insert into Customer values('Cus162','Visha','9416546465','vishal@gmail.com','Bhagalpur');
insert into Customer values('Cus154','Saran','2452546465','saran@gmail.com','Bihar');
insert into Customer values('Cus168','kishl','4826546465','kishl@gmail.com','Muzaffarpur');




insert into Invoice values('I162','Cus111','2022-04-22');
insert into Invoice values('I168','Cus168','2022-05-04');
insert into Invoice values('I154','Cus154','2022-06-05');
insert into Invoice values('I123','Cus123','2022-09-08');
insert into Invoice values('I114','Cus114','2022-10-24');


insert into Invoice_Product values ('I162','P111',2);
insert into Invoice_Product values ('I168','P246',1);
insert into Invoice_Product values ('I154','P852',5);
insert into Invoice_Product values ('I123','P001',5);
insert into Invoice_Product values ('I114','P456',15);


insert into Feedback values('Cus162','P852','it is poor','2022-01-04');
insert into Feedback values('Cus168','P111','it is good','2022-05-15');
insert into Feedback values('Cus154','P246','it is average','2022-06-15');
insert into Feedback values('Cus123','P001','it is Excellent','2022-09-10');
insert into Feedback values('Cus114','P456','it is bad','2022-11-01');



insert into ManageAccount values('naman','CH0503','0985463254','Bihar','naman@gmail.com','activate');
insert into ManageAccount values('nipun','123456','4528763254','Uttarakhand','nipun@gmail.com','deactivate');
insert into ManageAccount values('nitin','452583','3256463254','Haridwar','nitin@gmail.com','activate');
insert into ManageAccount values('Visha','chi123','9416546465','Bhagalpur','vishal@gmail.com','activate');
insert into ManageAccount values('Saran','mop321','2452546465','Bihar','saran@gmail.com','activate');
insert into ManageAccount values('kishl','bob123','4826546465','Muzaffarpur','kishl@gmail.com','activate');

select * from ManageAccount where AC_Status="activate";
select * from ManageAccount where AC_Status="deactivate";
select max(Quantity) from Invoice_product;
select count(CateID) from Categories where CateName="laptop";
select * from customer where CusAddress="Bihar";
select * from Customer, feedback, product where customer.CusID=feedback.CusID and ProName="laptop" and comment like "%poor%"; 
