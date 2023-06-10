-- Inventory project -- 

-- Description:-
-- Part 1
-- Create Tables:-
-- 1. Create Inventory Database 
-- 2. Create Supplier Table
-- 3. Create Product Table
-- 4. Create Customer Table
-- 5. Create Orders Table
-- 6. Create Stock Table

-- Part 2
-- Create Functions, Stored Procedure and Views:-
-- 1. Supplier Table - Function and related procedure
-- 2. Product Table - Function and related procedure
-- 3. Customer Table - Procedure
-- 4. Orders Table - Procedure
-- 5. Create a "Bill" for Customers using "View"


create database INVENTORY;
USE  INVENTORY;
-----------------------------------------------------------------------------------------------

--- Supplier Table---

create table Supplier
(SID varchar(10) primary key, SName varchar(50) not null, SAddress varchar(100) not null,
SCity varchar(10) default 'Delhi', SPhone varchar(15) unique, EmailID varchar(50));

alter table supplier add constraint Unique_SID unique(SID);

insert into Supplier (SID, SName,SAddress,SPhone,EmailID) values
('S0001', 'Gabriela Wharf', '030 Warner Hill', '611 324 5288', 'gwharf0@samsung.com'),
('S0002', 'Sofia Kerwick', '791 Spohn Center', '640 121 4345', 'skerwick1@ed.gov'),
('S0003', 'Rhoda McQuaker', '25 Transport Circle', '982 582 6422', 'rmcquaker2@bravesites.com'),
('S0004', 'Maurene Kneesha', '85334 Almo Road', '614 774 9941', 'mkneesha3@plala.or.jp'),
('S0005', 'Gerhardt Pinchin', '08820 Claremont Plaza', '190 147 3774', 'gpinchin4@amazonaws.com'),
('S0006', 'Minna Yoell', '753 Badeau Plaza', '172 633 3721', 'myoell5@sfgate.com'),
('S0007', 'Mordecai Olijve', '777 Truax Place', '642 384 8034', 'molijve6@livejournal.com'),
('S0008', 'Christopher While', '8 Fieldstone Parkway', '389 816 4572', 'cwhile7@forbes.com'),
('S0009', 'Constantine Frosch', '76 Waubesa Way', '588 972 5897', 'cfrosch8@mashable.com'),
('S0010', 'Davis Dobsons', '5946 Fuller Circle', '240 919 3026', 'ddobsons9@netlog.com');

 select * from Supplier;
 -----------------------------------------------------------------------------------------------

 --- Product Table---

create table Product
(PID varchar(10) Primary key not null, PDescription varchar(100) not null, 
Price int check (price>0), 
Category Varchar(200) check(category in('IT', 'Home appliances', 'Health care')),
SID varchar(10) foreign key references supplier(SID));

alter table product add constraint Unique_PID unique(PID);


insert into Product(Pid, PDescription, Price, category, Sid) values 
('P0001', 'Microwave', 4415, 'Home appliances', 'S0005'),
('P0002', 'Microwave', 4610, 'Home appliances', 'S0010'),
('P0003', 'X-Ray Scanner', 1626, 'Health care', 'S0009'),
('P0004', 'Router', 4031, 'IT', 'S0003'),
('P0005', 'Air Conditioner', 3660, 'Home appliances', 'S0001'),
('P0006', 'Air Conditioner', 1973, 'Home appliances', 'S0009'),
('P0007', 'Printer', 3622, 'IT', 'S0002'),
('P0008', 'Digital Scale', 1228, 'IT', 'S0006'),
('P0009', 'Printer', 2128, 'IT', 'S0007'),
('P0010', 'Desktop', 2220, 'IT', 'S0007'),
('P0011', 'Blood Pressure Monitor', 1191, 'Health care', 'S0001'),
('P0012', 'Blood Pressure Monitor', 4178, 'Health care', 'S0008'),
('P0013', 'Nebulizer', 3247, 'Health care', 'S0005'),
('P0014', 'Laptop', 4334, 'IT', 'S0008'),
('P0015', 'Vacuum Cleaner', 3291, 'Home appliances', 'S0007'),
('P0016', 'Blood Pressure Monitor', 3019, 'Health care', 'S0003'),
('P0017', 'Vacuum Cleaner', 2746, 'Home appliances', 'S0010'),
('P0018', 'Microwave', 3393, 'Home appliances', 'S0001'),
('P0019', 'Pulse Oximeter', 2662, 'Health care', 'S0009'),
('P0020', 'Printer', 4802, 'IT', 'S0004');

