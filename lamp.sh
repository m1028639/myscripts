MYSQL_PASS="YOUR_PASSWORD_HERE";

echo "+Updating apt-get..."
apt-get update

echo "+Installing SSH..."
apt-get install -q -y ssh

echo "+Changing default SSH port..."
sed -i 's/Port 22/Port 28/' /etc/ssh/sshd_config
/etc/init.d/ssh restart

echo "+Installing Apache2..."
apt-get install -q -y apache2
sed -i 's/ServerTokens Full/ServerTokens Prod/' /etc/apache2/conf.d/security
sed -i 's/ServerSignature On/ServerSignature Off/' /etc/apache2/conf.d/security
sed -i 's/TraceEnable On/TraceEnable Off/' /etc/apache2/conf.d/security
/etc/init.d/apache2 reload
a2enmod rewrite
/etc/init.d/apache2 restart

echo "+Installing PHP5..."
apt-get install -q -y php5
echo "+Securing PHP.ini file..."
sed -i 's/disable_functions =/disable_functions = show_source, system, exec/' /etc/php5/apache2/php.ini
sed -i 's/expose_php = On/expose_php = Off/' /etc/php5/apache2/php.ini
sed -i 's/display_errors = On/display_errors = Off/' /etc/php5/apache2/php.ini
sed -i 's/log_errors = Off/log_errors = On/' /etc/php5/apache2/php.ini
sed -i 's/allow_url_fopen = On/allow_url_fopen = Off/' /etc/php5/apache2/php.ini

echo "+Installing MySQL Server..."
DEBIAN_FRONTEND='noninteractive' apt-get install -q -y mysql-server
mysqladmin -u root password $MYSQL_PASS
apt-get install -q -y php5-mysql
mysql_secure_installation

history -c

echo "+Installation Completed!"
