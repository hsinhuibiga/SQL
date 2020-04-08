/*
    FIT9132 2018 Semester 1 Assignment 2 SOLUTIONS SCRIPT
    
    Student Name:HsinHui Lin
    
    Student ID:28464176
    
	Studio Class: Mon 12pm
	
	Tutor:Mohamed Osama
	
	Comments for your marker:
  
1. the assignment granted for due date: 23 May 2018 
	
2. at task3.2, to keep the compno 1010 for Wendy, should insert
(to clear task 3.1 influence on the database)  

DROP SEQUENCE compno_seq;
CREATE SEQUENCE compno_seq
 START WITH     1010
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;
delete from competitor where COMPFNAME='Wendy';
	

*/

-- ========================
-- Task 1 [15 + 5 = 20 mks]
-- ========================

-- Task 1.1
-- ===========
-- Add to your solutions script, the CREATE TABLE and CONSTRAINT definitions 
-- which are missing from the FIT9132_2018S1_A2_Schema_Start.sql script. You 
-- MUST use the relation and attribute names shown in the data model above to
-- name tables and attributes which you add.



CREATE TABLE entry (
    entryno           NUMBER(4) NOT NULL,
    carndate          DATE NOT NULL,
    entrystarttime    DATE, 
    entryfinishtime   DATE,
    entryplace        NUMBER(4),
    charname          VARCHAR2(30),
    compno            CHAR(4) NOT NULL,
    eventypecode      CHAR(3) NOT NULL,
    teamname          VARCHAR2(30)
);


COMMENT ON COLUMN entry.entryno IS
    'EntryNo: Team leader for the team in this carnival';

COMMENT ON COLUMN entry.carndate IS
    'CarnDate: date of carnival ';

COMMENT ON COLUMN entry.entrystarttime IS
    'EntryStartTime: the entrant starting time';

COMMENT ON COLUMN entry.entryfinishtime IS
    'EntryFinishTime: the entrant finishing time';

COMMENT ON COLUMN entry.entryplace IS
    'EntryPlace:  entrant place within the event.';
    
COMMENT ON COLUMN entry.charname IS
    'CharName: Approved charity name';

COMMENT ON COLUMN entry.compno IS
    'CompNo: competitor registration number (unique identifier)';

COMMENT ON COLUMN entry.eventypecode IS
    'EventTypeCode: the code of event type(unique identifier)';
    
COMMENT ON COLUMN entry.teamname IS
    'TeamName: the name of team';

ALTER TABLE entry ADD CONSTRAINT entry_pk PRIMARY KEY ( entryno ,carndate);

ALTER TABLE entry ADD CONSTRAINT entry_un UNIQUE ( compno,eventypecode );
ALTER TABLE entry
    ADD CONSTRAINT entry_eventtype_fk FOREIGN KEY ( eventypecode )
        REFERENCES eventtype ( eventpyecode );
ALTER TABLE entry
    ADD CONSTRAINT entry_charity_fk FOREIGN KEY ( charname )
        REFERENCES charity ( charname );
ALTER TABLE entry
    ADD CONSTRAINT entry_carnival_fk FOREIGN KEY ( carndate )
        REFERENCES carnival ( carndate );
ALTER TABLE entry
    ADD CONSTRAINT entry_competitor_fk FOREIGN KEY ( compno )
        REFERENCES competitor ( compno );
ALTER TABLE entry
    ADD CONSTRAINT entry_team_fk FOREIGN KEY ( teamname )
        REFERENCES team ( teamname );
        
    
-- Task 1.2
-- ===========
-- Add the full set of DROP TABLE statements to your solutions script.
-- In completing this section you must not use the CASCADE CONSTRAINTS clause 
-- as part of your DROP TABLE statement.

drop table eventtype;
drop table charity;
drop table carnival;
drop table event;
drop table guardian;
drop table emercontact;
drop table competitor; 
drop table team;
drop table entry;



-- ============================
-- Task 2 [10 + 1 + 1 = 12 mks]
-- ============================

-- Task 2.1
-- ===========
-- Add entries for the Rose family into the races for the carnival to be
-- held at Caulfield campus in Autumn season of 2018.
-- At this stage, Rose family is not supporting any charity and also not forming
-- a team. For competitor numbers, you may wish to assign primary keys that you
-- choose, provided the numbers are between 1000 and 1009. For these entries,
-- emergency contacts and guardians should be selected from within this family.


INSERT INTO guardian VALUES ('6187654321','Adrianna','Rose');
INSERT INTO guardian VALUES ('6112345678','Fernadno','Rose');
INSERT INTO guardian VALUES ('6112345688','Lily','Huston');
INSERT INTO guardian VALUES ('6112343333','James','Porlis');
COMMIT;


