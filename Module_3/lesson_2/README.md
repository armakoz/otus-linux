

>1. Запретить всем пользователям, кроме группы admin логин в выходные и праздничные дни

- Создал пользователя usr_adm (входящий в группу admin) и user_noadm(не входящий в группу admin).
- Поместил скрипт проверки в /etc
- Выставил выходной день 
- Сделал su

Результат:

![date](https://github.com/armakoz/otus-linux/blob/master/images/date.png)
![user_auth](https://github.com/armakoz/otus-linux/blob/master/images/user_auth.png)