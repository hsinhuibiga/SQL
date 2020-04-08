CREATE TABLE carnival (
    carndate       DATE NOT NULL,
    carnname       VARCHAR2(50) NOT NULL,
    carndirector   VARCHAR2(50) NOT NULL,
    carnlocation   VARCHAR2(50) NOT NULL
);

COMMENT ON COLUMN carnival.carndate IS
    'Date of carnival ';

COMMENT ON COLUMN carnival.carnname IS
    'Carnival name';

COMMENT ON COLUMN carnival.carndirector IS
    'Carnival director''s name';

COMMENT ON COLUMN carnival.carnlocation IS
    'Carnival''s location';

ALTER TABLE carnival ADD CONSTRAINT carnival_pk PRIMARY KEY ( carndate );

CREATE TABLE charity (
    charname      VARCHAR2(30) NOT NULL,
    charcontact   VARCHAR2(50) NOT NULL,
    charphone     CHAR(10) NOT NULL
);

COMMENT ON COLUMN charity.charname IS
    'Approved charity name';

COMMENT ON COLUMN charity.charcontact IS
    'Charity contact person name';

COMMENT ON COLUMN charity.charphone IS
    'Charity phone number';

ALTER TABLE charity ADD CONSTRAINT charity_pk PRIMARY KEY ( charname );

CREATE TABLE competitor (
    compno           NUMBER(4) NOT NULL,
    compfname        VARCHAR2(30) NOT NULL,
    complname        VARCHAR2(30) NOT NULL,
    compgender       CHAR(1) NOT NULL,
    compdob          DATE NOT NULL,
    compemail        VARCHAR2(50) NOT NULL,
    compuniopt       CHAR(1) NOT NULL,
    compphone        CHAR(10) NOT NULL,
    compecrelation   CHAR(1) NOT NULL,
    emerconphone     CHAR(10) NOT NULL,
    guardphone       CHAR(10)
);

ALTER TABLE competitor
    ADD CONSTRAINT check_compgender CHECK ( compgender IN (
        'M',
        'F'
    ) );

ALTER TABLE competitor
    ADD CONSTRAINT check_uniopt CHECK ( compuniopt IN (
        'Y',
        'N'
    ) );

ALTER TABLE competitor
    ADD CONSTRAINT check_ecrelation CHECK ( compecrelation IN (
        'P',
        'T',
        'G',
        'F'
    ) );

COMMENT ON COLUMN competitor.compno IS
    'Competitor registration number';

COMMENT ON COLUMN competitor.compfname IS
    'Competitor first name';

COMMENT ON COLUMN competitor.complname IS
    'Competitor last name';

COMMENT ON COLUMN competitor.compgender IS
    'Competitor gender (M or F)';

COMMENT ON COLUMN competitor.compdob IS
    'Competitpr date of birth';

COMMENT ON COLUMN competitor.compemail IS
    'Competitor email address';

COMMENT ON COLUMN competitor.compuniopt IS
    'Competitor university student status (''Y'' or ''N'')';

COMMENT ON COLUMN competitor.compphone IS
    'Competitor phone number';

COMMENT ON COLUMN competitor.compecrelation IS
    'Emergency contact relationship to competitor(P or  T or G or F)
P = Parent
T = Partner
G = Guardian
F = Friend
';

COMMENT ON COLUMN competitor.emerconphone IS
    'Emergency contact phone number';

COMMENT ON COLUMN competitor.guardphone IS
    'Guardian''s contact number';

ALTER TABLE competitor ADD CONSTRAINT competitor_pk PRIMARY KEY ( compno );

CREATE TABLE emercontact (
    emerconphone   CHAR(10) NOT NULL,
    emerconfname   VARCHAR2(30) NOT NULL,
    emerconlname   VARCHAR2(30) NOT NULL
);

COMMENT ON COLUMN emercontact.emerconphone IS
    'Emergency contact phone number';

COMMENT ON COLUMN emercontact.emerconfname IS
    'Emergency Contact First Name';

COMMENT ON COLUMN emercontact.emerconlname IS
    'Emergency Contact Last Name';

ALTER TABLE emercontact ADD CONSTRAINT emercontact_pk PRIMARY KEY ( emerconphone );