INSERT INTO emercontact VALUES ('6112345999','Helen','Goods');
INSERT INTO emercontact VALUES ('6187654999','Megan','Buffett');
INSERT INTO emercontact VALUES ('6142800888','Tom','Cruise');
INSERT INTO emercontact VALUES ('6112349978','Tim','Timblake');
INSERT INTO emercontact VALUES ('6112345666','Joseph','Botton');
INSERT INTO emercontact VALUES ('6112345555','Lily','Huston');
INSERT INTO emercontact VALUES ('6199345678','Kerr','Winter');
INSERT INTO emercontact VALUES ('6112345699','Hlomus','Kidden');
INSERT INTO emercontact VALUES ('6112388888','Bellus','Dembuldor');
INSERT INTO emercontact VALUES ('6142800809','Aliaor','Fullton');
INSERT INTO emercontact VALUES ('6123456667','Steve','William');
INSERT INTO emercontact VALUES ('6112345678','Fernadno','Rose');
INSERT INTO emercontact VALUES ('6187654321','Adrianna','Rose');
COMMIT;


INSERT INTO competitor VALUES ('1000', 'Juan','Rose','M',to_date('1-Jan-2006','dd-Mon-yyyy'),'juan@gmail.com','Y','6122222222', 'G','6112345666','6187654321');
INSERT INTO competitor VALUES ('1001', 'Annamaria','Rose','F',to_date('12-Dec-2004','dd-Mon-yyyy'),'anna@gmail.com','Y','6122222333', 'G','6112345555','6112345678');
INSERT INTO competitor VALUES ('1002', 'Adrianna','Rose','F',to_date('11-Nov-1971','dd-Mon-yyyy'),'adrianna@rm.org','N','6187654321', 'T','6112345678',null);
INSERT INTO competitor VALUES ('1003', 'Fernadno','Rose','M',to_date('10-Oct-1970','dd-Mon-yyyy'),'fernadno@gmail.com','N','6112345678', 'T','6187654321',null);
INSERT INTO competitor VALUES ('1004', 'Alice','Brown','F',to_date('15-Feb-1986','dd-Mon-yyyy'),'alice@rm.org','Y','6112349877', 'F','6142800888',null);
INSERT INTO competitor VALUES ('1005', 'Richard','Puth','M',to_date('9-Aug-1988','dd-Mon-yyyy'),'richard@rm.org','Y','6198761235', 'F','6142800809',null);
INSERT INTO competitor VALUES ('1006', 'Steven','Siem','M',to_date('6-May-1990','dd-Mon-yyyy'),'steven@gmail.com','N','6122222299', 'F','6112388888',null);
INSERT INTO competitor VALUES ('1007', 'Grace','Holiday','F',to_date('6-Jun-1989','dd-Mon-yyyy'),'grace@gmail.com','N','612222999', 'F','6112345699',null);
INSERT INTO competitor VALUES ('1008', 'Michael','Mcdonald','M',to_date('6-Aug-1993','dd-Mon-yyyy'),'michael@gmail.com','Y','6122229999', 'F','6199345678',null);
INSERT INTO competitor VALUES ('1009', 'Charile','Mung','M',to_date('6-Feb-1988','dd-Mon-yyyy'),'charile@gmail.com','N','6188822222', 'F','6112349978',null);

COMMIT;




-- Task 2.2
-- ===========
-- An Oracle sequence is to be implemented in the database for the subsequent
-- insertion of records into the database for COMPETITOR table. Provide the CREATE
-- SEQUENCE statement for COMPETITOR table. The sequence will be used to generate
-- new primary key values when adding new tuples/rows to the database. The sequence
-- should start at 1010 and increment by 1.

CREATE SEQUENCE compno_seq
 START WITH     1010
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;


-- Task 2.3 
-- ===========
-- Provide the DROP SEQUENCE statement for the sequence objects you have created in
-- question 2.2 above.  

DROP SEQUENCE compno_seq; 


-- ====================================
-- Task 3 [10 + 10 + 10 + 10  = 40 mks]
-- ====================================
-- Sequence created in task 2 must be used to insert data into the database for the 
-- task 3 questions. For these questions you may only use the data supplied in this task.

-- Task 3.1
-- ===========
-- Add an entry for the following competitors, who are friends and studying at Monash
-- University, into the races to be held at Caulfield campus in Autumn season of 2018.
-- Both of them have nominated their friend Forrest Gump with the phone number 6142800800
-- to be their emergency contact person.

CREATE SEQUENCE compno_seq
 START WITH     1010
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;

INSERT INTO emercontact values ('6142800800','Forrest','Gump');
commit;

INSERT INTO competitor VALUES (compno_seq.nextval, 'Wendy','Wang','F',to_date('14-Sep-1985','dd-Mon-yyyy'),'wendy@rm.org','Y','6112349876', 'F','6142800800',null);
commit;
INSERT INTO competitor VALUES (compno_seq.nextval, 'Sam',q'[O'Hare]','M',to_date('8-Aug-1986','dd-Mon-yyyy'),'sam@rm.org','Y','6198761234', 'F','6142800800',null);

commit;



