>в Office1 в тестовой подсети появляется сервера с доп интерфесами и адресами
>во internal сети testLAN
>- testClient1 - 10.10.10.254
>- testClient2 - 10.10.10.254
>- testServer1- 10.10.10.1
>- testServer2- 10.10.10.1
>
>равести вланами
>testClient1 <-> testServer1
>testClient2 <-> testServer2

Приложен скрипт vlan_settings.sh, который при разворачивании настраивает вланы.
Настроен доступ по ключу

![ssh](https://github.com/armakoz/otus-linux/blob/master/images/ssh_access.png)