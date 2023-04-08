create table STUDENT (
	STUDENT_NAME varchar(255),
    ADDRESS varchar(255),
    DATE_OF_BIRTH date,
    Standard int
);

set @json_students = '[
	{"STUDENT_NAME":"Prathmesh",
    "ADDRESS":"MANINAGAR",
    "DATE_OF_BIRTH":"2002-04-25",
    "Standard":10
    },
    {"STUDENT_NAME":"Parag",
    "ADDRESS":"JAMNAGAR",
    "DATE_OF_BIRTH":"2002-10-25",
    "Standard":11
    },
    {"STUDENT_NAME":"Varun",
    "ADDRESS":"MUMBAI",
    "DATE_OF_BIRTH":"2000-06-15",
    "Standard":12
    },
    {"STUDENT_NAME":"Rahen",
    "ADDRESS":"Rajkot",
    "DATE_OF_BIRTH":"2000-10-25",
    "Standard":12
    }
]';

insert into STUDENT select * from json_table(@json_students, '$[*]' 
COLUMNS(STUDENT_NAME varchar(255) PATH '$.STUDENT_NAME', ADDRESS varchar(255) PATH '$.ADDRESS',DATE_OF_BIRTH date PATH '$.DATE_OF_BIRTH',Standard int PATH '$.Standard'))as student_table;

select json_arrayagg(json_object(
'STUDENT_NAME',STUDENT_NAME,
'ADDRESS',ADDRESS,
'DATE_OF_BIRTH',DATE_OF_BIRTH,
'Standard',Standard
)) from STUDENT;

