create database major_assignment;

use major_assignment;

create table staff_information (
	staff_id varchar(10),
    name nvarchar(100) not null,
    date_of_birth date,
    hometown nvarchar(100),
    sex__male bit,
    phone_number varchar(10),
    position_id varchar(10) not null,
    
    constraint pk_staff_id primary key (staff_id)
);

create table positions (
	position_id varchar(10) not null,
    position_name nvarchar(100) not null,
    
    constraint pk_position primary key (position_id)
);

create table project (
	project_name nvarchar(100) not null,
    created_by nvarchar(100) not null,
    created_on date not null,
    deadline date,
    observers_id varchar(10),
    is_high_priority bit default 0,
    progress varchar(10) not null,
    
    constraint pk_project primary key (project_name)
);

create table task (
	task_name nvarchar(100) not null,
    belong_to_project nvarchar(100) not null,
    created_by nvarchar(100) not null,
    created_on date not null,
    deadline date,
    responsible_person_id varchar(10) not null,
    participants_id varchar(10),
    observers_id varchar(10),
    score int check(score < 10),
    is_high_priority bit default 0,
    is_done bit not null,
    difficulty nvarchar(100) default null,
    
    constraint pk_task primary key (task_name)
);

create table bug_fixing (
	bug_name nvarchar(100) not null,
    created_by nvarchar(100) not null,
    created_on date not null,
    need_code bit default 0,
    deadline date,
    responsible_person_id varchar(10) not null,
    participants_id varchar(10),
    difficulty nvarchar(100) default null,
    
    constraint pk_bug primary key (bug_name)
);

alter table staff_information 
add constraint fk_staff_information 
foreign key (position_id) 
references positions(position_id);

alter table project
add constraint fk_project
foreign key (observers_id)
references staff_information(staff_id);

alter table task
add constraint fk_task
foreign key (belong_to_project)
references project(project_name);

alter table task
add constraint fk_task2
foreign key (responsible_person_id)
references staff_information(staff_id);

alter table task
add constraint fk_task3
foreign key (participants_id)
references staff_information(staff_id);

alter table task
add constraint fk_task4
foreign key (observers_id)
references staff_information(staff_id);

alter table bug_fixing
add constraint fk_bug
foreign key (responsible_person_id)
references staff_information(staff_id);

alter table bug_fixing
add constraint fk_bug1
foreign key (participants_id)
references staff_information(staff_id);