*/
-- Task 3.2
-- ===========
-- Sometime after the registration, Wendy has decided to form a team for 42.2 Km marathon
-- event and call the team Gentle Earth. She will be the leader of this newly created team.
-- Wendy would also like her team to support Cancer Council Of Victoria charity. Add this
-- information into the database.
*/

 
INSERT INTO competitor VALUES (compno_seq.nextval, 'Wendy','Wang','F',to_date('14-Sep-1985','dd-Mon-yyyy'),'wendy@rm.org','Y','6112349876', 'F','6142800800',null);
INSERT INTO entry VALUES (compno_seq.currval,to_date('6-May-2018','dd-Mon-yyyy'),to_date('6-May-2018','dd-Mon-yyyy'),to_date('20-May-2018','dd-Mon-yyyy'),'1','Cancer Council Of Victoria',compno_seq.currval,'42K','Gentle Earth');
INSERT INTO team VALUES ('Gentle Earth',to_date('6-May-2018','dd-Mon-yyyy'),'1','Cancer Council Of Victoria',compno_seq.currval);
commit;


-- Task 3.3
-- ===========
-- Sometime after Wendy setup the Gentle Earth team and the team is registered with Run
-- Monash, Sam O'Hare decides to join the Gentle Earth team for 42.2 Km marathon event. 

 
 
INSERT INTO competitor VALUES (compno_seq.nextval, 'Sam',q'[O'Hare]','M',to_date('8-Aug-1986','dd-Mon-yyyy'),'sam@rm.org','Y','6198761234', 'F','6142800800',null);
commit;

insert into entry values ( 
  (select entryno from team where teamname='Gentle Earth'),
   to_date('6-May-2018','dd-Mon-yyyy'),to_date('6-May-2018','dd-Mon-yyyy'),to_date('20-May-2018','dd-Mon-yyyy'),'1','Cancer Council Of Victoria',compno_seq.currval,'42K','Gentle Earth');
commit;
update team set teamnomembers = '2' where teamname='Gentle Earth';



-- Task 3.4
-- ===========
-- Suppose today is 6th of May 2018 and Wendy and Sam have already completed their race and
-- they were the only courageous ones to run the marathon for cancer research on a wet day.
-- Update the database to record these completions. You can use your imagination for the attribute
-- values of the rows you need to update. However, you need to ensure that the data is meaningful
-- to the case study. 

create table GentleEarth_Wetday
 as select *
 from entry
 where teamname='Gentle Earth';

update GentleEarth_Wetday set entryfinishtime=to_date('6-May-2018','dd-Mon-yyyy') where teamname='Gentle Earth'; 
alter table GentleEarth_Wetday
  add (membername varchar(30));
alter table GentleEarth_Wetday
  add (meaningful varchar(30));
update GentleEarth_Wetday set membername='Wendy and Sam' where teamname='Gentle Earth';
update GentleEarth_Wetday set meaningful='Wet Day Achievement' where teamname='Gentle Earth';

select * from GentleEarth_Wetday;




-- ============================
-- Task 4 [8 + 20  = 28 mks]
-- ============================

-- Task 4.1
-- ===========
-- record whether all competitors have any medical issues. They do not want to keep the
-- details of the medical condition. They only want to flag whether a competitor has a medical
-- issue or not (the value cannot be left empty). Change the "live" database and add this required
-- information for all competitors currently in the database. You may assume that all existing
-- competitors will be recorded as NOT having a medical condition. The information will be updated
-- later when the competitors reply to their request for this additional information. 

alter table competitor
  add (medical char(1));
update competitor
  set medical = 'n';  
alter table competitor
  modify medical not null;
  


-- Sometime after sending the request to all the existing competitors for this additional information, 
-- Wendy Wang has contacted Run Monash and indicated that she has a medical condition. Update the database
-- to reflect this new information.

update competitor set medical ='y' where compfname='Wendy';


-- Task 4.2
-- ===========
-- 4.2 record the type of track (Grass or Synthetic), total number of parking spaces and the type of
-- toilets available at each location (Portable, Fixed or Mixed) since they are receiving a lot of
-- calls for this information from participants. Change the "live" database and add this information
-- into the database in a manner that changes made are most appropriate and consistent and data is
-- reasonable and correct to help Run Monash retrieve this information effectively from the database.

alter table carnival
  add (tracktype varchar(20),
  toilets varchar(10) ,
  parkingspace number(3)
  );
update carnival
  set tracktype = 'grass',
  toilets ='mixed' ,
  parkingspace ='100'; 
    
alter table carnival
  modify tracktype not null;  
alter table carnival
  modify toilets not null;
alter table carnival
  modify parkingspace not null; 

update carnival set tracktype = 'Grass',toilets ='portable' ,parkingspace ='200'where CARNLOCATION=('900 Dandenong Rd, Caulfield, VIC, 3145');
update carnival set tracktype = 'synthetic',toilets ='mixed' ,parkingspace ='400'where CARNLOCATION=('Scenic Blvd, Clayton, VIC, 3800');