select * from Product;
-----------------------------------------------------------------------------------------------

--- Customer Table ---

Create table Customer 
(CustID varchar(10), CustName varchar(50) not null, CustAddress varchar(100) not null,
CustCity varchar(100) not null, CustPhone varchar(10) not null, 
CustEmailID varchar(100) not null,
CustDOB date not null check(CustDOB<'2000-01-01'));

alter table customer add constraint Unique_CID unique(CID);
alter table customer alter column custid varchar(10) not null;
alter table customer add constraint PK_CustID primary key(CustID);

insert into Customer values 
('C0001', 'Kylynn Batey', 'PO Box 93649', 'Delhi', '5253667588', 'kbatey0@github.com', '1993/04/28'),
('C0002', 'Aurea Muncie', 'Suite 75', 'Bangalore', '4944798481', 'amuncie1@senate.gov', '1994/01/29'),
('C0003', 'Dee Cromwell', 'Suite 1', 'Bangalore', '7551448048', 'dcromwell2@dion.ne.jp', '1992/12/17'),
('C0004', 'Hagen Leap', '9th Floor', 'Chennai', '2085412418', 'hleap3@hatena.ne.jp', '1997/07/29'),
('C0005', 'Celene Rolfi', 'Apt 712', 'Noida', '4665581641', 'crolfi4@ezinearticles.com', '1990/05/07'),
('C0006', 'Maurine Prendergrass', 'PO Box 17190', 'Chennai', '4926692003', 'mprendergrass5@deliciousdays.com', '1992/10/12'),
('C0007', 'Brod Potell', 'Suite 33', 'Delhi', '8374338254', 'bpotell6@cloudflare.com', '1991/08/07'),
('C0008', 'Florrie Hellyer', 'Room 1231', 'Chennai', '8379918562', 'fhellyer7@dmoz.org', '1995/12/17'),
('C0009', 'Karita Mower', 'Suite 39', 'Delhi', '1562381819', 'kmower8@amazon.co.uk', '1998/12/12'),
('C0010', 'Kalinda Joyes', 'PO Box 69611', 'Bangalore', '6572710861', 'kjoyes9@123-reg.co.uk', '1990/04/17');

select * from Customer;
-----------------------------------------------------------------------------------------------

--- Orders Table ---

Create Table Orders
(OID varchar(10), ODate date, PID varchar(10), CID varchar(10), OQty int);

alter table orders add constraint Unique_OID unique(OID);
alter table orders alter column OID varchar(10) not null;
alter table orders add constraint PK_Orders primary key(OID);
alter table orders alter column Odate date not null;
alter table orders add constraint FK_PID foreign key(PID) references product(PID);
alter table orders alter column PID varchar(10) not null;
alter table orders add constraint FK_CID foreign key(CID) references Customer(CustID);
alter table orders alter column CID varchar(10) not null;
alter table orders add constraint Check_OQty check(OQty>=1);
alter table orders alter column OQty int not null;

insert into Orders values 
('O0001', '2022/06/27', 'P0011', 'C0003', 96),
('O0002', '2023/03/20', 'P0010', 'C0008', 91),
('O0003', '2022/05/08', 'P0006', 'C0007', 97),
('O0004', '2022/12/31', 'P0003', 'C0010', 95),
('O0005', '2022/05/26', 'P0013', 'C0002', 95);

Select * from Orders;
-----------------------------------------------------------------------------------------------

--- Stock Table ---

Create table Stock
(PID varchar(10) foreign key references product(PID) not null, SQty int Check(SQty>0) not null,
MinOrderQty int check(MinOrderQty>5) not null);

Insert into Stock values
('P0001',55,10),
('P0005',40,14),
('P0003',21,23),
('P0013',34,76),
('P0009',97,45),
('P0020',100,95),
('P0018',45,23),
('P0014',89,58),
('P0006',64,98),
('P0001',11,36);

select * from Stock;
-----------------------------------------------------------------------------------------------

/* CREATE A FUNCTION FOR AUTOGENERATION OF 5 CHARACTERS ALPHA NUMERIC ID. IT
SHOULD ACCEPT 2 PARAMETERS A CHARACTER AND THE NUMBER AND RETURN THE ID BY
CONCANATING THE CHARACTER , REQUIRED ZEROS AND THE SPECIFIED NUMBER 

RECREATE BELOW PROCEDURES IN THE INVENTORY DATABASE AS SPECIFIED (ALL THE ID s SHOULD BE
AUTOMATICALLY GENERATED USING ABOVE CREATED FUNCTION AND SEQUENCES)*/

