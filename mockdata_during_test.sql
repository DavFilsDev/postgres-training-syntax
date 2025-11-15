insert into Leave (start_date, end_date) values
('2025-11-01', '2025-11-05'),
('2025-11-10', '2025-11-12'),
('2025-11-14', '2025-11-16');

insert into Employee (first_name, last_name, contract_type, salary, leave_id) values
('Fenohasina', 'BE', 'Full-time', 5000, 1),
('David', 'RATIANDRAIBE', 'Part-time', 3000, NULL),
('Christian', 'RAVELOJAONA', 'Full-time', 5500, 2),
('Antonio', 'RAKOTOZAFY', 'Contract', 4000, 3),
('Gael', 'RAZAKAMANANA', 'Full-time', 6000, NULL);

insert into Team (name, employee_id) values
('Alpha', 1),
('Beta', 3),
('Gamma', 4);
