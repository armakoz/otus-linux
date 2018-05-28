> 1) создать свой RPM (можно взять свое приложение, либо > >собрать к примеру апач с определенными опциями)

В качестве приложения выбрал Midnight Commander.

```
wget http://ftp.midnight-commander.org/mc-4.6.1.tar.gz
gzip -d < mc-4.6.1.tar.gz | tar xvf - 
sudo yum install rpmdevtools rpm-build
rpmdev-setuptree
cp mc-4.6.1.tar.gz ~/rpmbuild/SOURCES/
cp mc-4.6.1/mc.spec ~/rpmbuild/SPECS/
sudo yum install glib-devel slang-devel
rpmbuild -bb SPECS/mc.spec
```
По итогу rpm находится в папке ЫЩГКСУЫ

```
[vagrant@otuslinux ~]$ ls -l rpmbuild/RPMS/x86_64/
total 1396
-rw-rw-r--. 1 vagrant vagrant 1420256 May 28 13:21 mc-4.6.1-1.x86_64.rpm
-rw-rw-r--. 1 vagrant vagrant    5804 May 28 13:21 mc-debuginfo-4.6.1-1.x86_64.rpm
```
>2) создать свой репо и разместить там свой RPM
>реализовать это все либо в вагранте, либо развернуть у себя >через nginx и дать ссылку на репо 

```
sudo yum install createrepo -y
mkdir -p /myrepo
sudo mkdir -p /myrepo
cp rpmbuild/RPMS/x86_64/mc-4.6.1-1.x86_64.rpm /myrepo/
sudo cp rpmbuild/RPMS/x86_64/mc-4.6.1-1.x86_64.rpm /myrepo/
sudo createrepo /myrepo/
sudo createrepo --update /myrepo/
vi /etc/yum.repos.d/myrepo.repo
sudo yum install yum-priorities
sudo rm -rf /var/cache/yum/*
sudo yum clean all
sudo yum repolist
sudo yum install mc
```

[myrepo](https://github.com/armakoz/otus-linux/blob/master/images/myrepo.png)