
-- Create the HR Database
CREATE DATABASE HR_Database;
USE HR_Database;

-- Create the Job Table
CREATE TABLE Job (
    job_id INT PRIMARY KEY,
    title VARCHAR(100),
    type VARCHAR(50)
);

-- Create the Store Table
CREATE TABLE Store (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(100),
    location VARCHAR(255),
    manager_id INT  -- Reference to Employee.employee_id
);

-- Create the Department Table
CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    name VARCHAR(100),
    address VARCHAR(255),
    phone VARCHAR(15),
    manager_id INT  -- Reference to Employee.employee_id
);

-- Create the Employee Table
CREATE TABLE Employee (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2),
    phone VARCHAR(15),
    dept_id INT,  -- Reference to Department.dept_id
    manager_id INT,  -- Reference to Employee.employee_id (self-reference)
    job_id INT,  -- Reference to Job.job_id
    store_id INT,  -- Reference to Store.store_id
);

-- Create the Attendance Table
CREATE TABLE Attendance (
    attendance_id INT PRIMARY KEY,
    employee_id INT,  -- Reference to Employee.employee_id
    status VARCHAR(20),
    date DATE,
    start_hour TIME,
    end_hour TIME
);

-- Create the Warning Table
CREATE TABLE Warning (
    warning_id INT PRIMARY KEY,
    employee_id INT,  -- Reference to Employee.employee_id
    warning_date DATE,
    description TEXT
);

-- Create the Work Assignment Table
CREATE TABLE Work_Assignment (
    assignment_id INT PRIMARY KEY,
    employee_id INT,  -- Reference to Employee.employee_id
    assignment_date DATE,
    duration INT,  -- Duration in hours
    finish_date DATE,
    description TEXT,
    status VARCHAR(20)
);

-- Create the Evaluation Table
CREATE TABLE Evaluation (
    evaluation_id INT PRIMARY KEY,
    employee_id INT,  -- Reference to Employee.employee_id
    evaluation_date DATE,
    duration INT,  -- Duration in hours
    rate DECIMAL(3, 2)
);

-- Create the Vacation Table
CREATE TABLE Vacation (
    vacation_id INT PRIMARY KEY,
    employee_id INT,  -- Reference to Employee.employee_id
    request_date DATE,
    status VARCHAR(20),
    type VARCHAR(20),
    start_date DATE,
    end_date DATE,
    return_date DATE
);

-- Insert records into Employee table
INSERT INTO Employee (employee_id, name, salary, phone, dept_id, manager_id, job_id, store_id)
VALUES
(1, 'Alice Johnson', 80000, '555-0101', 1, NULL, 1, 1),  -- Manager
(2, 'Bob Smith', 60000, '555-0102', 1, 1, 2, 1),
(3, 'Charlie Brown', 55000, '555-0103', 1, 1, 3, 1),
(4, 'Diana Prince', 70000, '555-0104', 2, NULL, 1, 2),  -- Manager
(5, 'Eve Adams', 50000, '555-0105', 2, 4, 2, 2),
(6, 'Frank Castle', 45000, '555-0106', 2, 4, 3, 2),
(7, 'Grace Lee', 65000, '555-0107', 3, NULL, 1, 3),  -- Manager
(8, 'Henry Wu', 60000, '555-0108', 3, 7, 2, 3),
(9, 'Ivy Carter', 62000, '555-0109', 3, 7, 3, 3);

-- Ensure department and job records exist for the department IDs and job IDs used
-- Insert records into Department table
INSERT INTO Department (dept_id, name, address, phone, manager_id)
VALUES
(1, 'Sales', '123 Market St', '555-1001', 1),
(2, 'Marketing', '456 Elm St', '555-1002', 4),
(3, 'Development', '789 Oak St', '555-1003', 7);

-- Insert records into Job table
INSERT INTO Job (job_id, title, type)
VALUES
(1, 'Manager', 'Full-time'),
(2, 'Sales Representative', 'Full-time'),
(3, 'Marketing Specialist', 'Full-time');

-- Insert records into Store table
INSERT INTO Store (store_id, store_name, location, manager_id)
VALUES
(1, 'Main Store', '123 Main St', 1),
(2, 'Second Store', '456 Second St', 4),
(3, 'Third Store', '789 Third St', 7);

