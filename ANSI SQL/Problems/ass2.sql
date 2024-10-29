--Assignment- 2

--Data Manipulation (DML)-I:
--1. Find the names of all clients having ‘A’ as the second letter in their names.

SQL> select ename from emp where ename like '_A%';

ENAME
----------
WARD
MARTIN
JAMES

--2. Find out the clients who do not stay in a city whose first letter is ‘b’.


SQL> select name,city from CLIENT_MASTER_OLD where city like 'B%';

NAME                           CITY
------------------------------ ---------------
Ivan Bayross                   Bombay
Basu Navindgi                  Bombay
Rukmini                        Bombay

--3. List the names and city of all clients who have exactly 12 characters in length and starts with ‘I’.


SQL> select name,city from CLIENT_MASTER_OLD where length(name)=12 and name like 'I%';

NAME                           CITY
------------------------------ ---------------
Ivan Bayross                   Bombay

--4. Find the list of all clients who stay in ‘Bombay’ or ‘Delhi’.


SQL> select name,city from client_master_old where city='Bombay' or city='Delhi';

NAME                           CITY
------------------------------ ---------------
Ivan Bayross                   Bombay
Basu Navindgi                  Bombay
Ravi Shreedharan               Delhi
Rukmini                        Bombay

SQL> select name,city from client_master_old where city like 'Bombay' or city like 'Delhi';

NAME                           CITY
------------------------------ ---------------
Ivan Bayross                   Bombay
Basu Navindgi                  Bombay
Ravi Shreedharan               Delhi
Rukmini                        Bombay

--5. Print the list of all clients whose balance_due is greater than value 10,000.


SQL> select name,balance_due from CLIENT_MASTER_OLD where balance_due>10000;

NAME                           BALANCE_DUE
------------------------------ -----------
Ivan Bayross                         15000

--6. Print the information from sales_order table for orders places in the month of January.

SQL> select * from sales_order_old where to_char(order_date,'mon') like 'jan'; 

--importent ***jan should be in small and use only '' not "" ****

ORDER_ ORDER_DAT CLIENT SALESM D B DELIVERY_ ORDER_STAT
------ --------- ------ ------ - - --------- ----------
O19001 12-JAN-96 C001   S001   F N 20-JAN-96 InProcess
O19002 25-JAN-96 C002   S002   P N 27-JAN-96 BackOrder

-- 7. Display the order information for client_no ‘C001’ and ‘C002’.

SQL> select * from client_master_old where client_no='C001' or client_no='C002';

CLIENT NAME                           ADDRESS1                       ADDRESS2                       CITY            STATE              PINCODE
------ ------------------------------ ------------------------------ ------------------------------ --------------- --------------- ----------
BALANCE_DUE
-----------
C001   Ivan Bayross                   P-76                           Worli                          Bombay          Maharashtra         400054
      15000

C002   Vandana Satiwala               128                            Adams Street                   Madras          Tamil Nadu          780001
          0

SQL> select * from client_master_old where client_no in ('C001','C002');

CLIENT NAME                           ADDRESS1                       ADDRESS2                       CITY            STATE              PINCODE
------ ------------------------------ ------------------------------ ------------------------------ --------------- --------------- ----------
BALANCE_DUE
-----------
C001   Ivan Bayross                   P-76                           Worli                          Bombay          Maharashtra         400054
      15000

C002   Vandana Satiwala               128                            Adams Street                   Madras          Tamil Nadu          780001
          0
-- 8. Find products whose selling price greater than 2000 and less than 5000.

SQL> select product_no,description,sell_price from product_master where sell_price>2000 and sell_price<5000;

PRODUC DESCRIPTION                              SELL_PRICE
------ ---------------------------------------- ----------
P07868 Keyboard                                       3150

-- 9. Find products whose selling price is more than 1500.Calculate a new selling price as original selling price*1.15. Rename
SQL> select sell_price*1.15 as new_sell_price from product_master where sell_price>1500;

NEW_SELL_PRICE
--------------
         13800
        3622.5
        6037.5
          9660
-- the new column in the above query is New_price.

-- 10. List the names, city and state of clients who are not in the state of ‘Maharastra’.
SQL> select name,city,state from client_master_old where state <> 'Maharashtra';

NAME                           CITY            STATE
------------------------------ --------------- ---------------
Vandana Satiwala               Madras          Tamil Nadu
Pramada Jaguste                Kolkata         West Bengal
Ravi Shreedharan               Delhi           Delhi

SQL> select name,city,state from client_master_old where state not like 'Maharashtra';

NAME                           CITY            STATE
------------------------------ --------------- ---------------
Vandana Satiwala               Madras          Tamil Nadu
Pramada Jaguste                Kolkata         West Bengal
Ravi Shreedharan               Delhi           Delhi

-- 11. Display the month(in alphabets) and date when the order must be delivered.
SQL> select delivery_date,to_char(delivery_date,'mon') as month from sales_order_old where ORDER_STATUS='Fullfilled';

DELIVERY_ MONTH
--------- ------------
20-FEB-96 feb
07-APR-96 apr

SQL> select delivery_date,to_char(delivery_date,'month') as month from sales_order_old where ORDER_STATUS='Fullfilled';

DELIVERY_ MONTH
--------- ------------------------------------
20-FEB-96 february
07-APR-96 april
-- 12. Display the Order_date in the format ‘DD-Month-YY’ e.g 12-February-13.
SQL> select delivery_date ,to_char(delivery_date,'day-month-yy') from sales_order_old;

DELIVERY_ TO_CHAR(DELIVERY_DATE,'DAY-MONTH-YY')
--------- ----------------------------------------------------------------------------
20-JAN-96 friday   -january  -96
27-JAN-96 friday   -january  -96
20-FEB-96 monday   -february -96
07-APR-96 saturday -april    -96
22-MAY-96 tuesday  -may      -96
26-MAY-96 saturday -may      -96
-- 13. Find the date, 15 days after today’s date.

SQL> select sysdate+15 from dual;

SYSDATE+1
---------
11-OCT-24