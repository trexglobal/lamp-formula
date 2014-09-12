# Require:
#  https://github.com/trexglobal/apache-formula
#  https://github.com/trexglobal/php-formula
#  https://github.com/trexglobal/mysql-formula

include:
    - apache
    - apache.default
    - apache.vhosts.standard
    - apache.rewrite
    - apache.utils
    - mysql
    - .mysql
    - php
    - php.mysql
