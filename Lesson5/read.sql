
/*1. Найти количество сообщений, отправленных каждым пользователей.
В зависимости от количества отправленных сообщений рассчитать ранг пользователей, первое место присвоив пользователю(ям) с наибольшим количеством отправленных сообщений.
Вывести полученный ранг, имя, фамилия, пользователя и кол-во отправленных сообщений. Выводимый список необходимо отсортировать в порядке возрастания ранга.*/
 SELECT 
	DENSE_RANK() OVER (ORDER BY COUNT(from_user_id) DESC) AS 'rank_message',
    firstname AS 'firstname',
    lastname AS 'lastname',
	COUNT(from_user_id) AS 'cnt'
FROM users u
LEFT JOIN messages m ON u.id = m.from_user_id 
GROUP BY u.id;
  
