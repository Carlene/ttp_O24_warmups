-- HINT: For all of these exercises, you'll need to google
-- *postgres's* standard deviation function.
-- There's 3, 1 of them doesn't work, and one of them is more
-- appropriate. Try to pick the best one.


-- 1) Get the average and standard deviation of purchase amounts 
-- in our database.
-- Write down these numbers.

SELECT 
	ROUND(STDDEV_POP(amount), 2) as standard_deviation

FROM 
	payment;

-- $2.37

SELECT 
	ROUND(AVG(amount), 2) as average

FROM 
	payment;

-- $4.20

--------------
-- 2) Get the average purchase per employee, as well as the standard
-- deviation.

-- Write down these numbers.

-- Based on these numbers, do you think there's any meaningful
-- difference between the natural of transactions they handle?


SELECT
	ROUND(AVG(amount), 2) as average
	,ROUND(STDDEV_POP(amount), 2) as standard_deviation
	,staff_id

FROM
	payment

GROUP BY
	staff_id;

-- Average: Staff_ID 1: $4.15, Staff_ID 2: $4.25
-- Standard Deviation is the same for both: $2.37

-- The standard deviation is the same, so I don't believe there's any meaningful difference between the transactions the staffers handled

--------------

-- 3) Get the average purchase for each customer, as well as the standard
-- deviation.

-- Which customer is the most / least predictable in their behavior?
-- hint: think about standard deviation.


SELECT
	ROUND(AVG(amount), 2) as average
	,ROUND(STDDEV_POP(amount), 2) as standard_deviation
	,customer_id

FROM
	payment

GROUP BY
	customer_id;

-- The most predictable customers are the customers who have a standard deviation closest to 2.37, and the least predictable are the farthest away from 2.37

--------------

-- 4) what is the average and standard deviation for the number of 
-- purchases per customer?

-- Based on this, can you say anything about 'typical' customer
-- behavior? (For the sake of this, let's assume all purchases
-- were made in the past year.)
-- Don't need to be super specific about this.



SELECT
	customer_id
	,COUNT(payment_id)
	,ROUND(AVG(payment_id), 2) as average
	,ROUND(STDDEV_POP(payment_id), 2) as standard_deviation

FROM
	payment

GROUP BY
	customer_id

ORDER BY
	4
