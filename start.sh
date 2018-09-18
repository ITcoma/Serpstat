#!/bin/bash

#Установка иструмента ansible
/bin/yum install -y epel-release ansible

sleep 2

#Прокидываю ключи
for i in `cat servers_test`;
do
/bin/sshpass -p mypass  /bin/ssh-copy-id -i ~/.ssh/id_rsa.pub -o StrictHostKeyChecking=no -p 2244  hapito@$i
done

sleep 2

#Автоматизация развертывания
/bin/ansible-playbook -i invertory/hosts.ini servers.yml -b -v