CREATE TABLE event (
    carndate       DATE NOT NULL,
    eventypecode   CHAR(3) NOT NULL
);

COMMENT ON COLUMN event.carndate IS
    'Date of carnival (unique identifier)';

COMMENT ON COLUMN event.eventypecode IS
    'Event type, reflects the distance of the event, e.g 10K is for 10 kilometer ';

ALTER TABLE event ADD CONSTRAINT event_pk PRIMARY KEY ( carndate,
                                                        eventypecode );

CREATE TABLE eventtype (
    eventypecode   CHAR(3) NOT NULL,
    eventypedesc   VARCHAR2(50) NOT NULL
);

COMMENT ON COLUMN eventtype.eventypecode IS
    'Even type, reflects the distance of the event, e.g 10K is for 10 kilometer ';

COMMENT ON COLUMN eventtype.eventypedesc IS
    'Even type description';

ALTER TABLE eventtype ADD CONSTRAINT eventtype_pk PRIMARY KEY ( eventypecode );

CREATE TABLE guardian (
    guardphone   CHAR(10) NOT NULL,
    guardfname   VARCHAR2(30) NOT NULL,
    guardlname   VARCHAR2(30) NOT NULL
);

COMMENT ON COLUMN guardian.guardphone IS
    'Guardian''s contact number';

COMMENT ON COLUMN guardian.guardfname IS
    'Guardian''s first name';

COMMENT ON COLUMN guardian.guardlname IS
    'Guardian Last Name';

ALTER TABLE guardian ADD CONSTRAINT guardian_pk PRIMARY KEY ( guardphone );

CREATE TABLE team (
    teamname        VARCHAR2(30) NOT NULL,
    carndate        DATE NOT NULL,
    teamnomembers   NUMBER(2) NOT NULL,
    charname        VARCHAR2(30),
    entryno         NUMBER(4) NOT NULL
);

COMMENT ON COLUMN team.teamname IS
    'Team name';

COMMENT ON COLUMN team.carndate IS
    'Date of carnival';

COMMENT ON COLUMN team.teamnomembers IS
    'Number of team members';

COMMENT ON COLUMN team.charname IS
    'Approved charity name';

COMMENT ON COLUMN team.entryno IS
    'Team leader for this team in this carnival';

ALTER TABLE team ADD CONSTRAINT team_pk PRIMARY KEY ( teamname,
                                                      carndate );

ALTER TABLE competitor
    ADD CONSTRAINT competitor_emercontact_fk FOREIGN KEY ( emerconphone )
        REFERENCES emercontact ( emerconphone );

ALTER TABLE competitor
    ADD CONSTRAINT competitor_guardian_fk FOREIGN KEY ( guardphone )
        REFERENCES guardian ( guardphone );

ALTER TABLE event
    ADD CONSTRAINT event_carnival_fk FOREIGN KEY ( carndate )
        REFERENCES carnival ( carndate );

ALTER TABLE event
    ADD CONSTRAINT event_eventtype_fk FOREIGN KEY ( eventypecode )
        REFERENCES eventtype ( eventypecode );

ALTER TABLE team
    ADD CONSTRAINT team_carnival_fk FOREIGN KEY ( carndate )
        REFERENCES carnival ( carndate );

ALTER TABLE team
    ADD CONSTRAINT team_charity_fk FOREIGN KEY ( charname )
        REFERENCES charity ( charname );




/*
  Students MUST NOT base their work on the assumption that they are the only user using this database 
  and that the data present is only what they added. This is a multiuser database, it must use be
  used with the expectation that other users/data may exist.				
*/

--------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------TASK 1-------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------

-- Question 1.1
-- -- -- -- -- -- -- -- -- 
-- -- -- -- -- -- -- -- -- 

/*
Add to your solutions script, the CREATE TABLE and CONSTRAINT definitions which are missing from the 
A2_Schema_Start.sql script. You MUST use the relation and attribute names shown in the 
data model above to name tables and attributes which you add.
*/

CREATE TABLE entry (
    entryno           NUMBER(4) NOT NULL,
    carndate          DATE NOT NULL,
    entrystarttime    DATE,
    entryfinishtime   DATE,
    entryplace        NUMBER(4),
    charname          VARCHAR2(30),
    compno            NUMBER(4) NOT NULL, 
    eventypecode      CHAR(3) NOT NULL,
    teamname          VARCHAR2(30)
);

