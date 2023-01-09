/*
NOTE:
    Any dates that happens to be Saturday OR Sunday cannot be inserted, 
    therefore the insertingqueries cannot be executed on saturday,sunday or monday 
    because they contain functions that will insert the date of execution and the day before.
*/

--POPULATING TABLES WITH DATA
INSERT INTO market(ID, name, opening_hours, closing_hours) values
('NO MARKET', NULL, NULL, NULL),
('NASDAQ', 'National Association of Securities Dealers Automated Quotations', '06:00:00', '18:00:00'),
('FTSE', 'Financial Times Stock Exchange', '05:00:00', '16:00:00'),
('BSE', 'Beirut Stock Exchange', '07:00:00', '17:00:00'),
('DESE', 'Deutchland Stock Exchange', '05:00:00', '16:00:00'),
('TSE', 'Tokyo Stock Exchange', '07:00:00', '18:00:00'),
('LSE', 'London Stock Exchange', '06:00:00', '18:00:00'),
('NYSE', 'New York Stock Exchange', '06:00:00', '17:00:00'),
('JPX', 'Japan Exchange Group', '07:00:00', '17:00:00');

--select * from company;
INSERT INTO company(SID, name, volume_of_shares, capital, highest_price, lowest_price, current_price, MID) values
('APPL', 'Apple Inc', 1000000, 10000000, 344, 120, 210, 'NASDAQ'),
('MSFT', 'Microsoft', 800000, 7000000, 272, 133, 194, 'NASDAQ'),
('SOLB', 'Some lebanese company', 300000, 500000, 92, 77, 74, 'BSE'),
('GOOG', 'Google', 2000000, 1100000, 398, 307, 290, 'NASDAQ'),
('TOYO', 'Toyota', 60000, 300000, 230, 110, 137, 'TSE'),
('PFEI', 'Pfizer', 700000, 1900000, 302, 127, 204, 'DESE'),
('LFMG', 'London Free Market Group', 670000, 900000, 402, 121, 274, 'FTSE'),
('LSEG', 'London Stock Exchange Group', 800000, 1300000, 397, 177, 314, 'LSE'),
('SMT', 'SCOTTISH MORTGAGE', 1700000, 12000000, 304, 100, 290, 'FTSE'),
('AAF', 'AIRTEL AFRICA', 820000, 7500000, 372, 193, 114, 'FTSE'),
('OCDO', 'OCADO GROUP PLC', 340000, 590000, 122, 87, 84, 'FTSE'),
('SGRO', 'SEGRO PLC ORD', 1200000, 1000000, 428, 327, 210, 'FTSE'),
('FCIT', 'F&C INVESTMENT TRUST', 140000, 350000, 250, 119, 117, 'FTSE'),
('AUTO', 'AUTO TRADER GROUP', 570000, 2100000, 342, 217, 124, 'FTSE'),
('ABDN', 'ABRDN PLC ORD p', 250000, 300000, 342, 128, 134, 'FTSE'),
('TSLA', 'Tesla Inc',1030000,1100000,164,119,135,'NYSE'),
('YAHO', 'Yahoo Finance',450000,500000,132,94,112,'NYSE'),
('HOYO', 'Hoyoverse',1500000,1690000,184,149,165,'TSE'),
('SONY', 'Sony Group Corporation',1900000,2000000,192,143,178,'JPX'),
('AMZN', 'Amazon Inc',200000,2100000,312,204,268,'NASDAQ');

