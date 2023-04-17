create table employees
(
    id         integer primary key,
    name       varchar(50),
    city       varchar(50),
    department varchar(50),
    salary     integer
);

insert into employees
    (id, name, city, department, salary)
values (24, 'Марина', 'Москва', 'it', 104),
       (21, 'Елена', 'Самара', 'it', 84),
       (22, 'Ксения', 'Москва', 'it', 90),
       (25, 'Иван', 'Москва', 'it', 120),
       (23, 'Леонид', 'Самара', 'it', 104),
       (11, 'Дарья', 'Самара', 'hr', 70),
       (12, 'Борис', 'Самара', 'hr', 78),
       (31, 'Вероника', 'Москва', 'sales', 96),
       (33, 'Анна', 'Москва', 'sales', 100),
       (32, 'Григорий', 'Самара', 'sales', 96);

create table
    expenses
(
    year    integer,
    month   integer,
    income  integer,
    expense integer
);

insert into expenses
    (year, month, income, expense)
values (2020, 1, 94, 82),
       (2020, 2, 94, 75),
       (2020, 3, 94, 104),
       (2020, 4, 100, 94),
       (2020, 5, 100, 99),
       (2020, 6, 100, 105),
       (2020, 7, 100, 95),
       (2020, 8, 100, 110),
       (2020, 9, 104, 104);