COMMENT ON COLUMN entry.entryno IS
    'Unique number assigned for each entrant in a carnival';

COMMENT ON COLUMN entry.carndate IS
    'Date of carnival (unique identifier)';

COMMENT ON COLUMN entry.entrystarttime IS
    'Entrant entry start time';

COMMENT ON COLUMN entry.entryfinishtime IS
    'Entrant finishing time';

COMMENT ON COLUMN entry.entryplace IS
    'Entrant place within the event.';

COMMENT ON COLUMN entry.charname IS
    'Approved charity name';

COMMENT ON COLUMN entry.compno IS
    'Competitor registration number';

COMMENT ON COLUMN entry.eventypecode IS
    'Event type, reflects the distance of the event, e.g 10K is for 10 kilometer';

COMMENT ON COLUMN entry.teamname IS
    'Team Name';


ALTER TABLE entry ADD CONSTRAINT entry_pk PRIMARY KEY ( entryno,
                                                        carndate );

ALTER TABLE entry
    ADD CONSTRAINT entry_carnival_un UNIQUE ( carndate,
                                              compno,
                                              eventypecode );

ALTER TABLE entry
    ADD CONSTRAINT entry_carnival_fk FOREIGN KEY ( carndate )
        REFERENCES carnival ( carndate );
 

ALTER TABLE entry
    ADD CONSTRAINT entry_charity_fk FOREIGN KEY ( charname )
        REFERENCES charity ( charname );

ALTER TABLE entry
    ADD CONSTRAINT entry_competitor_fk FOREIGN KEY ( compno )
        REFERENCES competitor ( compno );

ALTER TABLE entry
    ADD CONSTRAINT entry_event_fk FOREIGN KEY ( carndate,
                                                eventypecode )
        REFERENCES event ( carndate,
                           eventypecode );
                           
ALTER TABLE entry
    ADD CONSTRAINT entry_team_fk FOREIGN KEY ( teamname,
                                               carndate )
        REFERENCES team ( teamname,
                          carndate );


ALTER TABLE team ADD CONSTRAINT team_leader_un UNIQUE ( carndate,
                                                        entryno );

ALTER TABLE team
    ADD CONSTRAINT team_entry_fk FOREIGN KEY ( entryno,
                                               carndate )
        REFERENCES entry ( entryno,
                           carndate );

-- Question 1.2
-- -- -- -- -- -- -- -- --
-- -- -- -- -- -- -- -- --
/*
Add the full set of DROP TABLE statements to your solutions script. In completing this section you must not use the 
CASCADE CONSTRAINTS clause as part of your DROP TABLE statement.
*/

-- Must DROP only ONE FK constraint
ALTER TABLE team DROP CONSTRAINT team_entry_fk;

DROP TABLE entry PURGE;

DROP TABLE team PURGE;

DROP TABLE event PURGE;

DROP TABLE carnival PURGE;

DROP TABLE competitor PURGE;

DROP TABLE charity PURGE;

DROP TABLE eventtype PURGE;

DROP TABLE emercontact PURGE;

DROP TABLE guardian PURGE;

--------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------


--------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------TASK 2-------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------




-- Sample data for eventtype table.
INSERT INTO eventtype VALUES ('42K', '42.2 Km Marathon');
INSERT INTO eventtype VALUES ('21K', '21.1 Km Half Marathon');
INSERT INTO eventtype VALUES ('10K', '10 Km Run');
INSERT INTO eventtype VALUES ('5K',  '5 Km Run');
INSERT INTO eventtype VALUES ('3K',  '3 Km Community Run/Walk');


-- Sample data for charity table.
INSERT INTO charity VALUES ('Cancer Council Of Victoria',	'Ms. Susan Madden',       '6140020002');
INSERT INTO charity VALUES ('Imagine',            			'Mr. John Lennon',        '6140040004');
INSERT INTO charity VALUES ('Lay Down Your Arms', 			'Ms. Bertha von Suttner', '6140060006');
INSERT INTO charity VALUES ('Heal the World',     			'Mr. Michael Jackson',    '6140080008');


