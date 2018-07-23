

>1. Запретить всем пользователям, кроме группы admin логин в выходные и праздничные дни

- Создал пользователя usr_adm (входящий в группу admin) и user_noadm(не входящий в группу admin).
- Поместил скрипт проверки в /etc
- Выставил выходной день 
- Сделал su

Результат:

![date](https://github.com/armakoz/otus-linux/blob/master/images/date.png)
![user_auth](https://github.com/armakoz/otus-linux/blob/master/images/user_auth.png)

>2. Дать конкретному пользователю права рута

Реализация с помощью модуля pam_cap.so
Для выдачи пользователю прав в /etc/security/capability.conf добавил:
```
cap_sys_admin   admin
```

И подключил модуль pam_cap.so в /etc/pam.d/su

```
auth            optional        pam_cap.so
```

Результатом является выдача прав cap_sys_admin юзеру admin:

![cap_admin](https://github.com/armakoz/otus-linux/blob/master/images/cap_admin.png)
