LAMP SaltStack Formula
=============

To setup LAMP server.

## What it does

1. Install Apache server
2. Install MySQL server
3. Install PHP

## Install

1. Add remotes to /etc/salt/master
```yaml
gitfs_remotes:
  - git://github.com/trexglobal/lamp-formula
  - git://github.com/trexglobal/apache-formula
  - git://github.com/trexglobal/mysql-formula
  - git://github.com/trexglobal/php-formula
```
2. Setup [pillar](http://docs.saltstack.com/en/latest/topics/pillar/) from pillar.example
