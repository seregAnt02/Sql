#### Памятка о типичных ошибках и способах их исправления

* Эта памятка написана, чтобы помочь Вам самостоятельно находить ошибки в своих запросах. Если ваш запрос не принимается системой, то возвращайтесь на эту страничку и пройдитесь по всем пунктам:

1. Приведите синтаксис запроса к общепринятому:

если у вас есть время, стоит изучить руководство по стилю SQL https://www.sqlstyle.guide/ru/
можете отформатировать ваш запрос с помощью, например, https://codebeautify.org/sqlformatter
в любом случае, информации и примеров в курсе достаточно для того, чтобы писать запросы корректно.
2. Проверьте, что ключевые слова, названия столбцов и значения в ячейках, которые необходимо найти, написаны правильно. Особенно обратите внимание, чтобы в русских названиях столбцов не было английских букв.

3. Проверьте, что:

количество открывающихся скобок равно количеству закрывающихся;
запятые разделяют перечисление столбцов, но не ключевые слова;
запросы разделяются точкой с запятой.
4. Проверьте, что последовательность команд указана верно (она отличается от последовательности выполнения команд в запросе):

* SELECT 'столбцы или * для выбора всех столбцов; обязательно'

* FROM 'таблица; обязательно'

* WHERE 'условие/фильтрация, например, city = 'Moscow'; необязательно'

* GROUP BY 'столбец, по которому хотим сгруппировать данные; необязательно'

* HAVING 'условие/фильтрация на уровне сгруппированных данных; необязательно'

* ORDER BY 'столбец, по которому хотим отсортировать вывод; необязательно'
5.  Если запрос включает подзапросы, выполните сначала подзапросы и удостоверьтесь, что получаете ожидаемый результат.

6. Прочитайте комментарии под заданием: большинство трудностей уже обсуждалось не один раз.

#### Выборка всех данных из таблицы
Для того чтобы отобрать все данные из таблицы используется SQL запрос следующей структуры: 

* ключевое слово SELECT; 
* символ « *» ; 
* ключевое слово FROM; 
* имя таблицы.
Результатом является таблица, в которую включены все строки и столбцы указанной в запросе таблицы.

Пример:
Выбрать все записи таблицы book .
Запрос:
* SELECT * FROM book;

#### Выборка отдельных столбцов
Для того чтобы отобрать данные из определенных столбцов таблицы используется SQL запрос следующей структуры: 
* ключевое слово SELECT ; 
* список столбцов таблицы через запятую; 
* ключевое слово FROM ; 
* имя таблицы.
Результатом является таблица, в которую включены все данные из указанных после SELECT столбцов исходной таблицы.
Пример
Выбрать названия книг и их количества из таблицы book .
Запрос:
* SELECT title, amount FROM book;

#### Присвоение новых имен столбцам при формировании выборки
Для того чтобы отобрать данные из определенных столбцов таблицы и одновременно задать столбцам новые названия в результате выборки используется SQL запрос следующей структуры: 

* ключевое слово SELECT ; 
* имя столбца;
* ключевое слово AS ; 
* новое название столбца (можно русскими буквами), выводимое в результате запроса, но это должно быть одно слово,
  если название состоит из двух слов – соединяйте их подчеркиванием, например, Количество_книг; 
* запятая; 
* имя столбца; 
* .... 
* ключевое слово FROM ; 
* имя таблицы.
В одном запросе можно использовать и имена столбцов из таблицы, и новые названия.

Результатом является таблица, в которую включены все данные из указанных после SELECT столбцов исходной таблицы. Каждому столбцу в результате запроса присваивается новое имя, заданное после AS, или столбец получает имя столбца исходной таблицы, если AS отсутствует.
Пример
Выбрать все названия книг и их количества из таблицы book , для столбца title задать новое имя Название.
Запрос:
* SELECT title AS Название, amount 
* FROM book;

#### Выборка данных с созданием вычисляемого столбца
С помощью SQL запросов можно осуществлять вычисления по каждой строке таблицы с помощью вычисляемого столбца. Для него в списке полей после оператора SELECT указывается выражение и задается имя.

Выражение может включать имена столбцов, константы, знаки операций, встроенные функции.

Результатом является таблица, в которую включены все данные из указанных после SELECT столбцов, а также новый столбец, в каждой строке которого вычисляется заданное выражение.
Пример
Вывести всю информацию о книгах, а также для каждой позиции посчитать ее стоимость (произведение цены на количество). Вычисляемому столбцу дать имя total .
Запрос:
* SELECT title, author, price, amount, 
     price * amount AS total 
* FROM book;

#### Выборка данных, вычисляемые столбцы, логические функции
В SQL реализована возможность заносить в поле значение в зависимости от условия. Для этого используется функция IF():

