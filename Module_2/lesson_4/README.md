> 1. Поднять OSPF между машинами на базе Quagga

В качестве отчета прилагаю tracepath до противополжных интерфейсов, так же конфиги, вывод ip a.

![tracepath_router1](https://github.com/armakoz/otus-linux/blob/master/images/tracepath_router1.png)

![tracepath_router2](https://github.com/armakoz/otus-linux/blob/master/images/tracepath_router2.png)

![tracepath_router3](https://github.com/armakoz/otus-linux/blob/master/images/tracepath_router3.png)

> 2. Изобразить ассиметричный роутинг

В качестве отчета скрины tracepath.

![r1-r3_assync1](https://github.com/armakoz/otus-linux/blob/master/images/r1-r3_assync1.png)

![r1-r3_assync2](https://github.com/armakoz/otus-linux/blob/master/images/r1-r3_assync2.png)

> 3. Сделать один из линков "дорогим", но что бы при этом роутинг был симметричным

Чтобы сделать симметричный роутинг увеличил цену интерфейса 192.168.20.2 на 3 роутере

![r1-r3_sync1](https://github.com/armakoz/otus-linux/blob/master/images/r1-r3_sync1.png)

![r1-r3_sync2](https://github.com/armakoz/otus-linux/blob/master/images/r1-r3_sync2.png)