-- Insert records into Attendance
INSERT INTO Attendance (attendance_id, employee_id, status, date, start_hour, end_hour) VALUES
(1, 1, 'Present', '2024-09-01', '09:00:00', '17:00:00'),
(2, 2, 'Absent', '2024-09-01', '09:00:00', '17:00:00'),
(3, 3, 'Present', '2024-09-02', '09:00:00', '17:00:00'),
(4, 4, 'Present', '2024-09-02', '09:00:00', '17:00:00'),
(5, 5, 'Absent', '2024-09-02', '09:00:00', '17:00:00');

-- Insert records into Warning
INSERT INTO Warning (warning_id, employee_id, warning_date, description) VALUES
(1, 1, '2024-09-01', 'Late to work'),
(2, 2, '2024-09-02', 'Missed deadline'),
(3, 3, '2024-09-03', 'Poor performance'),
(4, 4, '2024-09-04', 'Unapproved leave'),
(5, 5, '2024-09-05', 'Incomplete task');

-- Insert records into Work Assignment
INSERT INTO Work_Assignment (assignment_id, employee_id, assignment_date, duration, finish_date, description, status) VALUES
(1, 1, '2024-09-01', 8, '2024-09-01', 'Project A', 'Completed'),
(2, 2, '2024-09-02', 6, '2024-09-02', 'Project B', 'Under Process'),
(3, 3, '2024-09-03', 7, '2024-09-03', 'Project C', 'Completed'),
(4, 4, '2024-09-04', 8, '2024-09-04', 'Project D', 'Under Process'),
(5, 5, '2024-09-05', 5, '2024-09-05', 'Project E', 'Completed');

-- Insert records into Evaluation
INSERT INTO Evaluation (evaluation_id, employee_id, evaluation_date, duration, rate) VALUES
(1, 1, '2024-09-01', 2, 8.5),
(2, 2, '2024-09-02', 2, 7.0),
(3, 3, '2024-09-03', 1.5, 9.0),
(4, 4, '2024-09-04', 3, 8.0),
(5, 5, '2024-09-05', 2, 9.5);

-- Insert records into Vacation
INSERT INTO Vacation (vacation_id, employee_id, request_date, status, type, start_date, end_date, return_date) VALUES
(1, 1, '2024-09-01', 'Approved', 'Paid', '2024-09-10', '2024-09-15', '2024-09-16'),
(2, 2, '2024-09-02', 'Pending', 'Unpaid', '2024-09-20', '2024-09-25', '2024-09-26'),
(3, 3, '2024-09-03', 'Approved', 'Paid', '2024-09-05', '2024-09-07', '2024-09-08'),
(4, 4, '2024-09-04', 'Rejected', 'Paid', '2024-09-12', '2024-09-14', '2024-09-15'),
(5, 5, '2024-09-05', 'Approved', 'Paid', '2024-09-15', '2024-09-20', '2024-09-21');



-- Query 1: Give the full details for all employees working in a specific department name
SELECT E.*
FROM Employee E
JOIN Department D ON E.dept_id = D.dept_id
WHERE D.name = 'Sales'; -- Replace with the desired department name

-- Query 2: Give the employees' names, their manager's name, and their manager's phone
SELECT E.name AS EmployeeName, M.name AS ManagerName, M.phone
FROM Employee E
LEFT JOIN Employee M ON E.manager_id = M.employee_id
WHERE M.employee_id IS NOT NULL;

-- Query 3: For a specific employee name, show all warnings' detail history (ordered from recent to old)
SELECT E.name AS EmployeeName, W.*
FROM Warning W
JOIN Employee E ON W.employee_id = E.employee_id
WHERE E.name = 'Alice Johnson' -- Replace with the desired employee name
ORDER BY W.warning_date DESC;

-- Query 4: Give the employee name, salary, total average salary, salary – total average salary for all employees
WITH AvgSalary AS (
    SELECT AVG(salary) AS average_salary
    FROM Employee
)
SELECT E.name AS EmployeeName, E.salary, A.average_salary,
       E.salary - A.average_salary AS SalaryDifference
