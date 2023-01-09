
--1.	Show the names and phone numbers of all shareholders in a descendent order per name. 
Select (first_name+' '+last_name) AS name, phone_number From share_holder Order By name Desc;

--2.	List all market names with their opening and closing hours. 
Select name, opening_hours, closing_hours From Market;

--3.	List the top 10 companies having the highest capital in us dollars in “FTSE” market. 
Select Top 10 * From company Where MID = 'FTSE' 
Order By capital DESC;

--4.	List all the companies that are registered in “Beirut stock exchange” market in addition to the current share price of each, its 52 weeks high and 52 weeks low price. 
Select name, current_price, highest_price, lowest_price 
From company Where MID = 
(Select ID From Market Where name = 'Beirut Stock Exchange');

--5.	Show the buying orders set for “GOOG” share in “NASDAQ” market for the trading session of today. 
Select ID, CSID, SHID, type, orders.volume_of_shares 
From orders Join company On CSID = company.SID  
Where CSID = 'GOOG' AND MID = 'NASDAQ' AND type = 'b'
AND date = CAST( GETDATE() AS Date );

--6.	List the top 5 largest transactions made in “NASDAQ” market in 2016 in terms of value in US dollars. 
Select Top 10 transactions.* from transactions
Join market_has_sessions on transactions.date = market_has_sessions.date
Where market_has_sessions.MID = 'NASDAQ' AND transactions.date Like '2022______' 
Order By (price_of_shares * volume_of_shares) Desc;

--7.	Show the opening and closing price for “Microsoft” share for the session of today. “MSFT” is the share id of “Microsoft” company that is registered in “NASDAQ” market. Opening price is the price of a share traded in the first transaction in a day. Closing price is the price of a share traded in the last transaction in a day. 
Select (Select Top 1 price_of_shares from transactions
Join market_has_sessions on transactions.date = market_has_sessions.date 
Join orders on transactions.date = market_has_sessions.date
Where transactions.date = CAST( GETDATE() AS Date )
And market_has_sessions.MID = 'NASDAQ'
And orders.CSID = 'MSFT'
Order By transactions.id ASC) AS 'Opening Price',
(Select Top 1 price_of_shares from transactions
Join market_has_sessions on transactions.date = market_has_sessions.date 
Join orders on transactions.date = market_has_sessions.date
Where transactions.date = CAST( GETDATE() AS Date )
And market_has_sessions.MID = 'NASDAQ'
And orders.CSID = 'MSFT'
Order By transactions.id DESC) AS 'Closing Price';

--8.	Show the day high and day low price for “SOLB” for yesterday’s trading session. “SOLB” is registered in “Beirut Stock Exchange” market. Day high refers to the highest price of a share in a day. Day low refers to its lowest price in that day. 
Select Max(price_of_shares)  AS 'Day High', Min(price_of_shares) AS 'Day Low'
from transactions
Join market_has_sessions on transactions.date = market_has_sessions.date 
Join orders on transactions.date = market_has_sessions.date
Where transactions.date = DATEADD(day, -1, CAST(GETDATE() AS date))
And market_has_sessions.MID = (Select ID From market Where name = 'Beirut Stock Exchange')
And orders.CSID = 'SOLB';

--9.	Show the average share price of “GOOG” which belongs to “NASDAQ” market for the session of 23 October 2016. This information is retrieved from the transactions table. 
Select Avg(price_of_shares) AS 'Avg Price' From transactions
Join market_has_sessions On transactions.date = market_has_sessions.date 
Join orders On transactions.date = orders.date
Where orders.CSID = 'GOOG'
AND market_has_sessions.MID = 'NASDAQ'
AND transactions.date = '2016-10-28';

--10.	Show the highest and lowest share price of “APPL” share that belongs to “NASDAQ” market between 18 October 2016 and 23 October 2016. 
Select Max(price_of_shares) AS 'Highest', Min(price_of_shares) AS 'Lowest'
From transactions
Join orders on transactions.date = orders.date
Where orders.CSID = 'APPL'
AND (Select MID From company Where SID = 'APPL') = 'NASDAQ'
AND transactions.date > '2016-10-17'
AND transactions.date < '2016-10-24';

--11.	List all the shares traded today and the volume of shares per each in descendent order per volume. 
Select CSID, volume_of_shares From orders
Where date = CAST( GETDATE() AS Date ) 
AND type = 'b'
Order By orders.volume_of_shares Desc;

--12.	List the last three transactions made by the shareholder “Jad Assaf”.
Select Top 3 * From transactions 
Where BSHID = (Select ID From share_holder Where first_name = 'Jad' AND last_name = 'Assaf')
Order By date Desc;

--13.	List the top 5 shares in terms of volume of shares traded between 10 October 2016 and 20 October 2016. 
Select Top 5 SID From company
Join orders On SID = orders.CSID
Where orders.date > '2016-10-9' 
AND orders.date < '2016-10-21'
AND orders.type = 'b'
Order By orders.volume_of_shares Desc;

--14.	List the transactions made on behalf of the shareholder “Jad Assaf”. 
Select * From transactions 
Where SSHID = (Select ID From share_holder Where first_name = 'Jad' AND last_name = 'Assaf');

--15.	Show the number of companies registered for each market. 
Select MID, Count(MID) AS 'Number of companies' From company Group By MID;

--16.	Show the total number of shares per all companies for each market and their value in us dollars. 
Select MID, Sum(volume_of_shares) AS 'Sum of Shares', 
Sum(volume_of_shares * current_price) As 'Value' 
From company Group By MID;