-- Sample data for carnival table.
INSERT INTO carnival VALUES (to_date('6-May-2018','dd-Mon-yyyy'),  'RM Autumn Series Caulfield 2018', 'Mary Imparo', '900 Dandenong Rd, Caulfield, VIC, 3145');
INSERT INTO carnival VALUES (to_date('20-May-2018','dd-Mon-yyyy'), 'RM Autumn Series Clayton 2018',   'Mary Imparo', 'Scenic Blvd, Clayton, VIC, 3800');
INSERT INTO carnival VALUES (to_date('20-Aug-2018','dd-Mon-yyyy'), 'RM Winter Series Caulfield 2018', 'Mary Imparo', '900 Dandenong Rd, Caulfield, VIC, 3145');


-- Sample data for event table.
INSERT INTO event VALUES (to_date('6-May-2018','dd-Mon-yyyy'),  '42K');
INSERT INTO event VALUES (to_date('6-May-2018','dd-Mon-yyyy'),  '21K');
INSERT INTO event VALUES (to_date('6-May-2018','dd-Mon-yyyy'),  '10K');
INSERT INTO event VALUES (to_date('6-May-2018','dd-Mon-yyyy'),  '5K');
INSERT INTO event VALUES (to_date('6-May-2018','dd-Mon-yyyy'),  '3K');
INSERT INTO event VALUES (to_date('20-May-2018','dd-Mon-yyyy'), '42K');
INSERT INTO event VALUES (to_date('20-May-2018','dd-Mon-yyyy'), '21K');
INSERT INTO event VALUES (to_date('20-May-2018','dd-Mon-yyyy'), '10K');
INSERT INTO event VALUES (to_date('20-May-2018','dd-Mon-yyyy'), '5K');
INSERT INTO event VALUES (to_date('20-May-2018','dd-Mon-yyyy'), '3K');
INSERT INTO event VALUES (to_date('20-Aug-2018','dd-Mon-yyyy'), '5K');
INSERT INTO event VALUES (to_date('20-Aug-2018','dd-Mon-yyyy'), '3K');

COMMIT;







-- Question 2.1
-- -- -- -- -- -- -- -- -- 
-- -- -- -- -- -- -- -- -- 

/* 
Add entries for the Rose family into the races for the carnival to be held at Caulfield campus in Autumn season of 2018. 
Some of the data for the Rose family is provided to you in the table shown below.
At this stage, the Rose family is not supporting any charity and also not forming a team. For competitor numbers, you may 
wish to assign primary keys that you choose, provided the numbers are between 1000 and 1009. For entry numbers you may 
assume these are the first entries in this carnival and use the entry numbers from 1 to 4. Also, for these entries, emergency 
contacts and guardians should be selected from within this family.
*/

-- First competitor and the event they want to enter

INSERT INTO emercontact VALUES (
    6187654321,
    'Adrianna',
    'Rose'
);

INSERT INTO competitor VALUES (
    1001,
    'Fernando',
    'Rose',
    'M',
    TO_DATE('10-Oct-1970','DD-MON-YYYY'),
    'fernando@rm.org',
    'N',
    '6112345678',
    'T',
    '6187654321',
    NULL
);

INSERT INTO entry VALUES (
    1,
    (
        SELECT
            carndate
        FROM
            carnival
        WHERE
            carnname = 'RM Autumn Series Caulfield 2018'
    ),
    NULL,
    NULL,
    NULL,
    NULL,
    1001,
    (
        SELECT
            eventypecode
        FROM
            eventtype
        WHERE
            eventypedesc = '21.1 Km Half Marathon'
    ),
    NULL
);

COMMIT;

-- Second competitor and the event they want to enter

INSERT INTO emercontact VALUES (
    '6112345678',
    'Fernando',
    'Rose'
);

INSERT INTO competitor VALUES (
    1002,
    'Adrianna',
    'Rose',
    'F',
    TO_DATE('11-Nov-1971','DD-MON-YYYY'),
    'adrianna@rm.org',
    'N',
    '6187654321',
    'T',
    '6112345678',
    NULL
);

INSERT INTO entry VALUES (
    2,
    (
        SELECT
            carndate
        FROM
            carnival
        WHERE
            carnname = 'RM Autumn Series Caulfield 2018'
    ),
    NULL,
    NULL,
    NULL,
    NULL,
    1002,
    (
        SELECT
            eventypecode
        FROM
            eventtype
        WHERE
            eventypedesc = '21.1 Km Half Marathon'
    ),
    NULL
);

