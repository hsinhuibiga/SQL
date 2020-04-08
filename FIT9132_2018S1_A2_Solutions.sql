/*
    FIT9132 2018 Semester 1 Assignment 2 SOLUTIONS SCRIPT
    
    Student Name:
    
    Student ID:
    
	Studio Class:
	
	Tutor:
	
	Comments for your marker:
	
	

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



    
-- Task 1.2
-- ===========
-- Add the full set of DROP TABLE statements to your solutions script.
-- In completing this section you must not use the CASCADE CONSTRAINTS clause 
-- as part of your DROP TABLE statement.






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




-- Task 2.2
-- ===========
-- An Oracle sequence is to be implemented in the database for the subsequent
-- insertion of records into the database for COMPETITOR table. Provide the CREATE
-- SEQUENCE statement for COMPETITOR table. The sequence will be used to generate
-- new primary key values when adding new tuples/rows to the database. The sequence
-- should start at 1010 and increment by 1.




-- Task 2.3 
-- ===========
-- Provide the DROP SEQUENCE statement for the sequence objects you have created in
-- question 2.2 above.  






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




-- Task 3.2
-- ===========
-- Sometime after the registration, Wendy has decided to form a team for 42.2 Km marathon
-- event and call the team Gentle Earth. She will be the leader of this newly created team.
-- Wendy would also like her team to support Cancer Council Of Victoria charity. Add this
-- information into the database.




-- Task 3.3
-- ===========
-- Sometime after Wendy setup the Gentle Earth team and the team is registered with Run
-- Monash, Sam O'Hare decides to join the Gentle Earth team for 42.2 Km marathon event. 




-- Task 3.4
-- ===========
-- Suppose today is 6th of May 2018 and Wendy and Sam have already completed their race and
-- they were the only courageous ones to run the marathon for cancer research on a wet day.
-- Update the database to record these completions. You can use your imagination for the attribute
-- values of the rows you need to update. However, you need to ensure that the data is meaningful
-- to the case study. 






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




-- Sometime after sending the request to all the existing competitors for this additional information, 
-- Wendy Wang has contacted Run Monash and indicated that she has a medical condition. Update the database
-- to reflect this new information.




-- Task 4.2
-- ===========
-- 4.2 record the type of track (Grass or Synthetic), total number of parking spaces and the type of
-- toilets available at each location (Portable, Fixed or Mixed) since they are receiving a lot of
-- calls for this information from participants. Change the "live" database and add this information
-- into the database in a manner that changes made are most appropriate and consistent and data is
-- reasonable and correct to help Run Monash retrieve this information effectively from the database.






--========================= End of FIT9132_2018S1_A2_Solutions.sql ==================================
