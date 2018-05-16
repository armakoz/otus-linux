#Отчет по ДЗ №6

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

Таймер включается командой **enable --now check_word_in_log.timer**