COMMIT;

-- Third competitor and the event they want to enter

INSERT INTO guardian VALUES (
    '6187654321',
    'Adrianna',
    'Rose'
);

INSERT INTO competitor VALUES (
    1003,
    'Annamaria',
    'Rose',
    'F',
    TO_DATE('12-Dec-2004','DD-MON-YYYY'),
    'fernando@rm.org',
    'N',
    '6112345678',
    'P',
    '6112345678',
    '6187654321'
);

INSERT INTO entry VALUES (
    3,
    (
        SELECT
            carndate
        FROM
            carnival
        WHERE
            carnname = 'RM Autumn Series Caulfield 2018'
    ),
    NULL,
    NULL,
    NULL,
    NULL,
    1003,
    (
        SELECT
            eventypecode
        FROM
            eventtype
        WHERE
            eventypedesc = '3 Km Community Run/Walk'
    ),
    NULL
);

COMMIT;

-- Fourth competitor and the event they want to enter

INSERT INTO competitor VALUES (
    1004,
    'Juan',
    'Rose',
    'M',
    TO_DATE('01-Jan-2006','DD-MON-YYYY'),
    'fernando@rm.org',
    'N',
    '6112345678',
    'P',
    '6112345678',
    '6187654321'
);

INSERT INTO entry VALUES (
    4,
    (
        SELECT
            carndate
        FROM
            carnival
        WHERE
            carnname = 'RM Autumn Series Caulfield 2018'
    ),
    NULL,
    NULL,
    NULL,
    NULL,
    1004,
    (
        SELECT
            eventypecode
        FROM
            eventtype
        WHERE
            eventypedesc = '3 Km Community Run/Walk'
    ),
    NULL
);

COMMIT;

-- Question 2.2
-- -- -- -- -- -- -- -- -- 
-- -- -- -- -- -- -- -- --
/*
An Oracle sequence is to be implemented in the database for the subsequent insertion of records into the database for 
COMPETITOR table. Provide the CREATE SEQUENCE statement for COMPETITOR table. The sequence will be used to generate new 
primary key values when adding new tuples/rows to the database. The sequence should start at 1010 and increment by 1.
*/

CREATE SEQUENCE comp_seq START WITH 1010 INCREMENT BY 1;

-- Question 2.3
-- -- -- -- -- -- -- -- -- 
-- -- -- -- -- -- -- -- --
/*
Provide the DROP SEQUENCE statement for the sequence objects you have created in question 2.2 above.
*/

DROP SEQUENCE comp_seq;

--------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------TASK 3-------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------
/*
Sequence created in task 2 must be used to insert data into the database for the task 3 questions. For these questions you may 
only use the data supplied in this task. You may assume that a phone number and name identifies a particular competitor.
For this task you are required to complete the following sub-tasks in the same order they have mentioned:
*/

-- Question 3.1
-- -- -- -- -- -- -- -- -- 
-- -- -- -- -- -- -- -- --
/*
Add an entry for the following competitors, who are friends and studying at Monash University, into the races to be held at 
Caulfield campus in Autumn season of 2018. Some of the data for these competitors is provided to you in the table shown below. 
Both of them have nominated their friend Forrest Gump with the phone number 6142800800 to be their emergency contact person.
*/

INSERT INTO emercontact VALUES (
    '6142800800',
    'Forrest',
    'Gump'
);

INSERT INTO competitor VALUES (
    comp_seq.NEXTVAL,
    'Wendy',
    'Wang',
    'F',
    TO_DATE('14-Sep-1985','DD-MON-YYYY'),
    'wendy@rm.org',
    'Y',
    '6112349876',
    'F',
    '6142800800',
    NULL
);

-- Allow use of DECODE(MAX(entryno), NULL, 1, MAX(entryno)+1) or MAX(NVL(entryno, 0))+1 for entryno
-- Allow assumption have already added at least some entries for this carnival (Q2.1) ie. straight max OK

