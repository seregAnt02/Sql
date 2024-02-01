
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

/*2. Получите список сообщений, отсортированных по возрастанию даты отправки.
Вычислите разность между соседними значениями дат отправки. Разности выразите в минутах.
Выведите идентификатор сообщения, дату отправки, дату отправки следующего сообщения и разницу даты отправки соседних сообщений.*/
* SELECT id, created_at, 
 LEAD(created_at) OVER() AS lead_time,
 timestampdiff(minute, created_at, LEAD(created_at) OVER()) AS minute_lead_diff
FROM messages;


* select id, created_at, 
    timestampdiff(minute,(select created_at from messages t2
        where t2.id < t1.id order by t2.id desc limit 1), created_at) as diff
from messages t1

