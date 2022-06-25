--1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.
select employees_name, monthly_salary from employees_salary
join employees on employees_salary.employees_id = employees.id
join salary on employees_salary.salary_id = salary.id;

--2. Вывести всех работников у которых ЗП меньше 2000.
select employees_name, monthly_salary from employees_salary
join employees on employees_salary.employees_id = employees.id
join salary on employees_salary.salary_id = salary.id
where monthly_salary < 2000;

--3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select employees_name, monthly_salary from employees_salary
left join employees on employees_salary.employees_id = employees.id
join salary on employees_salary.salary_id = salary.id
where employees_name is null;

--4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select employees_name, monthly_salary from employees_salary
left join employees on employees_salary.employees_id = employees.id
join salary on employees_salary.salary_id = salary.id
where employees_name is null and monthly_salary < 2000;

--5. Найти всех работников кому не начислена ЗП.
select employees.employees_name, monthly_salary from employees
full join employees_salaryon employees.id = employees_salary.employees_id 
full join salary on employees_salary.salary_id = salary.id
where monthly_salary is null;

-- 6. Вывести всех работников с названиями их должности.
select employees_name, role_name from roles_employees
join employees on roles_employees.employees_id = employees.id 
join roles on roles_employees.role_id = roles.id;

--7. Вывести имена и должность только Java разработчиков.
select employees_name, role_name from roles_employees
join employees on roles_employees.employees_id = employees.id
join roles on roles_employees.role_id = roles.id
where role_name like '%Java developer%';

--8. Вывести имена и должность только Python разработчиков.
select employees_name, role_name from roles_employees
join employees on roles_employees.employees_id = employees.id
join roles on roles_employees.role_id = roles.id
where role_name like '%Python developer%';

--9. Вывести имена и должность всех QA инженеров
select employees_name, role_name from roles_employees
join employees on roles_employees.employees_id = employees.id
join roles on roles_employees.role_id = roles.id
where role_name like '%QA engineer%';

--10. Вывести имена и должность ручных QA инженеров.
select employees_name, role_name from roles_employees
join employees on roles_employees.employees_id = employees.id
join roles on roles_employees.role_id = roles.id
where role_name like '%Manual QA engineer%';

--11. Вывести имена и должность автоматизаторов QA
select employees_name, role_name from roles_employees
join employees on roles_employees.employees_id = employees.id
join roles on roles_employees.role_id = roles.id
where role_name like '%Automation QA engineer%';

--12. Вывести имена и зарплаты Junior специалистов
select employees.employees_name,salary.monthly_salary from roles
join roles_employees on roles.id = roles_employees.role_id
join employees on roles_employees.employees_id  = employees.id
join employees_salary on employees.id = employees_salary.employees_id
join salary on employees_salary.salary_id = salary.id
where role_name like '%Junior%';

--13. Вывести имена и зарплаты Middle специалистов
select employees.employees_name,salary.monthly_salary from roles
join roles_employees on roles.id = roles_employees.role_id
join employees on roles_employees.employees_id  = employees.id
join employees_salary on employees.id = employees_salary.employees_id
join salary on employees_salary.salary_id = salary.id
where role_name like '%Middle%';

--14. Вывести имена и зарплаты Senior специалистов
select employees.employees_name,salary.monthly_salary from roles
join roles_employees on roles.id = roles_employees.role_id
join employees on roles_employees.employees_id  = employees.id
join employees_salary on employees.id = employees_salary.employees_id
join salary on employees_salary.salary_id = salary.id
where role_name like '%Senior%';

--15. Вывести зарплаты Java разработчиков
select salary.monthly_salary from roles
join roles_employees on roles.id = roles_employees.role_id
join employees on roles_employees.employees_id  = employees.id
join employees_salary on employees.id = employees_salary.employees_id
join salary on employees_salary.salary_id = salary.id
where role_name like '%Java developer%';

--17. Вывести имена и зарплаты Junior Python разработчиков
select employees_name, salary.monthly_salary from roles
join roles_employees on roles.id = roles_employees.role_id
join employees on roles_employees.employees_id  = employees.id
join employees_salary on employees.id = employees_salary.employees_id
join salary on employees_salary.salary_id = salary.id
where role_name = 'Junior Python developer';

--18. Вывести имена и зарплаты Middle JS разработчиков
select employees.employees_name, salary.monthly_salary from roles
join roles_employees on roles.id = roles_employees.role_id
join employees on roles_employees.employees_id  = employees.id
join employees_salary on employees.id = employees_salary.employees_id
join salary on employees_salary.salary_id = salary.id
where role_name = 'Middle JavaScript developer';

