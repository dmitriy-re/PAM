#!/bin/bash
yum update -y
yum install epel-release -y
sed -i 's/^PasswordAuthentication.*$/PasswordAuthentication yes/' /etc/ssh/sshd_config && systemctl restart sshd.service
groupadd admin
useradd test
echo "test" | sudo passwd --stdin test
usermod -aG admin test
useradd test1
echo "test1" | sudo passwd --stdin test1

echo "login;*;!admin;!Wd0000-2400" >> /etc/security/time.conf
#echo "account    required     pam_time.so" >> /etc/pam.d/sshd
sed '8i\account    required     pam_time.so' /etc/pam.d/sshd > /etc/pam.d/sshd_1
rm -f /etc/pam.d/sshd
mv /etc/pam.d/sshd_1 /etc/pam.d/sshd
