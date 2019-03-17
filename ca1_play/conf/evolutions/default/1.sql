# --- Created by Ebean DDL
# To stop Ebean DDL generation, remove this comment and start using Evolutions

# --- !Ups

create table basket (
  id                            bigint auto_increment not null,
  customer_email                varchar(255),
  constraint uq_basket_customer_email unique (customer_email),
  constraint pk_basket primary key (id)
);

create table order_item (
  id                            bigint auto_increment not null,
  order_id                      bigint,
  basket_id                     bigint,
  item_id                       bigint,
  quantity                      integer not null,
  price                         double not null,
  constraint pk_order_item primary key (id)
);

create table project (
  id                            bigint auto_increment not null,
  name                          varchar(255),
  constraint pk_project primary key (id)
);

create table project_project_type (
  project_id                    bigint not null,
  project_type_id               bigint not null,
  constraint pk_project_project_type primary key (project_id,project_type_id)
);

create table project_type (
  id                            bigint auto_increment not null,
  name                          varchar(255),
  description                   varchar(255),
  stock                         integer not null,
  price                         double not null,
  constraint pk_project_type primary key (id)
);

create table shop_order (
  id                            bigint auto_increment not null,
  order_date                    timestamp,
  customer_email                varchar(255),
  constraint pk_shop_order primary key (id)
);

create table user (
  type                          varchar(31) not null,
  email                         varchar(255) not null,
  date_of_birth                 date,
  name                          varchar(255),
  password                      varchar(255),
  role                          varchar(255),
  street1                       varchar(255),
  street2                       varchar(255),
  town                          varchar(255),
  post_code                     varchar(255),
  credit_card                   varchar(255),
  constraint pk_user primary key (email)
);

alter table basket add constraint fk_basket_customer_email foreign key (customer_email) references user (email) on delete restrict on update restrict;

alter table order_item add constraint fk_order_item_order_id foreign key (order_id) references shop_order (id) on delete restrict on update restrict;
create index ix_order_item_order_id on order_item (order_id);

alter table order_item add constraint fk_order_item_basket_id foreign key (basket_id) references basket (id) on delete restrict on update restrict;
create index ix_order_item_basket_id on order_item (basket_id);

alter table order_item add constraint fk_order_item_item_id foreign key (item_id) references project_type (id) on delete restrict on update restrict;
create index ix_order_item_item_id on order_item (item_id);

alter table project_project_type add constraint fk_project_project_type_project foreign key (project_id) references project (id) on delete restrict on update restrict;
create index ix_project_project_type_project on project_project_type (project_id);

alter table project_project_type add constraint fk_project_project_type_project_type foreign key (project_type_id) references project_type (id) on delete restrict on update restrict;
create index ix_project_project_type_project_type on project_project_type (project_type_id);

alter table shop_order add constraint fk_shop_order_customer_email foreign key (customer_email) references user (email) on delete restrict on update restrict;
create index ix_shop_order_customer_email on shop_order (customer_email);


# --- !Downs

alter table basket drop constraint if exists fk_basket_customer_email;

alter table order_item drop constraint if exists fk_order_item_order_id;
drop index if exists ix_order_item_order_id;

alter table order_item drop constraint if exists fk_order_item_basket_id;
drop index if exists ix_order_item_basket_id;

alter table order_item drop constraint if exists fk_order_item_item_id;
drop index if exists ix_order_item_item_id;

alter table project_project_type drop constraint if exists fk_project_project_type_project;
drop index if exists ix_project_project_type_project;

alter table project_project_type drop constraint if exists fk_project_project_type_project_type;
drop index if exists ix_project_project_type_project_type;

alter table shop_order drop constraint if exists fk_shop_order_customer_email;
drop index if exists ix_shop_order_customer_email;

drop table if exists basket;

drop table if exists order_item;

drop table if exists project;

drop table if exists project_project_type;

drop table if exists project_type;

drop table if exists shop_order;

drop table if exists user;

