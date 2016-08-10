# Require:
#  https://github.com/trexglobal/apache-formula
#  https://github.com/trexglobal/php-formula
#  https://github.com/trexglobal/mysql-formula

include:
    - apache
    - apache.vhosts.standard
    - apache.rewrite
    - apache.utils
    - mysql
    - .mysql
    - php
    - php.mysql

# Make sure gossip file is missing
/var/www/html/index.html:
  file:
    - absent

# Make sure default config file is missing
/etc/apache2/sites-enabled/000-default.conf:
  file:
    - absent