INSERT INTO entry VALUES (
    (
        SELECT
            MAX(entryno) + 1
        FROM
            entry
        WHERE
            carndate = (
                SELECT
                    carndate
                FROM
                    carnival
                WHERE
                    carnname = 'RM Autumn Series Caulfield 2018'
            )
    ),
    (
        SELECT
            carndate
        FROM
            carnival
        WHERE
            carnname = 'RM Autumn Series Caulfield 2018'
    ),
    NULL,
    NULL,
    NULL,
    NULL,
    comp_seq.CURRVAL,
    (
        SELECT
            eventypecode
        FROM
            eventtype
        WHERE
            eventypedesc = '42.2 Km Marathon'
    ),
    NULL
);

COMMIT;

INSERT INTO competitor VALUES (
    comp_seq.NEXTVAL,
    'Sam',
    'O''Hare',
    'M',
    TO_DATE('8-Aug-1986','DD-MON-YYYY'),
    'sam@rm.org',
    'Y',
    '6198761234',
    'F',
    '6142800800',
    NULL
);

-- Allow use of DECODE(MAX(entryno), NULL, 1, MAX(entryno)+1) or MAX(NVL(entryno, 0))+1 for entryno
-- Allow assumption have already added at least some entries for this carnival (Q2.1) ie. straight max OK

INSERT INTO entry VALUES (
    (
        SELECT
            MAX(entryno) + 1
        FROM
            entry
        WHERE
            carndate = (
                SELECT
                    carndate
                FROM
                    carnival
                WHERE
                    carnname = 'RM Autumn Series Caulfield 2018'
            )
    ),
    (
        SELECT
            carndate
        FROM
            carnival
        WHERE
            carnname = 'RM Autumn Series Caulfield 2018'
    ),
    NULL,
    NULL,
    NULL,
    NULL,
    comp_seq.CURRVAL,
    (
        SELECT
            eventypecode
        FROM
            eventtype
        WHERE
            eventypedesc = '42.2 Km Marathon'
    ),
    NULL
);

COMMIT;

select * from competitor;
select * from entry;


-- Question 3.2
-- -- -- -- -- -- -- -- -- 
-- -- -- -- -- -- -- -- --
/*
Sometime after the registration, Wendy has decided to form a team for 42.2 Km marathon event and call the team Gentle Earth. 
She will be the leader of this newly created team. Wendy would also like her team to support Cancer Council Of Victoria charity. 
Add this information into the database.
*/

INSERT INTO team VALUES (
    'Gentle Earth',
    (
        SELECT
            carndate
        FROM
            carnival
        WHERE
            carnname = 'RM Autumn Series Caulfield 2018'
    ),
    1,
    'Cancer Council Of Victoria',
    (
        SELECT
            entryno
        FROM
            entry
        WHERE
            compno = (
                SELECT
                    compno
                FROM
                    competitor
                WHERE
                    compfname = 'Wendy'
                    AND complname = 'Wang'
                    AND compphone = 6112349876
            )
            AND carndate = (
                SELECT
                    carndate
                FROM
                    carnival
                WHERE
                    carnname = 'RM Autumn Series Caulfield 2018'
            )
            AND eventypecode = (
                SELECT
                    eventypecode
                FROM
                    eventtype
                WHERE
                    eventypedesc = '42.2 Km Marathon'
            )
    )
);

select * from team;
    
UPDATE entry
SET
    teamname = 'Gentle Earth'
WHERE
    compno = (
        SELECT
            compno
        FROM
            competitor
        WHERE
            compfname = 'Wendy'
            AND complname = 'Wang'
            AND compphone = '6112349876'
    )
    AND carndate = (
        SELECT
            carndate
        FROM
            carnival
        WHERE
            carnname = 'RM Autumn Series Caulfield 2018'
    )
    AND eventypecode = (
        SELECT
            eventypecode
        FROM
            eventtype
        WHERE
            eventypedesc = '42.2 Km Marathon'
    );

COMMIT;

-- Question 3.3
-- -- -- -- -- -- -- -- -- 
-- -- -- -- -- -- -- -- --
/*
Sometime after Wendy setup the Gentle Earth team and the team is registered with Run Monash, Sam O'Hare decides to join the 
Gentle Earth team for 42.2 Km marathon event.
*/

UPDATE entry
SET
    teamname = 'Gentle Earth'
