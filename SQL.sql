-- CREATE DATABSE OLA;
-- USE ola;

  select * from bookings;
 SELECT COUNT(*) FROM bookings;
 
 ALTER TABLE bookings  
 DROP COLUMN MyUnknownColumn ;
 
  select * from bookings;


 
  ALTER TABLE bookings
  MODIFY COLUMN Customer_ID VARCHAR(100) after Booking_ID;

 
-- 1. Retrieve all successful bookings:
SELECT * FROM bookings
WHERE Booking_Status = 'success' ;


-- 2. Find the average ride distance for each vehicle type:
SELECT Vehicle_Type , avg(Ride_Distance) AS Average_distance
 FROM bookings
 group by Vehicle_Type ;
 
 
 

-- 3. Get the total number of cancelled rides by customers:
SELECT count(*) FROM bookings
where Booking_Status = 'canceled by customer';




-- 4. List the top 5 customers who booked the highest number of rides:
SELECT Customer_ID  , count(Booking_ID) as No_of_Rides
FROM bookings
group by Customer_ID
order by No_of_Rides desc limit 5 ;



-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
select count(*)
from bookings
where Canceled_Rides_by_Driver = ' personal & car-related issues';



-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
select max(driver_ratings) as Max_Rating , min(driver_ratings) as Min_Rating
from bookings
where Vehicle_Type = 'Prime sedan' ;



-- 7. Retrieve all rides where payment was made using UPI:
select * 
from bookings
where Payment_Method= 'UPI';


-- 8. Find the average customer rating per vehicle type:
select Vehicle_Type , avg(customer_rating) as Average_CustomerRating
from bookings
group by Vehicle_Type;




-- 9. Calculate the total booking value of rides completed successfully:
select sum(booking_value) as Total_Successful_Rides_Booking
from bookings
where Booking_status = 'success';


-- 10. List all incomplete rides along with the reason:
select Booking_ID , Incomplete_Rides_Reason 
from bookings
where Incomplete_Rides= 'Yes';