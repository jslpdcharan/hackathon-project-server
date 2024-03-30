create database hackathondb;
use hackathondb;
# Members table DDL
CREATE TABLE members (
m_name VARCHAR(255) NOT NULL,
m_email VARCHAR(255) NOT NULL,
m_level ENUM('Graduate', 'PG') NOT NULL,
m_role ENUM('President', 'Vice President', 'Treasurer', 'Secretary') NOT NULL,
PRIMARY KEY (m_email)
);

INSERT INTO members (m_name, m_email, m_level, m_role) VALUES
('Stevens Johnson', 'johnson@okstate.edu', 'PG', 'President'),
('Kavya Rangaswamy', 'rangaswamy@okstate.edu', 'Graduate', 'Vice President'),
('Ramana Peram', 'peram@okstate.edu', 'Graduate', 'Treasurer'),
('Chrisantus Eze', 'eze@okstate.edu', 'PG', 'Secretary');

# Roles table DDL
CREATE TABLE roles (
m_role ENUM('President', 'Vice President', 'Treasurer', 'Secretary') NOT NULL,
m_responsibility VARCHAR(255) NOT NULL
);

# Events table DDL
CREATE TABLE events (
e_id INT PRIMARY key AUTO_INCREMENT,
e_name VARCHAR(255) NOT NULL,
e_time TIME NOT NULL,
e_location VARCHAR(255) NOT NULL,
e_description VARCHAR(1024),
e_date DATE NOT NULL,
e_contact_details VARCHAR(255) NOT NULL
);

INSERT INTO events (e_name, e_time, e_location, e_description, e_date, e_contact_details) VALUES
('3 Minute Teachg', '18:00:00', 'CS Department Meeting Room', '3M Teach is a competition where you can showcase your teaching skills and philosophy in the format of a 3-minute presentation. If you want to sharpen your teaching/presentation skills, this is a great opportunity to dive into. ', '2024-04-20', 'johnson@okstate.edu'),

('Stress2Success seminar by OSU Counseling', '17:30:00', 'Campus Auditorium', 'An event aimed at craeting awareness about stress and its consequences', '2024-04-10', 'johnson@okstate.edu'),

('Career Talk:', '11:00:00', 'CS 101', 'OSU alum, Nikhil Gunti will be giving a virtual talk on “Landing Entry Roles in Industry','2024-04-02', 'eze@okstate.edu'),

('State of orange', '14:00:00', 'CS 203W', 'It’s a fun outdoor volunteering opportunity for students to help non-profit organizations, elderly and those in financial stress with yard work, cleaning, painting and the like', '2024-03-31','rangaswamy@okstate.edu');

# Alumini table DDL
CREATE TABLE alumini (
a_full_name VARCHAR(255) NOT NULL,
a_year_of_enrollment YEAR NOT NULL,
PRIMARY KEY (a_full_name, a_year_of_enrollment)
);

INSERT INTO alumini (a_full_name, a_year_of_enrollment) VALUES
('John Smith', 2021),
('Alice Johnson', 2021),
('Michael Brown', 2021),
('Emily Davis', 2021),
('Sarah Wilson', 2022),
('David Lee', 2022),
('Emma Martinez', 2022),
('James Thompson', 2022),
('Olivia Garcia', 2023),
('William Rodriguez', 2023),
('Sophia Hernandez', 2023),
('Daniel Nguyen', 2023);
