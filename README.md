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
    - git://github.com/trexglobal/monit-formula
    - git://github.com/trexglobal/lamp-formula
    - git://github.com/trexglobal/apache-formula
    - git://github.com/trexglobal/mysql-formula
    - git://github.com/trexglobal/php-formula
  ```

2. Setup [pillar](http://docs.saltstack.com/en/latest/topics/pillar/) from pillar.example
3. Add lamp to your server [state file](http://docs.saltstack.com/en/latest/topics/tutorials/starting_states.html)

  ```yaml
  include:
      - lamp
  ```

  or to the [top.sls](http://docs.saltstack.com/en/latest/ref/states/top.html) file

  ```yaml
  base:
    'wordpress.blog.example.com':
      - lamp
  ```
4. You have to disable monit during MySQL import

  ```bash
  $ monit unmonitor mysql
  $ mysql < importfile.sql
  $ monit monitor mysql
  ```

  Otherwise import will fail on small instances.
