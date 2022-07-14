-- create table that have strong entity (without fk)
create table parents (
    parent_id int unsigned auto_increment primary key,
    name varchar(100) not null,
    contact_no varchar(10) not null,
    occupation varchar(100) 
) engine = innodb;

-- insert multiple row
insert into parents (name, contact_no, occupation) values 
    ("Ali", "111111111", "Driver"),
    ("Bob", "222222222", "Pilot");

create table locations (
    location_id tinyint unsigned auto_increment primary key,
    name varchar(100) not null,
    address varchar(255) not null
) engine = innodb;

insert into locations (name, address) values
    ("Yishun Swimming Complex", "Yishun Ave 4");

-- create table addresses with foreign key
create table addresses (
    address_id int unsigned auto_increment primary key,
    parent_id int unsigned not null,
    block_number varchar(6) not null,
    street_name varchar(255) not null,
    unit_number varchar(100) not null,
    postal_code varchar(10) not null
) engine = innodb;

-- add in fk relationship to the parent_id column
alter table addresses add constraint fk_addresses_parents
    foreign key(parent_id) references parents(parent_id);

-- create students table with fk
create table students (
    student_id int unsigned auto_increment primary key,
    name varchar(100) not null,
    date_of_birth date not null,
    parent_id int unsigned not null,
    foreign key (parent_id) references parents(parent_id)
) engine = innodb;

insert into students (name, data_of_birth, parent_id) values
    ("Cindy", "2000-01-23", 4);

-- sql block it cause existing data to be invalid
-- update students set parent_id = 9 where student_id = 1
delete from parents where parent_id = 4;

create table sessions (
    session_id int unsigned auto_increment primary key,
    datetime datetime not null,
    location_id tinyint unsigned not null,
    foreign key (location_id) references locations (location_id) 
) engine = innodb;