WHERE
    compno = (
        SELECT
            compno
        FROM
            competitor
        WHERE
            compfname = 'Sam'
            AND complname = 'O''Hare'
            AND compphone = '6198761234'
    )
    AND carndate = (
        SELECT
            carndate
        FROM
            carnival
        WHERE
            carnname = 'RM Autumn Series Caulfield 2018'
    )
    AND eventypecode = (
        SELECT
            eventypecode
        FROM
            eventtype
        WHERE
            eventypedesc = '42.2 Km Marathon'
    );

UPDATE team
SET
    teamnomembers = teamnomembers + 1
WHERE
    teamname = 'Gentle Earth'
    AND carndate = (
        SELECT
            carndate
        FROM
            carnival
        WHERE
            carnname = 'RM Autumn Series Caulfield 2018'
    );

COMMIT;

-- Question 3.4
-- -- -- -- -- -- -- -- -- 
-- -- -- -- -- -- -- -- --
/*
Suppose today is 6th of May 2018 and Wendy and Sam have already completed their race and they were the only courageous ones to 
run the marathon for cancer research on a wet day. Update the database to record these completions. You can use your 
imagination for the attribute values of the rows you need to update. However, you need to ensure that the data is meaningful 
to the case study.
*/

--For Wendy
-- Allow use of carndate = '06-May-2018' question provided this
UPDATE entry
SET
    entrystarttime = TO_DATE('08:00:00 AM','HH:MI:SS AM'),
    entryfinishtime = TO_DATE('12:45:05 PM','HH:MI:SS AM'),
    entryplace = 1
WHERE
    carndate = (
        SELECT
            carndate
        FROM
            carnival
        WHERE
            carnname = 'RM Autumn Series Caulfield 2018'
    )
    AND eventypecode = (
        SELECT
            eventypecode
        FROM
            eventtype
        WHERE
            eventypedesc = '42.2 Km Marathon'
    )
    AND compno = (
        SELECT
            compno
        FROM
            competitor
        WHERE
            compfname = 'Wendy'
            AND complname = 'Wang'
            AND compphone = '6112349876'
    );

COMMIT;

-- For Sam
-- Allow use of carndate = '06-May-2018' question provided this
UPDATE entry
SET
    entrystarttime = TO_DATE('08:00:00 AM','HH:MI:SS AM'),
    entryfinishtime = TO_DATE('12:47:10 PM','HH:MI:SS AM'),
    entryplace = 2
WHERE
    carndate = (
        SELECT
            carndate
        FROM
            carnival
        WHERE
            carnname = 'RM Autumn Series Caulfield 2018'
    )
    AND eventypecode = (
        SELECT
            eventypecode
        FROM
            eventtype
        WHERE
            eventypedesc = '42.2 Km Marathon'
    )
    AND compno = (
        SELECT
            compno
        FROM
            competitor
        WHERE
            compfname = 'Sam'
            AND complname = 'O''Hare'
            AND compphone = '6198761234'
    );

COMMIT;


select * from entry;
--------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------TASK 4-------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------

-- Question 4.1
-- -- -- -- -- -- -- -- -- 
-- -- -- -- -- -- -- -- --
/*
record whether all competitors have any medical issues. They do not want to keep the details of the medical condition. They 
only want to flag whether a competitor has a medical issue or not (the value cannot be left empty). Change the "live" database 
and add this required information for all competitors currently in the database. You may assume that all existing competitors 
will be recorded as NOT having a medical condition. The information will be updated later when the competitors reply to their 
request for this additional information.
*/

ALTER TABLE competitor ADD (
    compmedicalissue   CHAR(1)
);

UPDATE competitor
SET
    compmedicalissue = 'N';

/*
OR 
ALTER TABLE competitor ADD (compMedicalIssue CHAR(1) DEFAULT 'N' NOT NULL);
MODIFY then not required
*/

COMMENT ON COLUMN competitor.compmedicalissue IS
    'Competitor has a medical issue (Y or N)';

ALTER TABLE competitor
    ADD CONSTRAINT comp_med_iss_chk CHECK ( compmedicalissue IN (
        'Y',
        'N'
    ) );


COMMIT;

ALTER TABLE competitor MODIFY (
    compmedicalissue
        CONSTRAINT comp_compmedissue_nn NOT NULL
);

