create database if not exists raizen;
use raizen;
create table if not exists t_raizen (
yearmonth date, 
uf varchar(30),
product varchar(100),
unit varchar(10),
volume double(20,2),
created_at timestamp
);