
**Для реализации использовал чистый диск, новая VG, LV**

1) Проинициализировал PV с отступом pvcreate  **--bootloaderareasize 1m**  /dev/sdb

2) Создал новую VG, LV, ФС на xfs, примонтировал новую LV  в /mnt

3) Перенес файлы со старой ЛВ на новую: xfsdump -l 0 -f /root_dump / && xfsrestore -f /root_dump /mnt

4) Перенес ядро (vmlinuz*) из старого бут,  в корень нового раздела (/mnt). chroot в новый раздел, заранее смонтировав /proc/ /sys/ /dev/ /run/

5) Перенести ядро в boot новой LV.

6) Добавил репо `yum-config-manager`  `--add-repo [https://yum.rumyantsev.com/centos/7/x86_64/](https://yum.rumyantsev.com/centos/7/x86_64/) и сделать реинстал груба: yum reinstall --nogpgcheck grub2 (проверить, что пакет из новоог репо)`

7) Установил граб grub2-install /dev/sdb, поправил параметры lv в /etc/default/grub, сделал новый конфиг grub2-mkconfig -o /boot/grub2/grub.cfg, провери , что в grub.cfg у параметра root путь до новой lv. Сгенерировал новый инитрд dracut -v -f, поправил в fstab.

Сделал ребут и выбрал новый диск в качестве загрузочного.