/*
Sometime after sending the request to all the existing competitors for this additional information, Wendy Wang of phone number 
6112349876 has contacted Run Monash and indicated that she has a medical condition. Update the database to reflect this new 
information. You may assume that a phone number and name identifies a particular competitor.
*/

UPDATE competitor
SET
    compmedicalissue = 'Y'
WHERE
    compfname = 'Wendy'
    AND complname = 'Wang'
    AND compphone = '6112349876';

COMMIT;

-- Question 4.2
-- -- -- -- -- -- -- -- -- 
-- -- -- -- -- -- -- -- --
/*
record the type of track (Grass or Synthetic), total number of parking spaces and the type of toilets available at each 
location (Portable, Fixed or Mixed) since they are receiving a lot of calls for this information from participants. Change the 
"live" database and add this information into the database in a manner that changes made are most appropriate and consistent 
and data is reasonable and correct to help Run Monash retrieve this information effectively from the database.
*/

-- This is one approach others are possible, eg. create M:N relationship with bridging entity
-- However a table MUST be created, if columns added to CARNIVAL this table is no longer in 3NF
-- and has introduced insert, update and delete anomalies 

-- STEP 1: Create new table for location data --------------------------------------------

DROP TABLE location PURGE;

CREATE TABLE location (
    locno              CHAR(5) NOT NULL,
    locstreet          VARCHAR2(30) NOT NULL,
    locsuburb          VARCHAR2(30) NOT NULL,
    locstate           VARCHAR2(3) NOT NULL,
    locpostcode        NUMBER(4) NOT NULL,
    loctracktype       VARCHAR2(20) NOT NULL,
    loctoilets         VARCHAR2(15) NOT NULL,
    locparkingspaces   NUMBER(4) NOT NULL
);

COMMENT ON COLUMN location.locno IS
    'Unique number assigned for each location used for a carnival';

COMMENT ON COLUMN location.locstreet IS
    'Street address of location used for a carnival';

COMMENT ON COLUMN location.locsuburb IS
    'Suburb of location used for a carnival';

COMMENT ON COLUMN location.locstate IS
    'State of location used for a carnival';

COMMENT ON COLUMN location.locpostcode IS
    'Postcode of location used for a carnival';

COMMENT ON COLUMN location.loctracktype IS
    'Track type of the location used for a carnival';

COMMENT ON COLUMN location.loctoilets IS
    'Type of toilets at the location used for a carnival';

COMMENT ON COLUMN location.locparkingspaces IS
    'Number of parking spaces at the location used for a carnival';

ALTER TABLE location ADD CONSTRAINT locations_locno_pk PRIMARY KEY ( locno );

ALTER TABLE location
    ADD CONSTRAINT loc_tracktype_chk CHECK ( loctracktype IN (
        'Synthetic',
        'Grass'
    ) );

ALTER TABLE location
    ADD CONSTRAINT loc_toiletstype_chk CHECK ( loctoilets IN (
        'Portable',
        'Mixed',
        'Fixed'
    ) );

--First insert the address into locations table before updating carnival table.

INSERT INTO location VALUES (
    'LOC01',
    '900 Dandenong Rd',
    'Caulfield',
    'VIC',
    3145,
    'Grass',
    'Portable',
    200
);

COMMIT;

INSERT INTO location VALUES (
    'LOC02',
    'Scenic Blvd',
    'Clayton',
    'VIC',
    3800,
    'Synthetic',
    'Mixed',
    400
);

COMMIT;

-- STEP 2: Set up CARNIVAL ---------------------------------------------------------------
-- Students can add an entire new column to CARNIVAL and drop carnlocation after updating as a
-- possible alternative approach.
-- Need to set new column to be not null

ALTER TABLE carnival RENAME COLUMN carnlocation TO locno;

UPDATE carnival
SET
    locno = 'LOC01'
WHERE
    locno = '900 Dandenong Rd, Caulfield, VIC, 3145';

UPDATE carnival
SET
    locno = 'LOC02'
WHERE
    locno = 'Scenic Blvd, Clayton, VIC, 3800';

COMMIT;

ALTER TABLE carnival MODIFY (
    locno CHAR(5)
);

ALTER TABLE carnival ADD CONSTRAINT carn_locno_fk FOREIGN KEY ( locno )
    REFERENCES location;
    
    
    
select * from location;