--select * from share_holder;
Insert Into share_holder(ID, first_name, last_name, phone_number) values
('JADA', 'Jad', 'Assaf', '(+961)03102213'),
('MARI', 'Mariam', 'Fakih', '(+961)76901813'),
('RASH', 'Rashid', 'Bazoun', '(+961)81885469'),
('AMJA', 'Amjad', 'Al Kaftan', '(+961)03245754'),
('FIRA', 'Firas', 'EL Moussa', '(+961)03903410'),
('JHON', 'Jhon', 'Cena', '(+1)40102213'),
('BRUN', 'Bruno', 'Mars', '(+1)3102213'),
('PETE', 'Peter', 'Griffen', '(+1)5182290'),
('ANTA', 'Andrew', 'Tate', '(+1)2394300243'),
('DOTR', 'Donald', 'Trump', '(+1)5436898534'),
('ELMU', 'Elon', 'Musk', '(+1)4345244694'),
('NOOM', 'Noor', 'Omar', '(+966)4357920573'),
('AMRK', 'Amran', 'Rkony', '(+961)71436584'),
('SABR', 'Saly', 'Braon', '(+961)03357923'),
('LAMO', 'Layla', 'Mohammad', '(+961)03579273'),
('BIGA', 'Bill', 'Gates', '(+1)0390579273'),
('JEBE', 'Jeff', 'Bazos', '(+1)9326582493');
delete from session;
--select * from session;
Insert Into session(date) values
(CAST( GETDATE() AS Date )), (DATEADD(day, -1, CAST(GETDATE() AS date))),
('2016-10-10'),('2016-10-11'),('2016-10-12'),('2016-10-13'),('2016-10-14'),
('2016-10-25'),('2016-10-26'),('2016-10-17'),('2016-10-18'),('2016-10-19'),
('2016-10-20'),('2016-10-21'),('2016-10-27'),('2016-10-28'),('2016-10-24'),
('2022-10-19'),('2022-10-20'),('2022-10-21'),('2022-10-25'),('2022-10-26'),
('2022-10-24');

--select * from market_has_sessions;
Insert Into market_has_sessions(date, MID) values
('2016-10-10', 'NASDAQ'),('2016-10-11', 'NASDAQ'),('2016-10-12', 'NASDAQ'),('2016-10-13', 'NASDAQ'),
('2016-10-10', 'FTSE'),('2016-10-11', 'FTSE'),('2016-10-12', 'FTSE'),('2016-10-13', 'FTSE'),
('2016-10-10', 'BSE'),('2016-10-11', 'BSE'),('2016-10-12', 'BSE'),('2016-10-13', 'BSE'),
('2016-10-10', 'DESE'),('2016-10-11', 'DESE'),('2016-10-24', 'DESE'),('2016-10-13', 'DESE'),
('2016-10-10', 'TSE'),('2016-10-25', 'TSE'),('2016-10-26', 'TSE'),('2016-10-17', 'TSE'),
('2016-10-18', 'LSE'),('2016-10-25', 'LSE'),('2016-10-26', 'LSE'),('2016-10-17', 'LSE'),
('2016-10-18', 'NYSE'),('2016-10-25', 'NYSE'),('2016-10-27', 'NYSE'),('2016-10-28', 'NYSE'),
('2016-10-19', 'JPX'),('2016-10-20', 'JPX'),('2016-10-21', 'JPX'),('2016-10-28', 'JPX'),
('2016-10-19', 'NASDAQ'),('2016-10-21', 'NASDAQ'),('2016-10-20', 'NASDAQ'),('2016-10-24', 'NASDAQ'),
('2022-10-24', 'NASDAQ'),('2022-10-26', 'NASDAQ'),('2022-10-25', 'NASDAQ'),('2022-10-21', 'NASDAQ'),
('2022-10-20', 'NASDAQ'),('2022-10-19', 'NASDAQ'),('2016-10-28', 'NASDAQ'), (DATEADD(day, -1, CAST(GETDATE() AS date)), 'BSE'),
(CAST( GETDATE() AS Date ), 'NASDAQ');
select DATENAME(WEEKDAY, '2016-10-25');

declare @x date = '2016-10-10';
select DATENAME(WEEKDAY, '2022-10-25') ;