-- For Supplier Table and Product Table only --

--- Create function for Supplier Table ---

create function A_Sup (@S char(1), @num int)
returns varchar(10)
as 
begin
declare @S_ID varchar(10)
if LEN(@num)=1
	begin
	set @S_ID=CONCAT(@S,'000',@num)
	end
else if LEN(@num)=2
	begin
	set @S_ID=CONCAT(@S,'00',@num)
	end
else if LEN(@num)=3
	begin
	set @S_ID=CONCAT(@S,'0',@num)
	end
else if LEN(@num)=4
	begin
	set @S_ID=CONCAT(@S,@num)
	end
else 
	begin
	set @S_ID=CONCAT(@S,@num)
	end
return @S_ID
end;

-- Procedure--
alter procedure autosupplier
@Sname varchar(50), @SAddress varchar(100), @Scity varchar(10), @SPhone varchar(15), @EmailID varchar(100)
as
begin
	declare @SSID varchar(10)
	declare @totalrow int
	select @totalrow=count(*)+1 from Supplier
	select @SSID=dbo.A_Sup('S',@totalrow)
	insert into Supplier values (@SSID,@Sname,@SAddress,@Scity,@SPhone,@EmailID)
	select * from Supplier where SID=@SSID
end

exec autosupplier 'Vikram Singh', 'Janak Puri','haryana', '9876543211','Vikramsingh@gmail.com'

select * from Supplier

-----------------------------------------------------------------------------------------------

--- Create function for Product table --- 

Create function A_PID (@Num varchar(100))
returns varchar(10)
as
begin
declare @P_ID varchar(10)
if LEN(@num)=1
	begin
	set @P_ID='P'+'000'+@num
	end
else if LEN(@num)=2
	begin
	set @P_ID='P'+'00'+@num
	end
else if LEN(@num)=3
	begin
	set @P_ID='P'+'0'+@num
	end
else if LEN(@num)=4
	begin
	set @P_ID='P'+@num
	end
else
	begin
	set @P_ID='P'+@num
	end
return @P_ID
end

-- Procedure --

Create procedure autoproduct
@Pdesc varchar(50), @Price int, @category varchar(20),@sid varchar(10)  
as   
begin  
declare @ppid as varchar(10) 
declare @totalrow as int
select @totalrow=COUNT(*) from Product  
select @ppid=dbo.A_PID(@totalrow+1)  
insert into Product values (@ppid, @Pdesc,@Price,@category,@sid)  
select * from Product where PID=@ppid  
end

exec autoproduct 'Laptop',4500,'IT','S0002'

select * from Product

-----------------------------------------------------------------------------------------------
/* SHOULD ADD THE CUSTOMER IN THE CUSTOMER TABLE AND DISPLAY THE
DETAILS OF THE NEW CUSTOMER ADDED */

--- Create Procedure for Customer table ---

create procedure AddCustomer 
@CID varchar(10),
@CustName varchar(50),
@CustAddress varchar(100),
@CustCity varchar(50),
@Custphone varchar(15),
@CustemailID varchar(100),
@CustDOB date
as
begin
insert into customer values (@CID,@CustName,@CustAddress,@CustCity,@Custphone,@CustemailID,@CustDOB)
select * from Customer where CustID=@CID
end

exec AddCustomer 'C0011','Ajay Singh','Janak Puri','Delhi','9999999999','Ajaysingh@gmail.com','1993-09-02'

Select * from Customer
-----------------------------------------------------------------------------------------------
/* SHOULD ADD THE ORDER IN THE ORDERS TABLE AND DISPLAY THE DETAILS
OF THE ORDER. ORDER DATE SHOULD BE CURRENT DATE AND SHOULD COME
AUTOMATICALLY */

--- Create Procedure for Orders table ---

create procedure AddOrders
@OrID varchar(10),
@PID varchar(10),
@CID varchar(10),
@OQty int
as
begin
Insert into Orders values (@OrID, GETDATE(), @PID, @CID, @OQty)
select * from Orders where OID=@OrID
end;

exec AddOrders 'O0006','P0020','C0004',80

Select * from Orders
-----------------------------------------------------------------------------------------------
/* Create a "Bill" for customers  with total amount.
use Orders, Customer & Product table */

--Create a View "Bill" --

create view Bill as
select OID,ODate,CustName,CustAddress,CustPhone,PDescription,Price,OQty,Total_Amount=Price*OQty from 
Orders as O join Customer as C on O.CID=C.CustID join Product as P on O.PID=P.PID;

Select * from Bill;
-----------------------------------------------------------------------------------------------



