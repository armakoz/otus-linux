# Отчет по ДЗ №6

>1. Написать сервис, который будет раз в 30 секунд мониторить лог на предмет >наличия ключевого слова. Файл и слово должны задаваться в /etc/sysconfig

Для сервиса используется скрипт:

```bash
  FOUND=`fgrep -c $2 $1`
  if [ $FOUND -eq 0 ]; then
    echo "====WORD NOT FOUND!!!!===="
  else
    echo "==== WORD FOUND!!!!====="
  fi
```

Для systemd в /lib/systemd/system был создан .service и .timer для запуска скрипта каждые 30 сек.

```
[Unit]
Description=check_log

[Service]
Type=oneshot
EnvironmentFile=/etc/sysconfig/check_word_in_log
ExecStart=/bin/bash /check_log.sh $OPT
PrivateTmp=true

[Install]
WantedBy=multi-user.target
```
Таймер:

```
[Unit]
Description=Timer for how often to execute script

[Timer]
OnUnitInactiveSec=30s

[Install]
Also=check_word_in_log.service
```

Таймер включается командой **systemctl enable --now check_word_in_log.timer**


Результатом работы является сообщения в journalctl о найденои или не найденом слове в конкретном логе (параметры задаются в специальном файле)

![result_1](https://github.com/armakoz/otus-linux/blob/master/images/result_1.png)



>2. Из epel установить spawn-fcgi и переписать init-скрипт на unit-файл. Имя >сервиса должно так же называться.

Скрипт запуска расположен в /etc/init.d/spawn-fcgi. На основании его были созданы:

* 1) Файл конфигурации в /etc/sysconfig/spawn-fcgi
* 
```
# You must set some working options before the "spawn-fcgi" service will work.
# If SOCKET points to a file, then this file is cleaned up by the init script.
#
# See spawn-fcgi(1) for all possible options.
#
# Example :
#SOCKET=/var/run/php-fcgi.sock
OPTIONS="-a 127.0.0.1 -p 9001 -P /var/run/spawn-fcgi.pid -f /var/log/test"
```
* 2) Файл юнита в /lib/systemd/system/spawn-fcgi.service
* 
```

[Unit]
Description=spawn-dcgi service

[Service]
Type=simple
PIDFile=/run/spawn-fcgi.pid
EnvironmentFile=/etc/sysconfig/spawn-fcgi
ExecStart=/usr/bin/spawn-fcgi $OPTIONS
ExecStop=/bin/kill $MAINPID
KillSignal=SIGCONT
PrivateTmp=true

[Install]
WantedBy=multi-user.target
```

>3. Дополнить юнит-файл apache httpd возможностьб запустить несколько >инстансов сервера с разными конфигами



>4*. Скачать демо-версию Atlassian Jira и переписать основной скрипт запуска >на unit-файл

Создан файл /lib/systemd/system/jira.service

```
[Unit] 
Description=Jira
After=network.target

[Service] 
Type=simple
PIDFile=/opt/atlassian/jira/work/catalina.pid
ExecStart=/opt/atlassian/jira/bin/start-jira.sh
ExecStop=/opt/atlassian/jira/bin/stop-jira.sh

[Install] 
WantedBy=multi-user.target
```

![jira](https://github.com/armakoz/otus-linux/blob/master/images/jira.png?raw=true)