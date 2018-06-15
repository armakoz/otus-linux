>1. Между двумя виртуалками поднять vpn в режимах
>- tun
>- tap
>
>Прочуствовать разницу.

### Туннель
Для тестирования использовал вм из стенда office1Server(192.168.2.194) и centralServer (192.168.0.2).

```
[root@centralServer ~]# ip tunnel add tun0 mode ipip local 192.168.0.2 remote 192.168.2.194
[root@centralServer ~]# ip address add dev tun0 10.10.1.1 peer 10.10.1.2/32
[root@centralServer ~]# ip link set dev tun0 up

[root@office1Server ~]# ip tunnel add tun0 mode ipip local 192.168.2.194 remote 192.168.0.2
[root@office1Server ~]# ip address add dev tun0 10.10.1.2 peer 10.10.1.1/32
[root@office1Server ~]# ip link set dev tun0 up
```

Пинг в обе стороны проходит
```
[root@office1Server ~]# ping 10.10.1.1
PING 10.10.1.1 (10.10.1.1) 56(84) bytes of data.
64 bytes from 10.10.1.1: icmp_seq=1 ttl=64 time=2.03 ms
64 bytes from 10.10.1.1: icmp_seq=2 ttl=64 time=2.15 ms
64 bytes from 10.10.1.1: icmp_seq=3 ttl=64 time=2.15 ms

[root@centralServer ~]# ping 10.10.1.2
PING 10.10.1.2 (10.10.1.2) 56(84) bytes of data.
64 bytes from 10.10.1.2: icmp_seq=1 ttl=64 time=0.886 ms
64 bytes from 10.10.1.2: icmp_seq=2 ttl=64 time=2.18 ms
64 bytes from 10.10.1.2: icmp_seq=3 ttl=64 time=2.22 ms
^C
```
### Мост

Для тренировки использовал вм office1Router 

```
ip link add name br0 type bridge
ip link set br0 up
ip link set eth5 master bridge_name
bridge link
```
Тсп дампом удостоверился, что связь не прервалась

```
[root@office1Router ~]# tcpdump -i br0
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on br0, link-type EN10MB (Ethernet), capture size 262144 bytes
14:19:52.289906 IP 192.168.2.194 > office1Router: ICMP echo request, id 3105, seq 1, length 64
14:19:52.289951 IP office1Router > 192.168.2.194: ICMP echo reply, id 3105, seq 1, length 64
14:19:53.295499 IP 192.168.2.194 > office1Router: ICMP echo request, id 3105, seq 2, length 64
14:19:53.295558 IP office1Router > 192.168.2.194: ICMP echo reply, id 3105, seq 2, length 64
14:19:54.300022 IP 192.168.2.194 > office1Router: ICMP echo request, id 3105, seq 3, length 64
14:19:54.300087 IP office1Router > 192.168.2.194: ICMP echo reply, id 3105, seq 3, length 64
14:19:55.311056 IP 192.168.2.194 > office1Router: ICMP echo request, id 3105, seq 4, length 64
14:19:55.311113 IP office1Router > 192.168.2.194: ICMP echo reply, id 3105, seq 4, length 64
```
>2. Поднять RAS на базе OpenVPN с клиентскими сертификатами, подключиться с локальной машины на виртуалку

Развернул отдельную виртуалку не из стенда. В качестве отчета прилагаю history лог, конфигурацию сервера и скрины успешного захода с локальный машины по впн.

![vpn_connect](https://github.com/armakoz/otus-linux/blob/master/images/vpn_connect.png)

![vpn_status](https://github.com/armakoz/otus-linux/blob/master/images/vpn_status.png)