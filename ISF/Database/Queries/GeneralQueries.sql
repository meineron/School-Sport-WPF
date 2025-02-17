Select t.TEAM_ID, c.CHAMPIONSHIP_NAME, t.REGISTRATION_DATE, cc.REGISTRATION_PRICE
From TEAMS t Inner Join CHAMPIONSHIPS c On t.CHAMPIONSHIP_ID=c.CHAMPIONSHIP_ID
Inner Join CHAMPIONSHIP_CATEGORIES cc On t.CHAMPIONSHIP_CATEGORY_ID=cc.CHAMPIONSHIP_CATEGORY_ID
Where c.SEASON=66 And CHARGE_ID Is Null And t.[STATUS]=2 And cc.REGISTRATION_PRICE>0
	And t.DATE_DELETED Is Null And c.DATE_DELETED Is Null And cc.DATE_DELETED Is Null
Order By t.REGISTRATION_DATE Desc

-----------------------------------------------

Select ch.CHAMPIONSHIP_NAME, t.TEAM_ID, s.SCHOOL_ID, s.SCHOOL_NAME, s.SYMBOL, t.[STATUS], c.CITY_NAME, chrg.PRICE
From SCHOOLS s Inner Join CITIES c On s.CITY_ID=c.CITY_ID
Inner Join TEAMS t On t.SCHOOL_ID=s.SCHOOL_ID
Inner Join CHAMPIONSHIPS ch On t.CHAMPIONSHIP_ID=ch.CHAMPIONSHIP_ID
Left Join CHARGES chrg On t.CHARGE_ID=chrg.CHARGE_ID
Where s.SCHOOL_NAME Like '%��� �����%' And ch.SEASON=66 And ch.IS_CLUBS=1 And 
	s.DATE_DELETED Is Null And c.DATE_DELETED Is Null And t.DATE_DELETED Is Null And ch.DATE_DELETED Is Null
Order By ch.SEASON Desc, ch.CHAMPIONSHIP_NAME Asc, t.TEAM_ID Asc

-----------------------------------------------

--total hits per day for given month
SELECT DAY(DATE_VISITED)AS TheDay , COUNT(*) As TheCount
FROM WEBSITE_HIT_LOG
WHERE YEAR(DATE_VISITED)=2006 AND MONTH(DATE_VISITED)=10
GROUP BY DAY(DATE_VISITED) ORDER BY TheDay
GO

--detailed hits for specific day
SELECT h.HIT_LOG_ID, v.IP_ADDRESS, h.PAGE_INDEX, h.DATE_VISITED, 
h.QUERY_STRING_DATE, h.FORM_DATA, h.REFERER, v.USER_AGENT
FROM WEBSITE_HIT_LOG h, WEBSITE_VISITORS v
WHERE h.VISITOR_ID=v.VISITOR_ID AND
YEAR(h.DATE_VISITED)=2006 AND
MONTH(h.DATE_VISITED)=12 AND
DAY(h.DATE_VISITED)=19
ORDER BY h.DATE_VISITED DESC
GO

--full visitor details for specific IP address
SELECT * FROM WEBSITE_VISITORS WHERE IP_ADDRESS='213.8.95.215'
GO

--full details for all visitors having specific browser
SELECT h.HIT_LOG_ID, v.IP_ADDRESS, v.USER_AGENT, 
h.PAGE_INDEX, h.DATE_VISITED, h.QUERY_STRING_DATE, 
h.FORM_DATA, h.REFERER
FROM WEBSITE_HIT_LOG h, WEBSITE_VISITORS v
WHERE h.VISITOR_ID=v.VISITOR_ID AND
CHARINDEX('MSIE', UPPER(v.USER_AGENT))=0 AND
CHARINDEX('googlebot', LOWER(v.USER_AGENT))=0
ORDER BY h.DATE_VISITED DESC
GO

--list of championship categories ordered by amount of games
SELECT CHAMPIONSHIP_CATEGORY_ID, COUNT(*) AS GamesCount
FROM CHAMPIONSHIP_MATCHES
GROUP BY CHAMPIONSHIP_CATEGORY_ID
ORDER BY COUNT(*) DESC
GO

select p.TEAM_ID, COUNT(p.PLAYER_ID) as PlayerCount from players p, teams t, championships c
where p.TEAM_ID=t.TEAM_ID and t.CHAMPIONSHIP_ID=c.CHAMPIONSHIP_ID and c.SEASON=59
group by p.TEAM_ID
order by PlayerCount desc
GO