--select * from orders;
Insert Into orders(CSID, SHID, type, volume_of_shares, date) values
('APPL', 'JADA', 's', 455, DATEADD(day, -1, CAST(GETDATE() AS date))), ('APPL', 'MARI', 'b', 455, DATEADD(day, -1, CAST(GETDATE() AS date))),
('GOOG', 'RASH', 's', 250, CAST( GETDATE() AS Date )), ('GOOG', 'FIRA', 'b', 250, CAST( GETDATE() AS Date )),
('TOYO', 'FIRA', 's', 1000, CAST( GETDATE() AS Date )), ('TOYO', 'MARI', 'b', 1000, CAST( GETDATE() AS Date )),
('SOLB', 'RASH', 's', 250, CAST( GETDATE() AS Date )), ('SOLB', 'AMJA', 'b', 250, CAST( GETDATE() AS Date )),
('LFMG', 'JHON', 's', 500, CAST( GETDATE() AS Date )), ( 'LFMG', 'MARI', 'b', 500, CAST( GETDATE() AS Date )),
('LSEG', 'JHON', 's', 250, CAST( GETDATE() AS Date )), ('LSEG', 'FIRA', 'b', 250, CAST( GETDATE() AS Date )), 
('TOYO', 'PETE', 's', 2000, CAST( GETDATE() AS Date )), ('TOYO', 'AMJA', 'b', 2000, CAST( GETDATE() AS Date )),
('SOLB', 'JHON', 's', 450, CAST( GETDATE() AS Date )), ('SOLB', 'AMJA', 'b', 450, CAST( GETDATE() AS Date )),
('GOOG', 'BRUN', 's', 300, '2016-10-10'), ('GOOG', 'RASH', 'b', 300, '2016-10-10'),
('MSFT', 'PETE', 's', 250, '2016-10-11'), ('MSFT', 'BRUN', 'b', 250, '2016-10-11'),
('TSLA', 'AMJA', 's', 450, '2016-10-12'), ('TSLA', 'NOOM', 'b', 450, '2016-10-12'),
('TSLA', 'PETE', 's', 250, '2016-10-13'), ('TSLA', 'FIRA', 'b', 250, '2016-10-13'),
('HOYO', 'RASH', 's', 650, '2016-10-14'), ('HOYO', 'AMJA', 'b', 650, '2016-10-14'),
('HOYO', 'LAMO', 's', 400, '2016-10-25'), ('HOYO', 'AMRK', 'b', 400, '2016-10-25'),
('SONY', 'SABR', 's', 600, '2016-10-26'), ('SONY', 'ANTA', 'b', 600, '2016-10-26'),
('YAHO', 'DOTR', 's', 350, '2016-10-17'), ('YAHO', 'ELMU', 'b', 350, '2016-10-17'),
('YAHO', 'ELMU', 's', 400, '2016-10-18'), ('YAHO', 'ANTA', 'b', 400, '2016-10-18'),
('AMZN', 'JEBE', 's', 950, '2016-10-19'), ('AMZN', 'BIGA', 'b', 950, '2016-10-19'),
('AMZN', 'SABR', 's', 1200,'2016-10-20'), ('AMZN', 'RASH', 'b', 1200,'2016-10-20'),
('GOOG', 'BRUN', 's', 300, '2016-10-21'), ('GOOG', 'RASH', 'b', 300, '2016-10-21'),
('MSFT', 'PETE', 's', 350, '2016-10-27'), ('MSFT', 'BRUN', 'b', 350, '2016-10-27'),
('YAHO', 'ELMU', 's', 430, '2016-10-28'), ('YAHO', 'ANTA', 'b', 430, '2016-10-28'),
('TOYO', 'JEBE', 's', 750, '2016-10-24'), ('TOYO', 'BIGA', 'b', 750, '2016-10-24'),
('APPL', 'JEBE', 's', 950, '2022-10-19'), ('APPL', 'BIGA', 'b', 950, '2022-10-19'),
('APPL', 'SABR', 's', 1200,'2022-10-20'), ('APPL', 'RASH', 'b', 1200,'2022-10-20'),
('GOOG', 'BRUN', 's', 300, '2022-10-21'), ('GOOG', 'RASH', 'b', 300, '2022-10-21'),
('GOOG', 'PETE', 's', 350, '2022-10-25'), ('GOOG', 'BRUN', 'b', 350, '2022-10-25'),
('MSFT', 'ELMU', 's', 430, '2022-10-26'), ('MSFT', 'ANTA', 'b', 430, '2022-10-26'),
('MSFT', 'JEBE', 's', 750, '2022-10-24'), ('MSFT', 'BIGA', 'b', 750, '2022-10-24'),
('APPL', 'ELMU', 's', 400, '2016-10-18'), ('APPL', 'ANTA', 'b', 400, '2016-10-18'),
('APPL', 'JEBE', 's', 950, '2016-10-19'), ('APPL', 'BIGA', 'b', 950, '2016-10-19'),
('APPL', 'SABR', 's', 1200,'2016-10-20'), ('APPL', 'RASH', 'b', 1200,'2016-10-20'),
('GOOG', 'ELMU', 's', 430, '2016-10-28'), ('GOOG', 'ANTA', 'b', 430, '2016-10-28'),
('GOOG', 'ELMU', 's', 430, '2016-10-28'), ('GOOG', 'ANTA', 'b', 430, '2016-10-28'),
('SOLB', 'ELMU', 's', 130, DATEADD(day, -1, CAST(GETDATE() AS date))), 
('SOLB', 'ANTA', 'b', 130, DATEADD(day, -1, CAST(GETDATE() AS date))),
('SOLB', 'ELMU', 's', 240, DATEADD(day, -1, CAST(GETDATE() AS date))), 
('SOLB', 'ANTA', 'b', 240, DATEADD(day, -1, CAST(GETDATE() AS date))),
('MSFT', 'JADA', 's', 300, CAST( GETDATE() AS Date )), ('MSFT', 'MARI', 'b', 300, CAST( GETDATE() AS Date )),
('MSFT', 'RASH', 's', 250, CAST( GETDATE() AS Date )), ('MSFT', 'FIRA', 'b', 250, CAST( GETDATE() AS Date )),
('MSFT', 'ANTA', 's', 260, CAST( GETDATE() AS Date )), ('MSFT', 'JADA', 'b', 260, CAST( GETDATE() AS Date )),
('MSFT', 'ELMU', 's', 370, DATEADD(day, -1, CAST(GETDATE() AS date))), ('MSFT', 'JADA', 'b', 370, DATEADD(day, -1, CAST(GETDATE() AS date)));

