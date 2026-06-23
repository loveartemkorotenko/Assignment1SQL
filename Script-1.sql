DROP TABLE IF EXISTS Enrollments;
DROP TABLE IF EXISTS FitnessClasses;
DROP TABLE IF EXISTS Trainers;
DROP TABLE IF EXISTS Members;
DROP TABLE IF EXISTS Memberships;

CREATE DATABASE FitnessCenter;
USE FitnessCenter;

CREATE TABLE Memberships (
    MembershipID INT AUTOINCREMENT PRIMARY KEY,
    TypeName VARCHAR(50) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Members (
    MemberID INT AUTOINCREMENT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100),
    MembershipID INT,
    FOREIGN KEY (MembershipID) REFERENCES Memberships(MembershipID)
);

CREATE TABLE Trainers (
    TrainerID INT AUTOINCREMENT PRIMARY KEY,
    TrainerName VARCHAR(100) NOT NULL,
    Specialization VARCHAR(50)
);


CREATE TABLE FitnessClasses (
    ClassID INT AUTOINCREMENT PRIMARY KEY,
    ClassName VARCHAR(100) NOT NULL,
    TrainerID INT,
    ClassDate DATETIME NOT NULL,
    FOREIGN KEY (TrainerID) REFERENCES Trainers(TrainerID)
);

CREATE TABLE Enrollments (
    EnrollmentID INT AUTOINCREMENT PRIMARY KEY,
    MemberID INT,
    ClassID INT,
    Status VARCHAR(20) DEFAULT 'Confirmed',
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
    FOREIGN KEY (ClassID) REFERENCES FitnessClasses(ClassID)
);
