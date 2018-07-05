#! /bin/sh

curl -L -O jboss-eap-6.4.0.zip https://access.cdn.redhat.com/content/origin/files/sha256/27/27a6fd62a8bc4f660970ab282a4bc013934275e47a850a974db6c7d2c62cc50e/jboss-eap-6.4.0.zip?_auth_=1530776720_21f28034f0a6acb0de6d728f7121b48f 
#git clone https://github.com/EdwinPhilip/jboss_zip.git
echo "Installation........................"
mkdir EAP_6.4
unzip -d EAP_6.4 -o jboss-eap-6.4.0.zip
sudo useradd -s /usr/sbin/nologin jboss-EAP

echo "Registrating EAP as service..."

   EAP_DIR="/home/student/jboss/EAP_6.4/jboss-eap-6.4"
  EAP_SERVICE="/home/student/jboss/EAP_6.4/jboss-eap-6.4/log"
 sudo mkdir $EAP_SERVICE
echo 'export JBOSS_HOME="/home/student/jboss/EAP_6.4/jboss-eap-6.4"' >> ~/.bashrc

sudo cp jboss.service /etc/systemd/system/
sudo chown -R jboss-EAP:jboss-EAP EAP_6.4
sudo chown -R jboss-EAP:jboss-EAP EAP_6.4/

sudo rm -rf jboss-eap-6.4.0.zip
sudo systemctl stop jboss.service
sudo systemctl daemon-reload
sudo systemctl enable jboss.service

sudo systemctl start jboss.service

echo "Done"