--19. Вывести имена и зарплаты Senior Java разработчиков
select employees_name, monthly_salary from roles 
join roles_employees on roles.id = roles_employees.role_id
join employees on roles_employees.employees_id = employees.id
join employees_salary on employees.id = employees_salary.employees_id
join salary on employees_salary.salary_id = salary.id
where role_name = 'Senior Java developer';

--20. Вывести зарплаты Junior QA инженеров
select monthly_salary from roles 
join roles_employees on roles.id = roles_employees.role_id
join employees on roles_employees.employees_id = employees.id
join employees_salary on employees.id = employees_salary.employees_id
join salary on employees_salary.salary_id = salary.id
where role_name like 'Junior %QA% engineer';

--21. Вывести среднюю зарплату всех Junior специалистов
select AVG(salary.monthly_salary) as avg_MS from roles
join roles_employees on roles.id = roles_employees.role_id
join employees on roles_employees.employees_id = employees.id
join employees_salary on employees.id = employees_salary.employees_id
join salary on employees_salary.salary_id = salary.id
where role_name like '%Junior%';

--22. Вывести сумму зарплат JS разработчиков
select  SUM(salary.monthly_salary) as S_MS from roles
join roles_employees on roles.id = roles_employees.role_id
join employees on roles_employees.employees_id  = employees.id
join employees_salary on employees.id = employees_salary.employees_id
join salary on employees_salary.salary_id = salary.id
where role_name like '%JavaScript developer%';

--23. Вывести минимальную ЗП QA инженеров
select MIN(monthly_salary) as min_SAL from roles 
join roles_employees on roles.id = roles_employees.role_id
join employees on roles_employees.employees_id = employees.id
join employees_salary on employees.id = employees_salary.employees_id
join salary on employees_salary.salary_id = salary.id
where role_name like '%QA engineer%';

--24. Вывести максимальную ЗП QA инженеров
select MAX(monthly_salary) as max_SAL from roles 
join roles_employees on roles.id = roles_employees.role_id
join employees on roles_employees.employees_id = employees.id
join employees_salary on employees.id = employees_salary.employees_id
join salary on employees_salary.salary_id = salary.id
where role_name like '%QA engineer%';

--25. Вывести количество QA инженеров
select COUNT(*)  from roles
join roles_employees on roles.id = roles_employees.role_id
where role_name like '%QA engineer%';

--26. Вывести количество Middle специалистов.
select COUNT(*)  from roles
join roles_employees on roles.id = roles_employees.role_id
where role_name like 'Middle%';

--27. Вывести количество разработчиков
select COUNT(*)  from roles
join roles_employees on roles.id = roles_employees.role_id
where role_name like '%developer';

--28. Вывести фонд (сумму) зарплаты разработчиков.
select  SUM(salary.monthly_salary) as S_MS from roles
join roles_employees on roles.id = roles_employees.role_id
join employees on roles_employees.employees_id  = employees.id
join employees_salary on employees.id = employees_salary.employees_id
join salary on employees_salary.salary_id = salary.id
where role_name like '%developer';

--29. Вывести имена, должности и ЗП всех специалистов по возрастанию
select employees.employees_name,salary.monthly_salary, roles.role_name from roles
join roles_employees on roles.id = roles_employees.role_id
join employees on roles_employees.employees_id  = employees.id
join employees_salary on employees.id = employees_salary.employees_id
join salary on employees_salary.salary_id = salary.id
order by monthly_salary;

--30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300
select employees.employees_name,salary.monthly_salary, roles.role_name from roles
join roles_employees on roles.id = roles_employees.role_id
join employees on roles_employees.employees_id  = employees.id
join employees_salary on employees.id = employees_salary.employees_id
join salary on employees_salary.salary_id = salary.id
where monthly_salary between 1700 and 2300
order by monthly_salary;

--31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300
select employees.employees_name,salary.monthly_salary, roles.role_name from roles
join roles_employees on roles.id = roles_employees.role_id
join employees on roles_employees.employees_id  = employees.id
join employees_salary on employees.id = employees_salary.employees_id
join salary on employees_salary.salary_id = salary.id
where monthly_salary < 2300
order by monthly_salary;

--32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000
select employees.employees_name,salary.monthly_salary, roles.role_name from roles
join roles_employees on roles.id = roles_employees.role_id
join employees on roles_employees.employees_id  = employees.id
join employees_salary on employees.id = employees_salary.employees_id
join salary on employees_salary.salary_id = salary.id
where monthly_salary in (1100, 1500, 2000)
order by monthly_salary;