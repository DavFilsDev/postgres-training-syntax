-- 1
select id, first_name, last_name
from Employee
where id not in (select employee_id from Team);

-- 2
select id, first_name, last_name
from Employee
where leave_id is null;

-- 3
select l.id as leave_id,
       l.start_date,
       l.end_date,
       e.first_name,
       e.last_name,
       t.name as team_name
from Leave l
join Employee e on e.leave_id = l.id
left join Team t on t.employee_id = e.id;

-- 4
select contract_type, count(*) as num_employees
from Employee
group by contract_type;

-- 5
select count(*) as employees_on_leave
from Employee e
join Leave l on e.leave_id = l.id
where CURRENT_DATE between l.start_date and l.end_date;

-- 6
select e.id, e.first_name, e.last_name, t.name as team_name
from Employee e
join Leave l on e.leave_id = l.id
left join Team t on t.employee_id = e.id
where CURRENT_DATE between l.start_date and l.end_date;