-- Write your PostgreSQL query statement below
select d.name as Department, e.name as Employee, e.salary as Salary 
from 
(
    select name, salary, departmentid, 
    dense_rank() over(partition by departmentid order by salary desc) as salary_rank
    from employee
) e
left join department d on e.departmentid = d.id where e.salary_rank <= 3;