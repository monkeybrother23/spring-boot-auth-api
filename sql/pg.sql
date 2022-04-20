-- develop.sys_authority definition

-- Drop table

-- DROP TABLE develop.sys_authority;

CREATE TABLE develop.sys_authority (
	id varchar(32) NOT NULL,
	authority_name varchar(20) NOT NULL,
	version_no int2 NOT NULL,
	create_time timestamp NOT NULL,
	create_by varchar(32) NOT NULL,
	update_time timestamp NOT NULL,
	update_by varchar(32) NOT NULL,
	CONSTRAINT sys_authority_pk PRIMARY KEY (id)
);

INSERT INTO develop.sys_authority (id, authority_name, version_no, create_time, create_by, update_time, update_by) VALUES('1', 'demo:read', 1, '2022-04-20 11:58:04.869', 'SYSTEM', '2022-04-20 11:58:04.869', 'SYSTEM');


-- develop.sys_menu definition

-- Drop table

-- DROP TABLE develop.sys_menu;

CREATE TABLE develop.sys_menu (
	id varchar(32) NOT NULL,
	"name" varchar(20) NOT NULL,
	order_no int2 NULL,
	pid varchar(32) NULL,
	version_no int2 NOT NULL,
	create_time timestamp NOT NULL,
	create_by varchar(32) NOT NULL,
	update_time timestamp NOT NULL,
	update_by varchar(32) NOT NULL
);

INSERT INTO develop.sys_menu (id, "name", order_no, pid, version_no, create_time, create_by, update_time, update_by) VALUES('1', '软件工程', 1, NULL, 1, '2022-04-20 11:58:14.052', 'SYSTEM', '2022-04-20 11:58:14.052', 'SYSTEM');
INSERT INTO develop.sys_menu (id, "name", order_no, pid, version_no, create_time, create_by, update_time, update_by) VALUES('2', '高中', 2, NULL, 1, '2022-04-20 11:58:14.052', 'SYSTEM', '2022-04-20 11:58:14.052', 'SYSTEM');
INSERT INTO develop.sys_menu (id, "name", order_no, pid, version_no, create_time, create_by, update_time, update_by) VALUES('3', 'java', 1, '1', 1, '2022-04-20 11:58:14.052', 'SYSTEM', '2022-04-20 11:58:14.052', 'SYSTEM');
INSERT INTO develop.sys_menu (id, "name", order_no, pid, version_no, create_time, create_by, update_time, update_by) VALUES('4', '算法', 2, '1', 1, '2022-04-20 11:58:14.052', 'SYSTEM', '2022-04-20 11:58:14.052', 'SYSTEM');
INSERT INTO develop.sys_menu (id, "name", order_no, pid, version_no, create_time, create_by, update_time, update_by) VALUES('5', '高中英语', 1, '2', 1, '2022-04-20 11:58:14.052', 'SYSTEM', '2022-04-20 11:58:14.052', 'SYSTEM');
INSERT INTO develop.sys_menu (id, "name", order_no, pid, version_no, create_time, create_by, update_time, update_by) VALUES('6', 'hah', 1, '10', 1, '2022-04-20 11:58:14.052', 'SYSTEM', '2022-04-20 11:58:14.052', 'SYSTEM');
INSERT INTO develop.sys_menu (id, "name", order_no, pid, version_no, create_time, create_by, update_time, update_by) VALUES('7', '排序算法', 1, '4', 1, '2022-04-20 11:58:14.052', 'SYSTEM', '2022-04-20 11:58:14.052', 'SYSTEM');


-- develop.sys_role definition

-- Drop table

-- DROP TABLE develop.sys_role;

CREATE TABLE develop.sys_role (
	id varchar(32) NOT NULL,
	role_name varchar(20) NOT NULL,
	version_no int2 NOT NULL,
	create_time timestamp NOT NULL,
	create_by varchar(32) NOT NULL,
	update_time timestamp NOT NULL,
	update_by varchar(32) NOT NULL
);

INSERT INTO develop.sys_role (id, role_name, version_no, create_time, create_by, update_time, update_by) VALUES('1', 'ROLE_test', 1, '2022-04-20 11:58:20.654', 'SYSTEM', '2022-04-20 11:58:20.654', 'SYSTEM');
INSERT INTO develop.sys_role (id, role_name, version_no, create_time, create_by, update_time, update_by) VALUES('2', 'ROLE_Admin', 1, '2022-04-20 11:58:20.654', 'SYSTEM', '2022-04-20 11:58:20.654', 'SYSTEM');

-- develop.sys_user definition

-- Drop table

-- DROP TABLE develop.sys_user;

CREATE TABLE develop.sys_user (
	id varchar(32) NOT NULL,
	user_name varchar(20) NOT NULL,
	user_password varchar(200) NOT NULL,
	version_no int2 NOT NULL,
	create_time timestamp NOT NULL,
	create_by varchar(32) NOT NULL,
	update_time timestamp NOT NULL,
	update_by varchar(32) NOT NULL
);

INSERT INTO develop.sys_user (id, user_name, user_password, version_no, create_time, create_by, update_time, update_by) VALUES('1', 'albert', '$2a$10$v1R4ufaet6nJwUBaFM0I4OTCXUXCtvPrdpSfyMn5dOJ8LPWgKWPqK', 1, '2022-04-20 11:58:27.528', 'SYSTEM', '2022-04-20 11:58:27.528', 'SYSTEM');

-- develop.sys_user_authority_link definition

-- Drop table

-- DROP TABLE develop.sys_user_authority_link;

CREATE TABLE develop.sys_user_authority_link (
	id varchar(32) NOT NULL,
	user_id varchar(32) NOT NULL,
	authority_id varchar(32) NOT NULL,
	version_no int2 NOT NULL,
	create_time timestamp NOT NULL,
	create_by varchar(32) NOT NULL,
	update_time timestamp NOT NULL,
	update_by varchar(32) NOT NULL
);

INSERT INTO develop.sys_user_authority_link (id, user_id, authority_id, version_no, create_time, create_by, update_time, update_by) VALUES('1', '1', '1', 1, '2022-04-20 11:58:37.486', 'SYSTEM', '2022-04-20 11:58:37.486', 'SYSTEM');


-- develop.sys_user_role_link definition

-- Drop table

-- DROP TABLE develop.sys_user_role_link;

CREATE TABLE develop.sys_user_role_link (
	id varchar(32) NOT NULL,
	user_id varchar(32) NOT NULL,
	role_id varchar(32) NOT NULL,
	version_no int2 NOT NULL,
	create_time timestamp NOT NULL,
	create_by varchar(32) NOT NULL,
	update_time timestamp NOT NULL,
	update_by varchar(32) NOT NULL
);

INSERT INTO develop.sys_user_role_link (id, user_id, role_id, version_no, create_time, create_by, update_time, update_by) VALUES('1', '1', '1', 1, '2022-04-20 11:58:45.511', 'SYSTEM', '2022-04-20 11:58:45.511', 'SYSTEM');
