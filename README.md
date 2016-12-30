# webster
A Simple Vagrant LAMP stack with PHP 7 and MariaDB. Viewing install.sh will give you an idea of what packages are being installed on the ubuntu/trusty64 box.

## Installation
This assumes you are installing the box on a Mac.
1. [Install VirtualBox](https://www.virtualbox.org/wiki/Downloads)
2. [Install Vagrant](https://www.vagrantup.com/downloads.html)
3. Clone this repository
4. In your terminal window, navigate to the cloned directory and run "vagrant up"

## Connecting via your favorite DB management tool
After you install webster via vagrant up and the box is provisioned and running, you can connect to MariaDB using the following:
* MySQL Host: 127.0.0.1
* Username: root
* Password: root
* Port: 3306
* SSH Host: 127.0.0.1
* SSH User: vagrant
* SSH Password Key File Path: /webster/.vagrant/machines/default/virtualbox/private_key
* SSH Port: 2222

## Notes
* Sites dropped into the web directory in this repository will be rendered when visiting the VM IP. By default you will see a PHP info page.
* You can view your site at http://192.168.33.101 or update your /etc/hosts file to map it to a URL.
