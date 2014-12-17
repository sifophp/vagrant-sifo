# Vagrant LAMP Setup based on CentOS 7, provisioned with Puppet
This is a simple Vagrant provisioned thanks to Puppet and Librarian with the purpose of creating an installation of a SIFO application.

## Requires

  - [Vagrant](http://www.vagrantup.com)
  - [Vagrant-librarian-puppet](https://github.com/mhahn/vagrant-librarian-puppet)

Vagrant needs the plugin to install the puppet modules using Librarian.

Just execute once:

	vagrant plugin install vagrant-librarian-puppet

## Overview

LAMP environment based on CentOS, specially prepared for working with [SIFO PHP Framework](https://github.com/sifophp/SIFO) projects.

Contains:

* Apache
* MySQL
* PHP (with some useful packages)
* Memcached
* Redis
* BIND (resolving development domains .local, .vm and .lan)
* NTP (Network Time Protocol for system time synchronization)

## Installation

Clone this repo

```bash
git clone --recursive https://github.com/sifophp/vagrant-sifo
cd vagrant-sifo
vagrant up
```

The machine will be downloaded, all the packages installed and SIFO will be automatically cloned to `/www/sifo`. :)

Magic!

## Usage

* **Step 1.** **Add the VM as DNS server** In order to enable development DNS like `blahblah.local` or `blahblah.lan` or `blahblah.vm` you should edit your network
preferences and add as your DNS server the IP `192.168.33.10` which is the IP of this box. 
If you don't like this IP you can change it in the file `Vagrantfile`
*(If you prefer to add the addresses in your `/etc/hosts` file you can skip this step.)*

* **Step 2.** **Open the browser**
Now, you can reach the webroot with `http://centos.local` or SIFO homepage with `http://sifo.local`

**Some useful information:**

* The Mysql password for root is empty.
* To login into the VM type `vagrant ssh` or `ssh vagrant@192.168.33.10 -p 2222` *(password 'vagrant')*
* To halt the VM: `vagrant halt`
* To reload changes in the Vagrantfile: `vagrant reload`
* To reload changes in the puppet manifest: `vagrant provision`

If you want a graphical client to access Mysql from your machine, you can do it with a SSH tunnel:

```
SSH Host: localhost
SSH user: vagrant
SSH password: vagrant
SSH Port: 2222
MysqlHost: 127.0.0.1
Username: root
Password: #empty#
```
*There is no password, do not type "empty" :)*

You'll have two shared folders inside `shared` folder on project root:

* `www`: Your web DocumentRoot. You'll find `sifo` folder inside too.
* `logs`: Logs from Apache and MySQL will be stored here.

This two folders will be mapped on root (`/`) folder on your guest Virtual Machine with full permissions (777).
