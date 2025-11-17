#! /bin/bash
sudo yum update -y
sudo yum clean metadata
sudo yum install -y mariadb105
sudo mysql -V
sudo yum install -y telnet 