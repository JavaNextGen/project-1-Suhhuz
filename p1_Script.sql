CREATE TABLE ERS_REIMBURSEMENT(
reimb_id serial PRIMARY KEY,
reimb_amount int,
--reimb_submitted  TIMESTAMP,
--reimb_resolved TIMESTAMP,
--reimb_description VARCHAR(250),
reimb_author int REFERENCES ERS_USERS(ers_users_id),
reimb_resolver int REFERENCES ERS_USERS(ers_users_id),
--reimb_receipt BYTEA,
reimb_status_id int REFERENCES ERS_REIMBURSEMENT_STATUS(reimb_status_id),
reimb_type_id int REFERENCES ERS_REIMBURSEMENT_TYPE(reimb_type_id)
   );

  
  
INSERT INTO ERS_REIMBURSEMENT(reimb_amount,reimb_status_id,reimb_type_id)
values( 500 , 1, 1),
      ( 250, 2, 2 ),
       (1000, 1, 2),
      ( 100 , 3 , 3);
     
     
--select * from ERS_REIMBURSEMENT;
--DROP TABLE IF EXISTS ERS_REIMBURSEMENT;

CREATE TABLE ERS_USERS(

  ers_users_id serial PRIMARY KEY,
  ers_username VARCHAR(50),
  ers_password VARCHAR(50),
 -- ers_author int,
 -- ers_resolver int,
  ers_first_name VARCHAR(100),
  ers_last_name VARCHAR(100),
  ers_email VARCHAR(150),
  ers_role_id int REFERENCES ERS_USER_ROLES(ers_user_role_id)

);


INSERT INTO  ERS_USERS(ers_username, ers_password, ers_first_name,  ers_last_name, ers_email, ers_role_id)
values('User1','password','Hadia','Naeem','syedanaeem948@gmail.com',1),
    ('User2','password','Deanna','olsen','deannaolsen@gmail.com',2),
	('User3','password','Ayesha','Fatima','Ayeshaf@gmail.com',2);


select * from ERS_USERS;
--DROP TABLE IF EXISTS ERS_USERS;




CREATE TABLE ERS_USER_ROLES(
ers_user_role_id int PRIMARY KEY,
user_role VARCHAR(250)
);

INSERT INTO ERS_USER_ROLES(ers_user_role_id, user_role)
VALUES(1, 'FINANCE MANAGER'),    
      (2,' EMPLOYEE');
     
 --SELECT * FROM ERS_USER_ROLES;
-- DROP TABLE IF EXISTS ERS_USER_ROLES;
 


CREATE TABLE ERS_REIMBURSEMENT_STATUS(
reimb_status_id int PRIMARY KEY,
reimb_status VARCHAR(10)
);
 INSERT INTO  ERS_REIMBURSEMENT_STATUS( reimb_status_id ,reimb_status)
VALUES(1, 'APPROVED'),    
      (2, 'DENIED'),
      (3, 'PENDING');
 --SELECT * FROM ERS_REIMBURSEMENT_STATUS;
     
--DROP TABLE IF EXISTS ERS_REIMBURSEMENT_STATUS;
 

CREATE TABLE ERS_REIMBURSEMENT_TYPE(
reimb_type_id int PRIMARY KEY,
reimb_type VARCHAR(10)
);

INSERT INTO ERS_REIMBURSEMENT_TYPE(reimb_type_id, reimb_type)
VALUES(1,'LODGING'),
	 (2,'TRAVEL'),
     (3,'FOOD'),
	 (4,'OTHER');
--SELECT * FROM ERS_REIMBURSEMENT_TYPE;
--DROP TABLE IF EXISTS ERS_REIMBURSEMENT_TYPE;
 








