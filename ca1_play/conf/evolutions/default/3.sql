# --- !Ups

delete from user;

insert into user (type,email,role,name,password) values ( 'a','admin@ofm.com','admin','Alice Admin', 'password');
insert into user (type,email,role,name,password) values ( 'a','emp@ofm.com','employee','emp employee', 'password');

