-- Write your PostgreSQL query statement below
select d.name as Department, e.name as Employee, e.salary as Salary 
from employee as e
left join department as d
on e.departmentid = d.id
where (d.Id, e.Salary) in (select DepartmentId, max(Salary)
from Employee
group by DepartmentId);