#!/bin/bash
cd /home/vagrant
sudo git clone https://github.com/danparizher/Pax-Academia.git
cd Pax-Academia
sudo python3.11 -m venv venv
source venv/bin/activate
sudo chown -R vagrant:vagrant /home/vagrant/venv
pip install -r requirements.txt
deactivate
cp /home/vagrant/Pax-var/database/database.sqlite /home/vagrant/Pax-Academia/database/database.sqlite
cp /home/vagrant/Pax-var/env/.env /home/vagrant/Pax-Academia/.env
cp /home/vagrant/Pax-var/start.sh /home/vagrant/start.sh
cd /home/vagrant
tr -d '\r' < start.sh > start_unix.sh
mv start_unix.sh start.sh
chmod +x start.sh
