# SQL Joins: `INNER JOIN`, `LEFT JOIN`, and `FULL OUTER JOIN`

This README explains how to use three of the most common SQL joins: `INNER JOIN`, `LEFT JOIN`, and `FULL OUTER JOIN`. These are used to combine data from two or more tables based on related columns.

---

## **1. INNER JOIN**

### **Purpose**: 
An `INNER JOIN` retrieves **only the rows** where there is a match in both tables. It excludes rows from both tables where there is no match.

### **Syntax**:

SELECT columns
FROM table1
INNER JOIN table2
ON table1.column = table2.column;

## ** 2. LEFT JOIN (LEFT OUTER JOIN) **

### **Purpose**:

A LEFT JOIN retrieves all rows from the left table (table1) and the matching rows from the right table (table2). If there is no match, NULL values are returned for the columns from the right table.

### **Syntax**:

SELECT columns
FROM table1
LEFT JOIN table2
ON table1.column = table2.column;

## **3. FULL OUTER JOIN **

### **Purpose**:

A FULL OUTER JOIN retrieves all rows from both tables, including rows where there is no match. If there is no match, NULL values are returned for columns from the table that has no match.

### **Syntax**:

SELECT columns
FROM table1
FULL OUTER JOIN table2
ON table1.column = table2.column;
