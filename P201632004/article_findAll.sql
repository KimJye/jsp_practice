﻿CREATE DEFINER=`root`@`localhost` PROCEDURE `article_findAll`(
  IN firstRecordIndex INT,
  IN pageSize INT,
  IN ss VARCHAR(10),
  IN st NVARCHAR(100),
  IN od VARCHAR(10)
)
BEGIN

SELECT a.*, u.name
FROM article a
  LEFT JOIN user u ON a.userId = u.id
WHERE 
  (ss = '0') OR
  (ss = '1' AND u.name LIKE st) OR
  (ss = '2' AND a.title LIKE st)
ORDER BY 
  CASE WHEN od = '0' THEN a.id 
       WHEN od = '1' THEN u.name
       WHEN od = '4' THEN a.title
  END,
  CASE WHEN od = '2' THEN u.name
	   WHEN od = '3' THEN a.no
  END DESC
LIMIT firstRecordIndex, pageSize;
  
END