#Ansible Instalation

docker run -it -h ubuntu-ansible -P -v C:/workspace/ansible:/mnt/test -v "//var/run/docker.sock:/var/run/docker.sock" -d ubuntu:latest

docker exec -it 514521 bash

# DOCKER IN DOCKER
apt-get update
apt-get install ca-certificates curl gnupg

install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
chmod a+r /etc/apt/keyrings/docker.gpg

echo \
 "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
 "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
 tee /etc/apt/sources.list.d/docker.list > /dev/null
  
apt-get update
apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

docker run hello-world

## DOCKER IN DOCKER

apt install -y iputils-ping
apt install telnet
apt install -y ansible


# the role is the primary mechanism for breaking a playbook into multiple files.
mkdir workspace
mkdir workspace/ansible-roles-projects
ansible-galaxy init dmc-project
ansible-playbook ansible-local.yml
# explicar conexion a local sin el uso del investory

#usando el inventory
mkdir -p /etc/ansible
cp /mnt/test/ansible-roles-projects/inventory/hosts /etc/ansible/hosts
ansible-playbook 2playbook-remote-inventory-servers.yml

ansible all -m ping
rm /etc/ansible/hosts
ansible all -m ping

#probar comando simple a todos los servidores del inventory
ansible servidores -m command -a “date”

# mostrar todo el detalle del nodo principal (local)
ansible localhost -m setup

#Desinstalando paquetes servers
sudo apt purge nginx nginx-common nginx-core

#automatizando la instalación en N servidores De NGINX
 ansible-playbook 3playbook-ngnix-installation-packages.yml

# DEMO:
# SE REQUIERE ACTUALIZAR CERTIFICADOS DIGITALES QUE PERMITEN LA CONEXIÓNA KAFKA
# YA QUE ESTOS SUELEN VENCER CADA AÑO Y POR SEGURIDAD NECESITA SER RENOVADO
# EN 100 NODDOS DE SPARK CADA AÑO
# LOS NUEVOS CERTIFICADOS SE ENCUENTRA EN /demo/new-certificates
# (TRUSTORE.JKS Y KEYSTORE.JKS) 
# RUTA ORIGINAL DE LOS CERTIFICADO : /demo/etc/spark/security
# ASIMISMO SE DEBE TENER UN BACKUP DE LOS ARCHIVOS EXISTENTES EN CASO DE FALLO.

# SIMULAR CERTIFICADOS EN LA RUTA
mkdir -p /mnt/test/etc/spark/security/
mkdir -p /mnt/test/etc/spark/security/new-certificates
cd /mnt/test/ansible-roles-projects/4demo-local-playbook

cp /mnt/test/ansible-roles-projects/4demo-local-playbook/demo/etc/spark/security/keystore.jks /mnt/test/etc/spark/security/
cp /mnt/test/ansible-roles-projects/4demo-local-playbook/demo/etc/spark/security/truststore.jks /mnt/test/etc/spark/security/

cp /mnt/test/ansible-roles-projects/4demo-local-playbook/demo/new-certificates/keystore.jks /mnt/test/etc/spark/security/new-certificates
cp /mnt/test/ansible-roles-projects/4demo-local-playbook/demo/new-certificates/truststore.jks /mnt/test/etc/spark/security/new-certificates


# VERBOSE
ansible-playbook 4demo-copy-digital-certificates-spark.yml -v

# ERROR SOLO EJECUTAR NUEVAMENTE
fatal: [localhost]: FAILED! => {"changed": false, "msg": "failed to copy: /mnt/test/etc/spark/security/truststore.jks to /mnt/test/etc/spark/security/backup/truststore.jks", "traceback": "Traceback (most recent call last):\n  File \"/tmp/ansible_ansible.legacy.copy_payload_k4893b1p/ansible_ansible.legacy.copy_payload.zip/ansible/modules/copy.py\", line 684, in main\n  File \"/tmp/ansible_ansible.legacy.copy_payload_k4893b1p/ansible_ansible.legacy.copy_payload.zip/ansible/module_utils/basic.py\", line 2468, in atomic_move\n    os.chmod(b_dest, DEFAULT_PERM & ~umask)\nFileNotFoundError: [Errno 2] No such file or directory: b'/mnt/test/etc/spark/security/backup/truststore.jks'\n"}
# ERROR SOLO EJECUTAR NUEVAMENTE

TAREA :
COMPLETAR LA DEMO, LOGRAR QUE SE COPIE LOS ARCHIVOS JKS A LA RUTA DESTINO