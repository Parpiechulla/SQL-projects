MEDICAL CLINIC SQL DATABASE



PROJECT OVERVIEW
This project demonstrates the design and implementation of a relational database for a medical clinic using MySQL.
The database is designed to manage core clinic information, including patients, doctors, appointments, medications, and prescriptions. The project focuses on applying fundamental relational database concepts such as primary keys, foreign keys, data types, constraints, and relationships between entities.
This is a learning project developed as part of my progression in SQL and data analytics.

Objectives:
The main objectives of this project are to:

1. Design a relational database for a medical clinic.
2. Create tables representing key entities within the clinic.
3. Establish relationships between related tables.
4. Apply primary and foreign key constraints.
5. Use appropriate SQL data types and constraints.
6. Practice database normalization and data integrity.



Database Structure:
The database currently consists of the following entities:

Patients:
  Stores information about patients registered with the clinic. Column data includes. 
    1. patient_id -	Unique identifier for each patient
    2. full_name	
    3. birth_date
    4. phone_number


Doctors:
  Stores information about doctors working at the clinic. Table	data includes. 
    1. doctor_id	- 	Unique identifier for each doctor
    2. name
    3. specialization

Appointments:
  Stores appointments between patients and doctors. Table data includes.
    1. appointment_id	-	 Unique identifier for each appointment
    2. doctor_id	-	Doctor associated with the appointment
    3. patient_id	-	Patient associated with the appointment
    4. appointment_date	DATE	Date of the appointment
    5. appointment_time	TIME	Time of the appointment
    6. reason_for_visit	TEXT	Reason for the appointment
    
    The appointments table establishes relationships with both the patients and doctors tables using foreign keys.


Prescriptions:
  Stores prescription information associated with appointments. Table data includes 
    1. prescription_id	INT	Unique identifier for each prescription
    2. appointment_id	INT	Appointment associated with the prescription
    3. instruction	TEXT	Instructions for taking the medication
    4. dosage	TEXT	Dosage information

    
ENTITY RELATIONSHIPS
The database follows a relational structure in which:
    A patient can have multiple appointments.
    A doctor can have multiple appointments.
    Each appointment belongs to one patient and one doctor.
    An appointment can result in one or more prescriptions.
