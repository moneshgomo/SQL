-- minimal and not minimal examples

create table Enrollment
(
    student_id INT NOT NULL ,
    course_id INT NOT NULL ,
    enrollment_date DATE ,
    course_name VARCHAR(100)
);

-- creating  constraints

PRIMARY KEY (student_id,course_id,course_name) -- not minimal ( removing of a key doest break the primary key )

-- in the above example we can able to remove any one of the key 

PRIMARY KEY (student_id,course_id) -- now this is minimal ( break the primary key )

PRIMARY KEY (student_id,course_id) 

-- creating a key more than one column it is called composite key