--select * from transactions;
Insert Into transactions(SSHID, BSHID, price_of_shares, volume_of_shares, date) values
('JADA', 'MARI', 190, 455, DATEADD(day, -1, CAST(GETDATE() AS date))), ('RASH', 'FIRA', 172, 250, CAST( GETDATE() AS Date )),
('FIRA', 'MARI', 128, 1000, CAST( GETDATE() AS Date )), ('RASH', 'AMJA', 200, 250, CAST( GETDATE() AS Date )), 
('JHON', 'MARI', 176, 500, CAST( GETDATE() AS Date )), ('JHON', 'FIRA', 181, 250, CAST( GETDATE() AS Date )), 
('PETE', 'AMJA', 192, 2000, CAST( GETDATE() AS Date )), ('JHON', 'AMJA', 170, 450, CAST( GETDATE() AS Date )),
('BRUN', 'RASH', 189, 300, '2016-10-10'), ('PETE', 'BRUN', 300, 250, '2016-10-11'),
('AMJA', 'NOOM', 155, 450, '2016-10-12'), ('PETE', 'FIRA', 167, 250, '2016-10-13'),
('RASH', 'AMJA', 165, 650, '2016-10-14'),
('LAMO', 'AMRK', 173, 400, '2016-10-25'),('SABR', 'ANTA', 184, 600, '2016-10-26'),
('DOTR', 'ELMU', 119, 350, '2016-10-17'),('ELMU', 'ANTA', 125, 400, '2016-10-18'),
('JEBE', 'BIGA', 253, 950, '2016-10-19'),('SABR', 'RASH', 276, 1200, '2016-10-20'),
('BRUN', 'RASH', 119, 300, '2016-10-21'),('PETE', 'BRUN', 125, 350, '2016-10-27'),
('ELMU', 'ANTA', 253, 750, '2016-10-28'),('JEBE', 'BIGA', 276, 430, '2016-10-24'),
('JEBE', 'BIGA', 253, 950, '2022-10-19'),('SABR', 'RASH', 276, 1200, '2022-10-20'),
('BRUN', 'RASH', 119, 300, '2022-10-21'),('PETE', 'BRUN', 125, 350, '2022-10-25'),
('ELMU', 'ANTA', 253, 750, '2022-10-26'),('JEBE', 'BIGA', 276, 430, '2022-10-24'),
('ELMU', 'ANTA', 125, 400, '2016-10-18'),('JEBE', 'BIGA', 253, 950, '2016-10-19'),
('SABR', 'RASH', 276, 1200, '2016-10-20'),
('ELMU', 'ANTA', 367, 430, '2016-10-28'),('ELMU', 'ANTA', 367, 430, '2016-10-28'),
('ELMU', 'ANTA', 137, 130, DATEADD(day, -1, CAST(GETDATE() AS date))),
('ELMU', 'ANTA', 67, 240, DATEADD(day, -1, CAST(GETDATE() AS date))),
('JADA', 'MARI', 190, 300, CAST( GETDATE() AS Date )),
('RASH', 'FIRA', 172, 250, CAST( GETDATE() AS Date )),
('ANTA', 'JADA', 190, 300, CAST( GETDATE() AS Date )),
('ELMU', 'JADA', 211, 250, CAST( GETDATE() AS Date ));

