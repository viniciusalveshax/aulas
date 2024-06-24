DROP TABLE teacher;

DROP TABLE student;

CREATE TABLE teacher(
	id INT,
	name VARCHAR(200),
	side VARCHAR(200)
);

CREATE TABLE student(
	id SERIAL,
	name VARCHAR(200),
	teacher_id INT
);

INSERT INTO teacher (id, name, side) VALUES (1, 'Palpatine', 'Dark');
INSERT INTO teacher (id, name, side) VALUES (2, 'Yoda', 'Light');
INSERT INTO teacher (id, name, side) VALUES (3, 'Dookan', 'Light');
INSERT INTO teacher (id, name, side) VALUES (4, 'Qui-gon Jin', 'Light');
INSERT INTO teacher (id, name, side) VALUES (5, 'Obi Wan', 'Light');
INSERT INTO teacher (id, name, side) VALUES (6, 'Anakin', 'Light');
INSERT INTO teacher (id, name, side) VALUES (7, 'Luke', 'Light');
INSERT INTO teacher (id, name, side) VALUES (8, 'Mace Windu', 'Light');

INSERT INTO student (name, teacher_id) VALUES ('Luke', 2);
INSERT INTO student (name, teacher_id) VALUES ('Anakin', 5);
INSERT INTO student (name, teacher_id) VALUES ('Anakin', 1);
INSERT INTO student (name, teacher_id) VALUES ('Obi Wan', 4);
INSERT INTO student (name, teacher_id) VALUES ('Qui-gon Jin', 3);
INSERT INTO student (name, teacher_id) VALUES ('Ahsoka', 6);
INSERT INTO student (name, teacher_id) VALUES ('Rei', 7);
INSERT INTO student (name, teacher_id) VALUES ('Kylo Ren', 7);
INSERT INTO student (name) VALUES ('Palpatine');

