CREATE DATABASE writing_instruction; 

CREATE TABLE students (
    id INTEGER PRIMARY KEY NOT NULL,
    first_name VARCHAR(35) NOT NULL,
    last_name VARCHAR(35) NOT NULL,
    phone_number VARCHAR(11),
    email VARCHAR (50), 
    school VARCHAR (35) NOT NULL   
);

CREATE TABLE essay_results (
	id INTEGER PRIMARY KEY NOT NULL, 
	grade NUMERIC NOT NULL,
	date_of_results DATE NOT NULL, 
	student_id INTEGER NOT NULL REFERENCES students(id), 
	essay_id INTEGER NOT NULL REFERENCES essays(id)  
); 

CREATE TABLE essays ( 
	id INTEGER PRIMARY KEY NOT NULL, 
	name VARCHAR (50) NOT NULL, 
	topic VARCHAR (150) NOT NULL, 
	start_date DATE NOT NULL, 
	end_date DATE NOT NULL,
	course_id INTEGER NOT NULL REFERENCES course(id) 
);

CREATE TABLE course (
	id INTEGER PRIMARY KEY NOT NULL,
	course_name VARCHAR (50) NOT NULL, 
	details VARCHAR (150) NOT NULL
);
	
CREATE TABLE instruction (
	id INTEGER PRIMARY KEY NOT NULL, 
    	start_date DATE NOT NULL,
	end_date DATE NOT NULL,
	student_id INTEGER NOT NULL REFERENCES students(id),
	course_id INTEGER NOT NULL REFERENCES course(id)
);

CREATE TABLE sessions (
	id INTEGER PRIMARY KEY NOT NULL,
	date_of_session DATE NOT NULL,
	session_length_min NUMERIC NOT NULL, 
	essay_id INTEGER NOT NULL REFERENCES essays(id),
	student_id INTEGER NOT NULL REFERENCES students(id)
);
