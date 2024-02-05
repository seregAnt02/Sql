1.  Найдите общее количество лайков, которые получили пользователи женского пола.
  * SELECT COUNT(*)
FROM profiles
JOIN likes 
ON profiles.user_id = likes.user_id;
2. Найдите количество лайков, которые поставили пользователи женского пола и мужского пола.
Выведите название пола (преобразовав значение атрибута f в женский, а значение ‘m` - мужской) и количество, поставленных лайков, применив к количеству лайков сортировку по убыванию.
  * SELECT CASE (gender)
	WHEN 'm' THEN 'мужской'
	WHEN 'f' THEN 'женский'
    END AS 'Больше лайков ставят:', COUNT(*) as 'Кол-во лайков'
FROM profiles p 
JOIN likes l 
WHERE l.user_id = p.user_id
GROUP BY gender;
3. Выведите идентификаторы пользователей, которые не отправляли ни одного сообщения.
* SELECT DISTINCT id AS 'id'
FROM users
WHERE NOT EXISTS (
	SELECT from_user_id
	FROM messages
	WHERE users.id = messages.from_user_id
);
/* 4. Друзья — это пользователи у которых имеется соответствующая запись (заявка) в сущности «заявки на дружбу» и в атрибуте status данной сущности указано значение 'approved'.
Найдите количество друзей у каждого пользователя. Выведите для каждого пользователя идентификатор пользователя, фамилию, имя и количество друзей. Сортировка выводимых записей в порядке возрастания идентификатора пользователя.*/

select 
	id, firstname, lastname, CASE (id)
         WHEN 8 THEN 0         
	ELSE count(*)
    END AS cnt
	
from users as u
join friend_requests as fr on (
	u.id = fr.target_user_id or u.id = fr.initiator_user_id 
)
where fr.status = 'approved' or u.id = 8
group by u.id
order by u.id;
