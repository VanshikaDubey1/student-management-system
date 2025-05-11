
CREATE DATABASE StudentManagementDB;
USE StudentManagementDB;


CREATE TABLE Students (
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    FullName VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    DateOfBirth DATE
);

CREATE TABLE Teachers (
    TeacherID INT PRIMARY KEY AUTO_INCREMENT,
    FullName VARCHAR(100),
    Department VARCHAR(50)
);


CREATE TABLE Courses (
    CourseID INT PRIMARY KEY AUTO_INCREMENT,
    CourseName VARCHAR(100),
    TeacherID INT,
    FOREIGN KEY (TeacherID) REFERENCES Teachers(TeacherID)
);


CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);


INSERT INTO Teachers (FullName, Department) VALUES 
('Dr. Neha Sharma', 'Computer Science'),
('Mr. Anil Verma', 'Mathematics');

s
INSERT INTO Courses (CourseName, TeacherID) VALUES 
('Data Structures', 1),
('Calculus', 2);


INSERT INTO Students (FullName, Email, DateOfBirth) VALUES
('Anjali Mehta', 'anjali@example.com', '2006-05-21'),
('Rahul Singh', 'rahul@example.com', '2005-11-12');


INSERT INTO Enrollments (StudentID, CourseID, EnrollmentDate) VALUES
(1, 1, '2024-06-01'),
(2, 2, '2024-06-01'),
(1, 2, '2024-06-02');


SELECT s.FullName AS StudentName, c.CourseName, t.FullName AS Teacher
FROM Enrollments e
JOIN Students s ON e.StudentID = s.StudentID
JOIN Courses c ON e.CourseID = c.CourseID
JOIN Teachers t ON c.TeacherID = t.TeacherID;
