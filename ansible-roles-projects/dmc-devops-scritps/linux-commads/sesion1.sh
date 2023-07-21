

comandos sesions  1 :
docker run -it centos:latest bash
	yum update
	cat /etc/os-release
	sed -i -e "s|mirrorlist=|#mirrorlist=|g" /etc/yum.repos.d/CentOS-*
	sed -i -e "s|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g" /etc/yum.repos.d/CentOS-*
	yum update
	
docker run -it alpine:latest bash
docker run -it alpine:latest /bin/sh
	apk update
	apk add htop
	apk info



ls
ls --help|
cat /etc/os-release

/BOOT AWX COMANDS
ls /boot

/BOOT docker HDFS 
ls /boot
ls /boot/grub

/TMP docker HDFS 
ls /tmp/hive/hive.log

/HOME
[root@sandbox-hdp /]# ls -l /home/
ubuntu@ip-172-31-1-56:~$ ls -l /home

/BIN
sudo apt install tree
sudo apt install vim
ls -l /bin
ls /bin/tree
ls /sbin/tree no aparece porque el sistema define donde debe estar por privilegio

/USR ubuntu o docker
sudo apt install nginx
find / -name "nginx"

/DEV docker HDFS 
ls -l /dev
echo 1 > /dev/tty

/PROC ubuntu o docker
ls -l /proc
sleep 200
[1] 3690
ls -l /proc/3690

/ETC UBUNTU
sudo apt install nginx

sudo service nginx start
sudo service nginx status
sudo service nginx stop
sudo service nginx restart

systemctl status nginx
systemctl start nginx

ls -l /etc/nginx
cat /etc/nginx/nginx.conf

/ETC CLOUDERA


TIPO DE ARCHIVOS
PIPE
mkfifo pipe1
ls -al pipe1 (pesa 0 bytes)
tail -f pipe1

abrir otra terminal
echo "hello" >> pipe1
echo "hello2" >> pipe1
ls -al pipe1 (sigue pesando 0 bytes)

TIPO DE ARCHIVOS
touch hola
touch x.csv


SOFTLINK
touch soft.txt
echo "hola mundo soft" >> soft.txt
cat soft.txt
ln -s soft.txt symbolicPathSoft.txt
ls -l /
echo "hola mundo soft" >> soft.txt
echo "hola mundo soft" >> symbolicPathSoft.txt
cat symbolicPathSoft.txt
cat soft.txt

HARDLINK 

touch soft.txt
echo "hola mundo hard" >> hard.txt
cat hard.txt
ln hard.txt hardlink.txt
ls -l /
echo "hola mundo hard" >> hard.txt
echo "hola mundo hard" >> hardlink.txt
cat hard.txt
cat hardlink.txt

CREAR ARCHIVO CARPETA 
mkdir workspace
mkdir workspace/datalake
mkdir workspace/datalake/bronze
mkdir workspace/datalake/silver
mkdir workspace/datalake/golden

tree

mkdir workspace/datalake/bronze/test/landing ERROR
mkdir -p workspace/datalake/bronze/test/landing
touch workspace/datalake/bronze/test/landing/hola.txt


LEER CONTENIDO
ls /usr/bin/ >> contenido.txt
more contenido.txt
less contenido.txt