FROM Employee E
CROSS JOIN AvgSalary A;

-- Query 5: List the average warnings for each department if it is more than the average warnings for all employees
WITH DeptWarnings AS (
    SELECT E.dept_id, COUNT(W.warning_id) AS warning_count
    FROM Warning W
    JOIN Employee E ON W.employee_id = E.employee_id
    GROUP BY E.dept_id
),
AvgDeptWarnings AS (
    SELECT AVG(warning_count) AS avg_warnings
    FROM DeptWarnings
)
SELECT D.name AS DepartmentName, DW.warning_count AS AverageWarnings
FROM DeptWarnings DW
JOIN Department D ON DW.dept_id = D.dept_id
WHERE DW.warning_count > (SELECT avg_warnings FROM AvgDeptWarnings);

-- Query 6: Give the full details of an employee's work assignments during a specific duration
SELECT WA.*
FROM Work_Assignment WA
JOIN Employee E ON WA.employee_id = E.employee_id
WHERE E.name = 'Alice Johnson' -- Replace with the desired employee name
  AND WA.assignment_date BETWEEN '2024-09-01' AND '2024-09-30'; -- Replace dates as needed

-- Query 7: List the names of all employees with the count of their total warnings
SELECT E.name AS EmployeeName, COUNT(W.warning_id) AS TotalWarnings
FROM Employee E
LEFT JOIN Warning W ON E.employee_id = W.employee_id
GROUP BY E.name;

-- Query 8: List all unfinished (under process) work assignments for all employees within a specific department along with their names, the assigned date, and assignment duration
SELECT E.name AS EmployeeName, WA.assignment_date, WA.duration
FROM Work_Assignment WA
JOIN Employee E ON WA.employee_id = E.employee_id
JOIN Department D ON E.dept_id = D.dept_id
WHERE WA.status = 'Under Process'
  AND D.name = 'Sales'; -- Replace with the desired department name

-- Query 9: For a specific employee, list his attendance start and end time during a specific date range
SELECT A.start_hour, A.end_hour
FROM Attendance A
JOIN Employee E ON A.employee_id = E.employee_id
WHERE E.name = 'Alice Johnson' -- Replace with the desired employee name
  AND A.date BETWEEN '2024-09-01' AND '2024-09-30'; -- Replace dates as needed

-- Query 10: List all employee names and department names who were absent for more than three days during this month
WITH AbsenceCount AS (
    SELECT E.name, D.name AS DepartmentName, COUNT(A.attendance_id) AS AbsenceDays
    FROM Attendance A
    JOIN Employee E ON A.employee_id = E.employee_id
    JOIN Department D ON E.dept_id = D.dept_id
    WHERE A.status = 'Absent'
      AND MONTH(A.date) = MONTH(GETDATE()) -- Current month
      AND YEAR(A.date) = YEAR(GETDATE()) -- Current year
    GROUP BY E.name, D.name
)
SELECT name AS EmployeeName, DepartmentName, AbsenceDays
FROM AbsenceCount
WHERE AbsenceDays > 0;

-- Query 11: List all employee names that have excellent average evaluation rates (above 9) in all departments
WITH AvgEvaluation AS (
    SELECT E.employee_id, E.name, AVG(EV.rate) AS avg_rate
    FROM Evaluation EV
    JOIN Employee E ON EV.employee_id = E.employee_id
    GROUP BY E.employee_id, E.name
)
SELECT name AS EmployeeName, avg_rate
FROM AvgEvaluation
WHERE avg_rate > 9;

-- Query 12: List all evaluation details for an employee name
SELECT EV.*
FROM Evaluation EV
JOIN Employee E ON EV.employee_id = E.employee_id
WHERE E.name = 'Alice Johnson'; -- Replace with the desired employee name

-- Query 13: List all evaluations details done by a specific manager name
SELECT EV.*
FROM Evaluation EV
JOIN Employee E ON EV.employee_id = E.employee_id
JOIN Department D ON E.dept_id = D.dept_id
WHERE D.manager_id = (SELECT employee_id FROM Employee WHERE name = 'Diana Prince'); -- Replace with the desired manager name

