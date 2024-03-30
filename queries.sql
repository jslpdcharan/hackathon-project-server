create database hackathondb
use hackathondb
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
  m_responsibility VARCHAR(3000) NOT NULL
);

INSERT INTO roles (m_role, m_responsibility) VALUES
('President', 'Serve as the official spokesperson and primary point of contact of the CS-GSA.'),
('President', 'Represent student interests in all communication with the CS department.'),
('President', 'Foster a sense of community and sociability among CS students for their well-being.'),
('President', 'Call and chair all CS-GSA meetings.'),
('President', 'Carry out any additional roles assigned by the CS-GSA.'),
('President', 'Send out meeting agendas to all members at least 48 hours prior to each meeting.'),
('President', 'Send out meeting reminders to all representatives at least 48 hours before each meeting.'),
('President', 'Arrange venues for all CS-GSA meetings.'),
('President', 'Oversee the election and appointment of representatives to committees.'),
('President', 'Attend faculty meetings to stay informed of graduate student-related concerns.'),
('President', 'Act as a liaison between CS-GSA and CS graduate committee in discussions on graduate curriculum changes, new courses, and CS graduate program development.'),
('President', 'Provide reports on the CS-GSA\'s activities when requested (e.g., CS-GSA meetings).'),
('President', 'Fostering ongoing relationships with alumni to benefit the current students and alumni.'),

('Vice President', 'Preside in the absence of the President.'),
('Vice President', 'Perform any other duties as designated by the CS-GSA.'),
('Vice President', 'In case of the permanent absence of the President before the end of the term, the Vice-President shall assume the position of President for the remainder of the former President\'s term. Appointment by the President will then fill the Vice-President\'s position.'),
('Vice President', 'Assist the President with constructing the agenda for all CS-GSA meetings.'),
('Vice President', 'Record and maintain the minutes and attendance records from all CS-GSA meetings.'),

('Treasurer', 'Be responsible for the maintenance of all financial records.'),
('Treasurer', 'Present the proposed budget for the next year to the CS-GSA.'),
('Treasurer', 'Prior to each meeting, obtain the account balance and present it to CS-GSA.'),
('Treasurer', 'Collect and process all receipts and invoices that need processing.'),
('Treasurer', 'Fill out one disbursement voucher for each invoice and submit as described above. Retain yellow copy for Treasurer\'s records.'),
('Treasurer', 'Categorize and subtract all expenses.'),
('Treasurer', 'Monitor all expenses and ensure that all are within budgeted categories and have obtained pre-approval.'),

('Secretary', 'Serve as the recording officer of the CS-GSA and the custodian of its records including placing all relevant records in the binder in the graduate student lounge.'),
('Secretary', 'Send out proper notices of all open meetings.'),
('Secretary', 'Conduct the correspondence of the CS-GSA except as otherwise provided.'),
('Secretary', 'Record representative attendance at all regularly scheduled meetings.'),
('Secretary', 'Within one week after every meeting, post the minutes via the CS-GSA group email.'),
('Secretary', 'Distribute any information to representatives via e-mail list services or in writing via campus mail.'),
('Secretary', 'Record minutes at all regularly scheduled CS-GSA meetings.');

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
