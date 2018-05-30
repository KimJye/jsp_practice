CREATE DEFINER=`root`@`localhost` PROCEDURE `article_count`(
  IN ss VARCHAR(10),
  IN st NVARCHAR(100)
)
BEGIN

SELECT COUNT(a.id)
FROM article a 
  LEFT JOIN user u ON a.userId = u.id  
WHERE 
  (ss = '0') OR
  (ss = '1' AND u.name LIKE st) OR
  (ss = '2' AND a.title LIKE st);

END