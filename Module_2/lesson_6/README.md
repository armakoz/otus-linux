>1) реализовать knocking port
>- centralRouter может попасть на ssh inetrRouter через knock скрипт
>пример в материалах

Реализацию взял с арчвики. 
Скрипт knock.sh нужно выполнить перед поюключением по ssh. Расположен в /vagrant/knock.sh


![knock](https://github.com/armakoz/otus-linux/blob/master/images/knocking.png)

>2) добавить inetRouter2, который виден(маршрутизируется) с хоста
>3) запустить nginx на centralServer
>4) пробросить 80й порт на inetRouter2 8080
>5) дефолт в инет оставить через inetRouter

Перед разворачивание вписать свой интерфейс

:public => { :adapter => 2, :bridge => "enp1s0" }

После разворачивания вписать в скрипт iptables-nat.sh адрес полученного интерфейса и выполнить его на вм inetRouter2.

Проверка в браузере ext_ip:8080

![nginx-nat](https://github.com/armakoz/otus-linux/blob/master/images/nginx-nat.png)