IF(логическое_выражение, выражение_1, выражение_2)
Функция вычисляет логическое_выражение, если оно истина – в поле заносится значение выражения_1, в противном случае –  значение выражения_2. Все три параметра IF() являются обязательными.
Допускается использование вложенных функций, вместо выражения_1 или выражения_2 может стоять новая функция IF.
Пример 
Для каждой книги из таблицы book установим скидку следующим образом: если количество книг меньше 4, то скидка будет составлять 50% от цены, в противном случае 30%.
Запрос:
* SELECT title, amount, price, 
    IF(amount<4, price*0.5, price*0.7) AS sale
* FROM book;

##### Выборка данных по условию
С помощью запросов можно включать в итоговую выборку не все строки исходной таблицы, а только те, которые отвечают некоторому условию. Для этого после указания таблицы, откуда выбираются данные, задается ключевое слово WHERE и логическое выражение, от результата которого зависит будет ли включена строка в выборку или нет. Если условие – истина, то строка(запись)  включается в выборку, если ложь – нет.
Логическое выражение может включать операторы сравнения (равно «=», не равно «<>», больше «>», меньше «<», больше или равно«>=», меньше или равно «<=») и выражения, допустимые в SQL.
Пример
Вывести название и цену тех книг, цены которых меньше 600 рублей.
Запрос:
* SELECT title, price 
* FROM book
* WHERE price < 600;

#### Выборка данных, логические операции
 Логическое выражение после ключевого слова WHERE кроме операторов сравнения  и выражений может включать  логические операции (И «and», ИЛИ «or», НЕ «not») и круглые скобки, изменяющие приоритеты выполнения операций.
Приоритеты операций:

круглые скобки
умножение  (*),  деление (/)
сложение  (+), вычитание (-)
операторы сравнения (=, >, <, >=, <=, <>)
NOT
AND
OR

Пример
Вывести название, автора и цену тех книг, которые написал Булгаков, ценой больше 600 рублей
Запрос:
* SELECT title, author, price 
* FROM book
* WHERE price > 600 AND author = 'Булгаков М.А.';
  
#### Выборка данных, операторы BETWEEN, IN
 Логическое выражение после ключевого слова WHERE может включать операторы  BETWEEN и IN. Приоритет  у этих операторов такой же как у операторов сравнения, то есть они выполняются раньше, чем NOT, AND, OR.
Оператор BETWEEN позволяет отобрать данные, относящиеся к некоторому интервалу, включая его границы.
Пример
Выбрать названия и количества тех книг, количество которых от 5 до 14 включительно.
Запрос:
* SELECT title, amount 
* FROM book
* WHERE amount BETWEEN 5 AND 14;

#### Выборка данных с сортировкой
При выборке можно указывать столбец или несколько столбцов, по которым необходимо отсортировать отобранные строки. Для этого используются ключевые слова ORDER BY, после которых задаются имена столбцов. При этом строки сортируются по первому столбцу, если указан второй столбец, сортировка осуществляется только для тех строк, у которых значения первого столбца одинаковы. По умолчанию ORDER BY выполняет сортировку по возрастанию. Чтобы управлять направлением сортировки вручную, после имени столбца указывается ключевое слово ASC (по возрастанию) или DESC (по убыванию). 

Столбцы после ключевого слова ORDER BY можно задавать:
* названием столбца;
* номером столбца;
* именем столбца (указанным после AS).
  
Пример
Вывести название, автора и цены книг. Информацию  отсортировать по названиям книг в алфавитном порядке.
Запрос:
* SELECT title, author, price
* FROM book
* ORDER BY title;

#### Выборка данных, оператор LIKE
Оператор LIKE используется для сравнения строк. В отличие от операторов отношения равно (=) и не равно (<>), LIKE позволяет сравнивать строки не на полное совпадение (не совпадение), а в соответствии с шаблоном. Шаблон может включать обычные символы и символы-шаблоны. При сравнении с шаблоном, его обычные символы должны в точности совпадать с символами, указанными в строке. Символы-шаблоны могут совпадать с произвольными элементами символьной строки.

| Символ-шаблон |               Описание                             |                   Пример                    |
|---------------|----------------------------------------------------|---------------------------------------------|
|         %     |   Любая строка, содержащая ноль или более символов | SELECT * FROM book WHERE author LIKE '%М.%' |
|               |                                                    |     выполняет поиск и выдает все книги,     |
|               |                                                    |   инициалы авторов которых содержат «М.»    |
|               |                                                    |                                             |
|         _     |                                                    | SELECT * FROM book WHERE title LIKE 'Поэм_' |
| (подчерки     |         Любой одиночный символ                     |     выполняет поиск и выдает все книги,     |
|       вание)  |                                                    |     названия которых либо «Поэма»,          |
|               |                                                    |     либо «Поэмы» и пр.                      |

Пример
Вывести названия книг, начинающихся с буквы «Б».
Запрос:

* SELECT title 
* FROM book
* WHERE title LIKE 'Б%';
/* эквивалентное условие 
title LIKE 'б%'
*/
##### Вывод информаций базы данных.
select TABLE_SCHEMA, TABLE_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH  from information_schema.columns where table_name = 'users' AND table_schema = 'db_vera';
