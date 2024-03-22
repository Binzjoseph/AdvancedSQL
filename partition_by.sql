-- partition by

-- using partition by you can do the grouping on 1 column and keep the rest of the columns out of it unlike
-- group by where the number of rows are reduced for example

use sql_tutorial;

select gender, count(gender)
from employeedemographics
group by gender;

select firstname, lastname, gender, 
count(gender) over (partition by gender) as totalgender
from employeedemographics;
