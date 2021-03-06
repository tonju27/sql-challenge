-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/6WkWEH
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Physical ERD

CREATE TABLE "employees" (
    "emp_no" INT   NOT NULL,
    "emp_title_id" VARCHAR(30)   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR(30)   NOT NULL,
    "last_name" VARCHAR(30)   NOT NULL,
    "sex" VARCHAR(5)   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

select * from employees;

CREATE TABLE "departments" (
    "dept_no" VARCHAR(15)   NOT NULL,
    "dept_name" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

select * from departments;

CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR(15)   NOT NULL,
    "emp_no" INT   NOT NULL
);

select * from dept_manager;

CREATE TABLE "dept_emp" (
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR(15)   NOT NULL
);

select * from dept_emp;

CREATE TABLE "titles" (
    "title_id" VARCHAR(30)   NOT NULL,
    "titles" VARCHAR(30)   NOT NULL
);

select * from titles;

CREATE TABLE "salaries" (
    "emp_no" INT   NOT NULL,
    "salary" INT   NOT NULL
);

select * from salaries;

CREATE TABLE "employees_departments_junction" (
    "emp_no" INT   NOT NULL,
    "dept_no" varchar(15)   NOT NULL
);

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager__dept_no" FOREIGN KEY("", "dept_no")
REFERENCES "departments" ("", "dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp__dept_no" FOREIGN KEY("", "dept_no")
REFERENCES "departments" ("", "dept_no");

ALTER TABLE "titles" ADD CONSTRAINT "fk_titles_title_id" FOREIGN KEY("title_id")
REFERENCES "employees" ("emp_title_id");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "employees_departments_junction" ADD CONSTRAINT "fk_employees_departments_junction_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "employees_departments_junction" ADD CONSTRAINT "fk_employees_departments_junction_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

