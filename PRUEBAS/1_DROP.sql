use COVID_GRUPO1_DWH 
go

begin tran
drop table dimension.economy
drop table Dimension.Demographics
drop table Dimension.Geography
drop table Dimension.Health

drop table FactLog_Age
drop table FactLog_Epidemilogy
drop table FactLog_Sex

drop table staging.Age
drop table staging.Epidemilogy
drop table staging.Sex

drop table COVID_GRUPO1.dbo.age
drop table COVID_GRUPO1.dbo.sex
drop table COVID_GRUPO1.dbo.main

