-- Write your PostgreSQL query statement below
select e1.name 
from employee as e1
left join employee as e2
on e1.id = e2.managerid
group by e1.name, e1.id
having count(e2.managerid)>=5;