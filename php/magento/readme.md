# PHP

## mage2TV

todo

## installation on Ubuntu 18.04.2 LTS example

copied from [here](https://websiteforstudents.com/install-magento-2-using-composer-on-ubuntu-16-04-18-04-with-apache2-mariadb-and-php-7-1-support/)

### Step 1: Install Apache2 HTTP Server on Ubuntu

Apache2 HTTP Server is the most popular web server in use… so install it since Magento 2 needs it..

To install Apache2 HTTP on Ubuntu server, run the commands below…

```
sudo apt update
sudo apt install apache2
```

After installing Apache2, the commands below can be used to stop, start and enable Apache2 service to always start up with the server boots.

```
sudo systemctl stop apache2.service
sudo systemctl start apache2.service
sudo systemctl enable apache2.service
```

To test Apache2 setup, open your browser and browse to the server hostname or IP address and you should see Apache2 default test page as shown below.. When you see that, then Apache2 is working as expected..

```
http://localhost
```

### Step 2: Install MariaDB Database Server

MariaDB database server is a great place to start when looking at open source database servers to use with Magento… To install MariaDB run the commands below…

```
sudo apt-get install mariadb-server mariadb-client
```

After installing MariaDB, the commands below can be used to stop, start and enable MariaDB service to always start up when the server boots..

```
sudo systemctl stop mysql.service
sudo systemctl start mysql.service
sudo systemctl enable mysql.service
```

After that, run the commands below to secure MariaDB server by creating a root password and disallowing remote root access.

```
sudo mysql_secure_installation
```

When prompted, answer the questions below by following the guide.

+ Enter current password for root (enter for none): just press the **Enter**
+ Set root password: **Y**
+ New password: **Enter password**
+ Re-enter new password: **Repear password**
+ Remove anonymous users?: **Y**
+ Disallow root login remotely?: **Y**
+ Remove test database and access to it?: **Y**
+ Reload privilege tables now?: **Y**

Restart MariaDB server

To test if MariaDB is installed, type the commands below to logon to MariaDB server

```
sudo mysql -u root -p
```

Then type the password you created above to sign on… if successful, you should see MariaDB welcome message

### Step 3: Install PHP 7.1 and Related Modules

PHP 7.1 may not be available in Ubuntu default repositories… in order to install it, you will have to get it from third-party repositories.

Run the commands below to add the below third party repository to upgrade to PHP 7.1

```
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:ondrej/php
```

Then update and upgrade to PHP 7.1

```
sudo apt update
```

Next, run the commands below to install PHP 7.1 and related modules.

```
sudo apt install php7.1 libapache2-mod-php7.1 php7.1-common php7.1-gmp php7.1-curl php7.1-soap php7.1-bcmath php7.1-intl php7.1-mbstring php7.1-xmlrpc php7.1-mcrypt php7.1-mysql php7.1-gd php7.1-xml php7.1-cli php7.1-zip
```

After installing PHP 7.1, run the commands below to open PHP default config file for Apache2…

```
sudo nano /etc/php/7.1/apache2/php.ini
```

Then make the changes on the following lines below in the file and save. The value below are great settings to apply in your environments.

```
file_uploads = On
allow_url_fopen = On
short_open_tag = On
memory_limit = 256M
upload_max_filesize = 100M
max_execution_time = 360
date.timezone = America/Chicago
```

After making the change above, save the file and close out.

### Step 3: Restart Apache2

After installing PHP and related modules, all you have to do is restart Apache2 to reload PHP configurations…

To restart Apache2, run the commands below

```
sudo systemctl restart apache2.service
```

To test PHP 7.1 settings with Apache2, create a phpinfo.php file in Apache2 root directory by running the commands below

```
sudo nano /var/www/html/phpinfo.php
```

Then type the content below and save the file.

```php
<?php phpinfo( ); ?>
```

Save the file.. then browse to your server hostname followed by 

**/phpinfo.php**

**http://localhost/phpinfo.php**

You should see PHP default test page…

### Step 4: Create Magento 2 Database

Now that you’ve installed all the packages that are required for Magento 2 to function, continue below to start configuring the servers. First run the commands below to create a blank Magento 2 database.

To logon to MariaDB database server, run the commands below.

```
sudo mysql -u root -p
```

Then create a database called magento2

```sql
CREATE DATABASE magento2
```

Create a database user called magento2user with new password

```sql
CREATE USER 'magento2user'@'localhost' IDENTIFIED BY 'new_password_here';
```

Then grant the user full access to the database.

```sql
GRANT ALL ON magento2.* TO 'magento2user'@'localhost' IDENTIFIED BY 'user_password_here' WITH GRANT OPTION;
```

Finally, save your changes and exit.

```sql
FLUSH PRIVILEGES;
EXIT;
```

### Step 5: Download Magento 2 Latest Release

To get Magento 2 latest release you may want to use Github repository… Install Composer, Curl and other dependencies to get started…

```
sudo apt install curl git
curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer
```

After installing curl and Composer above, change into the Apache2 root directory and downaload Magento 2 packages from Github…

When prompted, enter your authentication keys. Your public key is your username; your private key is your password….  ( https://marketplace.magento.com/customer/accessKeys/ )

You’ll have to register for an account to create the key above….

```
cd /var/www/html
sudo composer create-project --repository=https://repo.magento.com/ magento/project-community-edition magento2
```

Then run the commands below to install Magento 2 with the following options:

+ The Magento software is installed in the root directory on localhost…. Admin is **admin**;  therefore: Your storefront URL is http://exmaple.com
+ The database server is on the same localhost as the webserver….
+ The database name is **magento2**, and the **magento2user** and password is **new_passwore_here**
+ Uses server **rewrites**
+ The Magento administrator has the following properties:
  + First and last name are: **Admin User**
  + Username is: **admin**
+ and the password is **admin123**
+ E-mail address is: **admin@example.com**
+ Default language is: **(U.S. English)**
+ Default currency is: **U.S. dollars**
+ Default time zone is: **U.S. Central (America/Chicago)**

The commands below:

```
cd /var/www/html/magento2
sudo bin/magento setup:install --base-url=http://example.com/ --db-host=localhost --db-name=magento2 --db-user=magento2user --db-password=new_password_here --admin-firstname=Admin --admin-lastname=User --admin-email=admin@example.com --admin-user=admin --admin-password=admin123 --language=en_US --currency=USD --timezone=America/Chicago --use-rewrites=1
```

Then run the commands below to set the correct permissions for Magento 2 to function.

```
sudo chown -R www-data:www-data /var/www/html/magento2/
sudo chmod -R 755 /var/www/html/magento2/
```

### Step 6: Configure Apache2

Finally, configure Apahce2 site configuration file for Magento 2. This file will control how users access Magento 2 content. Run the commands below to create a new configuration file called **magento2.conf**

```
sudo nano /etc/apache2/sites-available/magento2.conf
```

Then copy and paste the content below into the file and save it. Replace the highlighted line with your own domain name and directory root location.

```
<VirtualHost *:80>
     ServerAdmin admin@example.com
     DocumentRoot /var/www/html/magento2/
     ServerName example.com
     ServerAlias www.example.com

     <Directory /var/www/html/magento2/>
        Options Indexes FollowSymLinks MultiViews
        AllowOverride All
        Order allow,deny
        allow from all
     </Directory>

     ErrorLog ${APACHE_LOG_DIR}/error.log
     CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
```

Save the file and exit.

### Step 7: Enable the Magento 2 and Rewrite Module

After configuring the VirtualHost above, enable it by running the commands below

```
sudo a2ensite magento2.conf
sudo a2enmod rewrite
```

### Step 8 : Restart Apache2

To load all the settings above, restart Apache2 by running the commands below.

```
sudo systemctl restart apache2.service
```

Then open your browser and browse to the server domain name. You should see Magento 2 setup wizard to complete. Please follow the wizard carefully.

http://example.com/

Congratulation! You have successfully installed Magento 2 on Ubuntu 16.04 | 18.04 and may work on upcoming 18.10…

In the future when you want to upgrade to a new released version, simply run the commands below to upgrade…

```
cd /var/www/html/magento2
sudo bin/magento maintenance:enable
sudo composer require magento/product-community-edition 2.2.5 --no-update
sudo composer update
sudo php bin/magento setup:upgrade
sudo php bin/magento setup:di:compile
sudo php bin/magento indexer:reindex
sudo php bin/magento maintenance:disable
```

You may have to re-run the to update Apache2 directory permissions…

That’s it!

