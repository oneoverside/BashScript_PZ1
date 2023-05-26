sudo apt-get update
sudo apt-get install apache2
sudo systemctl status apache2
sudo systemctl start apache2
sudo systemctl enable apache2
sudo nano /etc/apache2/sites-available/000-default.conf
sudo a2enmod cgi
sudo systemctl restart apache2
sudo mv script_endpoint.sh /usr/lib/cgi-bin/
sudo chmod +x /usr/lib/cgi-bin/script_endpoint.sh