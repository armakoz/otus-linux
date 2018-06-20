

В качестве отчета прилагаю файл зоны и скрины результата работы 

>web1 - смотрит на клиент1
>web2 смотрит на клиент2

![web1](https://github.com/armakoz/otus-linux/blob/master/images/web1_dns.png)
![web2](https://github.com/armakoz/otus-linux/blob/master/images/web2_dns.png)

>настроить split-dns
>клиент1 - видит обе зоны, но в зоне dns.lab только web1

![client_dns](https://github.com/armakoz/otus-linux/blob/master/images/client_dns.png)

>клиент2 видит только dns.lab

![client2_dns](https://github.com/armakoz/otus-linux/blob/master/images/client2_dns.png)

>завести еще одну зону newdns.lab
>завести в ней запись
>www - смотрит на обоих клиентов

![www](https://github.com/armakoz/otus-linux/blob/master/images/www_dns.png)
