/*CREATE TABLE explosive_data(
row smallint,
ticker varchar(5),
flag varchar(4),
daily_increase float(6),
news varchar(50),
highs varchar(8),
move varchar(25),
rsi smallint,
short_percent float,
volume int,
industry varchar(25),
three_day_return float,
one_week_return float,
two_week_return float,
absolute_high float,
second_day varchar(5),
announcments varchar(5)
);

COPY explosive_data
FROM 'C:\Users\chadh\Downloads\ed_unclean.csv'
WITH (FORMAT CSV, HEADER); */

SELECT * FROM explosive_data; --Validation Query to ensure everything imported correctly


-- DATA CLEANING
SELECT DISTINCT(move) FROM explosive_data; -- check for misspelled items

UPDATE explosive_data SET move = 'initial' WHERE move ILIKE 'i%'; -- correct misspelled items

SELECT DISTINCT(flag) FROM explosive_data; -- Check for incorrect entries

UPDATE explosive_data SET flag = 'B' WHERE flag ilike 'B_'; -- remove unneccessary spaces

SELECT DISTINCT(industry) FROM explosive_data ORDER BY industry; -- Check for different spellings and puncuation

UPDATE explosive_data SET industry = 'Energy' WHERE industry ilike 'energy'; -- Correct punctuation

--DATA EXPLORATION
SELECT round(sum(three_day_return)) AS three_day_profit,
       count(move) AS total_trades,
       move
FROM explosive_data 
GROUP BY move;
'''This Query identifies the total number of trades made, ordered by the condition of the move, and how much
    total profit each move yielded'''

SELECT round(sum(three_day_return)) AS three_day_profit
FROM (SELECT rsi,three_day_return FROM explosive_data WHERE move = 'initial')
WHERE rsi >= 65
''' This query uses a sub query to find the total profit from trades with an RSI greater than 65 and on an initial move'''


